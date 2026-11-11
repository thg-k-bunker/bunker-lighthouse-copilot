# Briefing do alinhamento · Jornada Marketing Cloud Metax

**Uso interno do Thiago.** Montado em 05/10/2026, à noite, a pedido dele. Junta tudo o que foi discutido nas sessões de 02 a 05/10 e o que está no quadro de issues (`Bunker-Growth-and-Sales-Intelligence/metax-salesforce`) e no mapa (`Documents\Bunker\Metax\onde-paramos.md`).

**Como o alinhamento acontece** (combinado):
1. **Primeiro, Thiago e Guilherme** (parte A).
2. **Depois, uma reunião única com a Metax** (parte B), que o Thiago só faz com o trabalho dele terminado.

A parte C são decisões só do Thiago, que não vão para nenhuma das duas conversas. O anexo traz a fila de issues.

---

## Atualização de 06/10: a conversa com o Guilherme aconteceu (05/10, 22h23)

- **A nova ordem:** (1) especificação funcional por e-mail, só texto, com "de acordo" formal da Metax, e **nada da jornada nem dos e-mails mostrado antes disso**; em paralelo, o layout dos e-mails (o Thiago monta, sobre o modelo institucional da Metax) e o guia; (2) com o de acordo, o texto dos 7 e a montagem; (3) revisão pelo Claude, apresentação e ativação. A reunião com a Metax (parte B) fica para depois do de acordo, e parte dela pode ir no próprio e-mail da especificação.
- **A1 (#30):** o Guilherme está abrindo o caso pelo Claude dele (valor negociado de 750 já aceito) e manda a **work order**, que o Thiago aceita, anexa a documentação e envia ao cliente. A especificação está no **rascunho 8** (`docs/jornada-mc/especificacao.md`, branch `docs/i30-especificacao-e-layout`).
- **A2:** resolvido no rascunho 8. A regra entra como "conversa registrada no Salesforce", e o WhatsApp fica fora de escopo (o Guilherme: "completamente fora de escopo"). O que conta como conversa depende do deploy da #35.
- **B1 (remetente), lido em 06/10:** as 7 atividades da jornada usam a classificação "Metax - Comercial" e o remetente **"Metax - No Reply" (`noreply@go.metax.com.br`)**. Quem responde recebe uma resposta automática ("Este endereço de e-mail não recebe respostas"), e a resposta é encaminhada para `marketing@metax.com.br`, que não é usuário do Salesforce. **A resposta ao e-mail da jornada não chega ao consultor e não liga o "respondeu".** A solução é o botão do e-mail (especificação, item 7): o caminho que fica registrado é o botão que leva ao e-mail do consultor dono da oportunidade. Isso exige acrescentar o nome e o e-mail do consultor à carga. Decisão do Thiago. Para a Metax, fica só a pergunta de quem acompanha a caixa `marketing@`.
- **B3 (conteúdo):** o Guilherme quer os e-mails com aparência profissional ("pentear o macaco") antes da entrega. A Metax já tem um modelo institucional no Content Builder (`Email_Template`) e uma campanha própria em rascunho (`[Nutrição] [Campinas] Leads Frios`), que servem de referência de tom e de layout.
- **Não foram tratados:** A3 (review do Claude), A4 (e-mail pós-fechamento) e B2 (alerta de falha).
- **Agenda:** reunião na **sexta, 09/10**, sobre o Outlook com o Marketing Cloud (EWS e Microsoft Graph), que o Thiago marca. O Guilherme também ofereceu conversar com calma sobre a Metax em 06/10.

---

## Onde o projeto está (05/10)

- **Integração Sales Cloud → Marketing Cloud em produção.** A carga roda todo dia às 5h. As cargas de 03, 04 e 05/10 rodaram sem erro (3 de 5 da semana de aceite; o mínimo fecha em 09/10). A base tem 138 contatos, 112 com negociação aberta.
- **Jornada montada, em rascunho, sem ativar:** 7 e-mails (dias 1, 7, 14, 21, 28, 45 e despedida no 90), regras de saída e validação sem erro.
- **Novo em 05/10, em produção:** a conversa pelo WhatsApp registrada no Salesforce mede a temperatura. O último WhatsApp depois da oportunidade vira o novo dia 0, e o próximo e-mail só sai no dia 7. Hoje isso mexe na contagem de 6 contatos.
- **Pronto, mas não em produção:** o e-mail enviado pelo consultor, o WhatsApp registrado só na oportunidade e a conversa nos 7 dias antes da oportunidade também passam a contar (#35). Está provado na sandbox, e o deploy espera a decisão do Thiago.
- **Falta para o aceite:** o conteúdo dos 7 e-mails, a ativação, o fim da semana de cargas sem falha e a documentação (o guia do Raphael está em revisão, no rascunho 3).
- **Quadro de issues:** 64% do trabalho medido feito; 16 issues abertas, 17 fechadas.

---

## Pauta curta para 07/10 (a conversa de 06/10 não aconteceu)

**Ficou em aberto em 05/10:** (1) work order da Metax (#30): confirmar se é a Metax (trecho truncado) e se já saiu; (2) quem recebe o alerta de falha depois da entrega; (3) review do Claude nos PRs parado por falta de saldo, e a ideia de acesso de admin contratual; (4) e-mail pós-fechamento, como ideia.

**Novo desde então:** (1) especificação pronta para o de acordo (rascunho 9): confirmar o envio por e-mail à Virginia e ao Raphael e a cláusula "mudança depois do aceite é demanda nova"; (2) a resposta ao e-mail da jornada caía no noreply e ia para `marketing@`: a solução (botão para o consultor) já está em produção; a Metax precisa saber da caixa `marketing@`?; (3) 3 contatos de cliente com o e-mail de um colaborador da Metax: quem avisa a Metax; (4) reunião de sexta, 09/10, sobre o EWS e o Einstein: está marcada?; (5) o que subiu em 06/10 (conversa do consultor, uma pessoa um e-mail, botão para o consultor). Se sobrar tempo: a campanha `[Nutrição] [Campinas] Leads Frios` da Metax, em rascunho, pode falar com as mesmas pessoas se for ativada.

---

## A. Com o Guilherme (Bunker)

1. **Caso de aceite da Metax no portal (#30).** Falta o Guilherme criar o caso. **Pedir uma data.** A especificação está no rascunho 7 (7 e-mails).
2. **A especificação precisa da regra nova antes do aceite.** A temperatura pela conversa do consultor (WhatsApp, e e-mail se a #35 subir) não está nela. Proposta: rascunho 8, com uma linha sobre a regra e a ressalva de que só conta o que estiver registrado no Salesforce. **Decidir se isso é ajuste dentro do escopo**, que é a leitura da Bunker por ser parte da régua já combinada.
3. **Review automático do Claude nos PRs parado.** O app pula o review porque a organização está sem saldo de uso extra. Um admin precisa adicionar créditos ou subir o limite em claude.ai/admin-settings/usage. Não bloqueia merge. **Abertura sugerida:** usar o caso para perguntar se não vale virar obrigação contratual de quem contrata o serviço fornecer acesso de admin às contas.
4. **E-mail automático pós-fechamento** (sugestão do Thiago, 02/10): um e-mail corporativo para quem fechou o negócio, no momento de entusiasmo, ligado ao onboarding que a Bunker vai fazer. **Levar como ideia**, com uma proposta curta, e não como escopo atual.
5. **Antes da reunião com a Metax, alinhar com o Guilherme a posição da Bunker** nos itens B1 (remetente) e B2 (alerta de falha).

---

## B. Com a Metax (reunião única)

### Decisões que só a Metax pode tomar

1. **Remetente dos e-mails e caixa de resposta.** Vai ser o remetente da DASP?
   **Requisito técnico (a Bunker recomenda):** a resposta do cliente precisa chegar a uma caixa que o Salesforce registra, como a do vendedor dono da oportunidade ou uma caixa integrada ao Outlook. Se a resposta cair num endereço genérico que ninguém registra, o sinal de "respondeu" não liga e o cliente continua recebendo a sequência.
2. **Quem recebe o alerta de falha da carga.** Hoje vai para a Bunker até o aceite. Depois: o Luiz Raphael? Outra pessoa? Entra em cópia já agora?
3. **Conteúdo dos 7 e-mails.** A Bunker escreve, monta e testa; a Metax aprova os 7 numa rodada só, com prévia. Para escrever, a Bunker precisa de:
   - o perfil do lead típico (cargo, tipo de obra);
   - as 3 objeções mais comuns na fase de proposta;
   - 2 ou 3 casos que a Metax autoriza citar;
   - o tom de voz com o cliente;
   - quem assina.

   **Regra a combinar:** cada e-mail com uma única ação, que é responder ao vendedor. Os e-mails quentes (dias 7 e 14) podem chegar uma segunda vez depois de uma conversa com o consultor, então são escritos como "retomando a nossa conversa".
4. **Data de ativação**, depois da aprovação do conteúdo.

### Como os consultores usam o Salesforce (afeta o resultado da jornada)

5. **WhatsApp: registrar a conversa pelo botão.** A jornada só enxerga o WhatsApp registrado.
   - **Medido em 05/10:** 33 registros em 3 semanas (17/09 a 05/10), de 5 consultores, com 26 pessoas.
   - **Canal preferido:** WhatsApp é o canal de 42 dos 113 contatos da jornada (38%), contra 20 de e-mail.
   - **Pedido:** que os consultores usem o botão "Enviar mensagem WhatsApp" a cada conversa. A conversa que não é registrada não segura os e-mails da jornada.
6. **O fluxo do botão de WhatsApp grava a data da atividade em 01/01/1900** (o fluxo usa `$System.OriginDateTime`). O Salesforce arquiva essas tarefas na hora, e elas somem das listas e relatórios comuns: 20 das 33 já estavam arquivadas. A Bunker contornou o problema na carga, mas o fluxo é da Metax/DaspeWeb. **Quem corrige?** A correção é trocar a data para "hoje".
7. **E-mail do consultor** (se a #35 for ao ar): os e-mails que o consultor manda pelo e-mail integrado ao Salesforce também seguram a jornada. Em 30 dias, foram 66 e-mails a 39 contatos. **Informar:** e-mail enviado fora da integração não conta.
8. **Negociações com várias pessoas:** a contagem é por pessoa. Conversar com o comprador não segura os e-mails do engenheiro da mesma negociação. Hoje são 5 oportunidades, com 11 contatos. **Validar com a Metax** se está bom assim.

### Cadastro e dados

9. **Oportunidades sem contato vinculado ficam fora da jornada** (38, medido em 29/09). Precisam de contato com e-mail na oportunidade.
10. **Cadastro duplicado:** um mesmo endereço de e-mail está em 3 contatos diferentes da jornada, e essa pessoa pode receber o mesmo e-mail repetido. Juntar os contatos no Salesforce.
11. **Histórico de negócios perdidos:** no Salesforce, as oportunidades começam em 14/09/2026 (224, só 14 perdidas). **Onde está o histórico anterior?** Ele serve para, depois, recalibrar a régua de temperatura com dado real.

### Achados na org da Metax (fora do escopo, só para avisar)

12. **O fluxo `DW_Opportunity_Flow_After_Solicitacao_liberacao_visita_antecipada` nunca dispara:** procura a etapa "Aprovação financeira", mas a etapa se chama "Aprovação financeria".
13. **A rotina diária da integração roda com o usuário da DaspeWeb** (metax@daspeweb.com.br). Se esse usuário for desativado ou perder acesso, a carga para. **Definir o dono da rotina** no fim do projeto.
14. **Há um grupo de atributos "Jornada Metax" vazio no Contact Builder**, criado na montagem. A Bunker não tem permissão de editar o modelo de dados, então quem tiver permissão deve remover.

---

## C. Decisões só do Thiago (não levar)

- **#35:** fazer o deploy (precisa da liberação nas permissões do Claude Code) ou revisar antes.
- **Revisão do critério alterado:** o controle da #34 passou o WhatsApp de 5 para 10 dias antes da oportunidade (escrito no teste).
- **Guia do Raphael (#21):** revisão do texto e, com o ok, o PDF no padrão Bunker. Caminho: `C:\Users\User\code\metax-salesforce\docs\jornada-mc\guia-raphael.md`.
- **#36, para depois de tudo finalizado:** enxugar a estrutura (parar a conferência diária depois de 09/10, apagar a jornada e os e-mails `[TESTE]`, tirar campos sem uso).

---

## Anexo · Fila de issues abertas (05/10/2026, 21h)

| Etapa | Issues |
|---|---|
| Reteste | #26, #27 e #28 (fecham em 09/10 se a semana fechar sem falha) e #34 (WhatsApp na temperatura; fecha com a ativação) |
| No ar | #17 (implantar e ativar; fecha com a ativação) e #19 (status diário) |
| Pronto para deploy | #35 (conversa do consultor) |
| Provado | #15 e #16 (jornada e testes de entrada e saída; sobem com a ativação) e #21 (guia) |
| Medindo | #30 (especificação e caso de aceite) e #31 (conteúdo dos 7 e-mails, a última etapa) |
| Triagem, para o fim | #4 (oportunidades sem contato), #18 (recalibrar a régua), #33 (usuário da rotina) e #36 (enxugar a estrutura) |
