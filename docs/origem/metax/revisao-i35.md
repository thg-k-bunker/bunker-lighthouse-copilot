# Revisão da #35: a conversa do consultor conta na temperatura

Branch `feat/i35-conversa-do-consultor`, commit `9c1f5b4` (05/10, 18:49), comparada com a `main`. Ainda **não** está na produção. Leitura de uns 15 min.

## 1. O que muda para o contato

A regra da #34 continua igual: a última conversa depois da oportunidade vira o novo dia 0, e o próximo e-mail é o do dia 7 (o dia 1 é pulado). A #35 aumenta o que conta como "conversa".

| Regra | Caso | Hoje (#34) | Com a #35 |
|---|---|---|---|
| **E-mail enviado pelo consultor** | Oportunidade criada em 29/09. Em 01/10 o consultor manda a "PROPOSTA COMERCIAL METAX" pelo e-mail do Salesforce. | O e-mail não conta. A contagem segue de 29/09, e o e-mail do dia 7 sai em **06/10**, cinco dias depois da proposta. | 01/10 vira o dia 0. Nada sai até o dia 7, **08/10**. |
| **WhatsApp registrado só na oportunidade** | Oportunidade de 25/09 com Ana e Bruno. Em 29/09 o consultor cria a tarefa "WHATSAPP" na oportunidade, sem preencher o contato. | A tarefa não conta. O e-mail do dia 7 sai em **02/10**. | 29/09 vira o dia 0 **para a Ana e para o Bruno** (todos os contatos daquela oportunidade). O e-mail do dia 7 vai para **06/10**. |
| **Conversa nos 7 dias antes da oportunidade** | WhatsApp com o lead em 03/10, às 14h. Ele é convertido e a oportunidade nasce às 16h. | O WhatsApp é anterior, então não conta. O e-mail do dia 1 sai em **04/10** de manhã. | O dia 0 continua 03/10 (a data da oportunidade), mas o dia 1 é pulado. O primeiro e-mail é o do dia 7, **10/10**. |

A contagem continua **por pessoa**: um e-mail para a Ana não segura os e-mails do Bruno. A exceção é a regra 2, em que o WhatsApp sem contato vale para todos os contatos daquela oportunidade.

## 2. O que muda no código

**`JornadaContatoBatch`** (a rotina das 05:00). Em vez de buscar só o WhatsApp, ela agora busca a "última conversa" de cada contato em três lugares:
1. **Tarefa de WhatsApp no contato**: tarefa cujo contato é a pessoa, com "whats" em qualquer parte do assunto, inclusive as arquivadas e excluindo as que estão na lixeira. Isso já existia. A mudança é que a busca agora começa **97 dias atrás** (antes eram 90), para alcançar os 7 dias anteriores a uma oportunidade antiga.
2. **Tarefa de WhatsApp na oportunidade** (novo): tarefa ligada a uma das oportunidades do contato que já entram na carga (abertas ou fechadas nos últimos 90 dias), **com o campo de contato vazio**, "whats" no assunto e o mesmo período de 97 dias. Ela vale para todos os contatos daquela oportunidade.
3. **E-mail enviado** (novo): mensagem de e-mail registrada no Salesforce em que o contato aparece como **destinatário ("Para") ou em cópia ("Cc")**, que **não é recebida** (ou seja, saiu da Metax), criada por um usuário do tipo **"Standard"** (usuário com licença normal, que exclui o usuário interno de automação da plataforma), com data de envio nos últimos 97 dias. Cópia oculta (Cco) não conta.

Das três fontes, vale a mais recente.

**`JornadaContatoBuilder`** (monta a linha da DE):
- Conversa **depois** da criação da oportunidade usada: `DataReferencia` passa a ser a data da conversa e `ReferenciaWhatsApp` = verdadeiro. É a #34.
- Conversa **até 7 dias (168 h) antes** da oportunidade: `DataReferencia` continua sendo a data da oportunidade e `ReferenciaWhatsApp` = verdadeiro, o que faz pular o dia 1. Isso é novo.
- O número 7 virou uma constante com nome (`JANELA_CONVERSA_ANTES_DIAS`).

**`JornadaContatoBatchTest`**: 3 provas novas e o controle da #34 ajustado (o WhatsApp antigo passou de 15 para 20 dias atrás, ou seja, de 5 para 10 dias antes da oportunidade). **`docs/jornada-mc/contrato-de-dados.md`**: atualizada a definição de `DataReferencia` e `ReferenciaWhatsApp`.

A DE, os nomes das colunas e a jornada **não mudam**. A coluna `ReferenciaWhatsApp` mantém o nome e passa a significar "houve conversa do consultor".

## 3. As provas

| Teste | O que prova | Sem a correção | Com ela |
|---|---|---|---|
| `executeContaODiaPeloUltimoEmailEnviadoPeloConsultor` | E-mail enviado 4 dias atrás, com oportunidade de 10 dias atrás: o dia 0 vira a data do e-mail, e o contato **não** é marcado como "Respondeu". | vermelho (esperado 01/10, veio 25/09) | verde |
| `executeContaOWhatsAppRegistradoSoNaOportunidade` | Tarefa "WHATSAPP" na oportunidade, sem contato, de 1 dia atrás: reinicia a contagem da Ana. | vermelho (esperado 04/10, veio 25/09) | verde |
| `executePulaODia1QuandoHouveConversaLogoAntesDaOportunidade` | WhatsApp 2 h antes da oportunidade: pula o dia 1, e o dia 0 continua sendo o da oportunidade. | vermelho (`ReferenciaWhatsApp` falso) | verde |
| `executeContaPelaOportunidadeQuandoNaoHaWhatsAppDepoisDela` (controle da #34, **critério alterado**, aprovado por você em 05/10) | WhatsApp **10** dias antes da oportunidade não mexe em nada. | verde | verde |

Execuções na metax-dev: vermelho no código de hoje `707Ha000018aCIq` (17 aprovados e 3 vermelhos); vermelho de novo ao desfazer a correção `707Ha000018a3LP`; verde **48 de 48** na suíte da integração `707Ha000018a7KA`. Cobertura: Batch 99%, Builder 100%, Schedulable 100%, MarketingCloudClient 100%.

**Situações sem teste:** e-mail de automação ficando de fora; e-mail em Cc; a contagem por pessoa (nenhum teste mostra que a conversa com a Ana não mexe em outro contato da mesma oportunidade com e-mail); e-mail enviado mais de 7 dias antes da oportunidade.

## 4. Riscos e o que conferir

**Pode contar como conversa algo que não é conversa:**
- **Automação que roda em nome de uma pessoa (risco real).** O filtro olha o *tipo* do usuário, e não se uma pessoa escreveu o e-mail. Fluxo que manda e-mail, e-mail disparado por botão, regra de resposta automática ou usuário de integração com licença normal entram como "Standard". A medição da issue foi feita pelo perfil dos consultores (`DWUsuarioPadrao`: 11 consultores, 66 e-mails, 39 contatos). O código usa um filtro mais largo. **Conferir antes do deploy**, só leitura na produção: quem são os remetentes, e com qual perfil, dos e-mails enviados a contatos da jornada nos últimos 30 dias. Se aparecer alguém além dos 11, o filtro deveria ser pelo perfil.
- **E-mails da própria jornada.** Se algum envio do Marketing Cloud for registrado no Salesforce como e-mail enviado por um usuário Standard, cada e-mail da jornada reiniciaria a contagem e a jornada se calaria sozinha. Pelo padrão do Marketing Cloud Connect isso não acontece, porque ele grava em outro objeto. Mesmo assim, conferir no primeiro dia com a jornada ativa: nenhum e-mail com o assunto da jornada no histórico do contato.
- **Rascunho.** O código não exige que o e-mail esteja "Enviado" (o teste usa status Enviado, mas a busca não filtra). Um rascunho salvo pode contar, se tiver data. Isso não foi conferido.
- **E-mail para muitos.** Um e-mail com 20 contatos em "Para" ou "Cc", ou um e-mail em lista, se gerar registro por destinatário, reinicia a contagem de todos. É o que a regra "destinatário ou cópia" diz, mas vale saber.
- **Lembrete de WhatsApp.** Isso já vinha da #34 e agora vale também na oportunidade: uma tarefa *a fazer* com "whats" no assunto ("Mandar WhatsApp amanhã") conta como conversa no dia em que foi criada, porque o código não olha o status da tarefa.
- **A data de 01/01/1900 do botão de WhatsApp não atrapalha.** O código usa a data de criação da tarefa, e não a data da atividade, e lê as arquivadas. O arquivamento não dá para simular em teste: só se prova na produção, como na #34.
- **WhatsApp na oportunidade abre uma exceção à contagem por pessoa.** Ele vale para todos os contatos da oportunidade, inclusive de uma oportunidade fechada nos últimos 90 dias ou de uma mais antiga que não é a usada. Foi decidido assim e afeta 5 oportunidades com 11 contatos hoje.
- **Conversa antes da conversão por e-mail:** a regra 3 só foi provada com WhatsApp. Não sei se um e-mail enviado ao *lead* passa para o contato na conversão. Pode ser que só o WhatsApp conte nesse caso.

**Limites:** cada lote de 200 contatos passa de 4 para 6 consultas, bem abaixo do limite de 200 por lote. Com 113 contatos na jornada, tudo cabe em um lote só. Não é preocupação nesse volume.

## 5. Como sobe e como desfaz

- **Subir (só com o seu ok na hora):** deploy de `JornadaContatoBatch`, `JornadaContatoBuilder` e `JornadaContatoBatchTest`, rodando os testes da integração. O Salesforce recusa deploy de classe com job agendado, então é preciso **cancelar o agendamento das 05:00** (`08ebL00000YLWhFQAX`, criado na #34), fazer o deploy e **recriar** com `JornadaContatoSchedulable.agendar()`. É o mesmo caminho da #32 e da #34, e a opção da org que permite deploy com job pendente continua desligada. A DE e a jornada não mudam.
- **Conferir no dia seguinte:** o job das 05:00 "Concluído" sem erro, e na DE os contatos dos casos reais (os 39 do e-mail, os 5 do WhatsApp antes da conversão e as 2 tarefas na oportunidade) com `DataReferencia` e `ReferenciaWhatsApp` novos.
- **Desfazer:** redeploy das três classes como estão na `main`, com o mesmo cancelar e recriar do agendamento. Na carga seguinte das 05:00, a DE volta a ter as datas da #34. Não há dado a limpar. Como a jornada ainda está em rascunho, nenhum e-mail sai enquanto isso.

## 6. Perguntas para você decidir

1. **Quem conta como "consultor" no e-mail:** qualquer usuário com licença normal (como está) ou só o perfil dos consultores (`DWUsuarioPadrao`, que foi o que a medição usou)? A sugestão é fazer a consulta de remetentes do item 4 antes de responder.
2. **Rascunho e lembrete:** pedir antes do deploy o ajuste para contar só e-mail com status "Enviado" e só tarefa de WhatsApp concluída? É pequeno, mas exige rodar o par de testes de novo.
3. **Subir assim e ajustar depois, ou ajustar antes?** A jornada está em rascunho, então não há pressa. O ajuste antes evita uma segunda janela de cancelar e recriar o agendamento.

## 7. Medição dos remetentes (06/10, à tarde, produção, só leitura)

E-mails enviados (não recebidos) a contatos, em "Para" ou "Cc", nos últimos 30 dias: **480 registros**.
- **Por quem criou:** 425 por usuário **Standard**, todos do perfil `DWUsuarioPadrao` (os consultores); 55 pelo **processo automático** (`AutomatedProcess`). Nenhum de outro perfil.
- **Status:** os 480 estão como "Enviado". **Não há rascunho**, então o risco do rascunho (item 4) não aparece hoje.
- **Para e Cc:** 398 em "Para" e 82 em "Cc".

**Achado 1, que muda a pergunta 1: o filtro "Standard" deixa de fora e-mails reais do consultor.** Dos 55 do processo automático, **53 são capturas do Einstein Activity Capture** ("Nenhum assunto – captura apenas de cabeçalho em …"), ou seja, e-mails que o consultor mandou pela caixa dele e que o Einstein registrou só com o cabeçalho. Outras 28 capturas iguais aparecem como Standard. **Com o filtro de hoje, cerca de 2 de cada 3 capturas do Einstein não contam como conversa.** Com o fim do EWS, a captura do Einstein tende a ser o caminho principal, e a parcela que fica de fora cresce. Os 2 restantes do processo automático parecem envio de sistema (uma medição e um "SMS - Orçamento").

**Achado 2: nem todo e-mail do consultor é sobre a proposta.** Entre os Standard aparecem **medições** (19 + 14 + 6) e **faturas** (15) para clientes que já têm contrato. Com a #35, uma fatura enviada a um contato que também tem uma proposta aberta reinicia a contagem: ele passa uma semana sem e-mail da jornada. Isso é defensável (a Metax está em contato com ele), mas é uma escolha.

**Sugestão para a pergunta 1, simulada:** contar o e-mail enviado ao contato quando foi criado por um consultor (`DWUsuarioPadrao`) **ou** pela captura do Einstein (processo automático com assunto "captura apenas de cabeçalho"). Caso: o consultor escreve à Marina pelo Outlook em 01/10, e o Einstein registra só o cabeçalho. Com o filtro de hoje, não conta, e ela recebe o e-mail do dia 7 em 06/10, no meio da conversa. Com a sugestão, conta, e o próximo e-mail só sai em 08/10.