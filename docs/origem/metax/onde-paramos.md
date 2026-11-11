# Jornada Marketing Cloud · Metax: onde paramos (atualizado em 09/10/2026)

> **Para a sessão nova:** este arquivo é o MAPA. A fonte da verdade são as issues de `Bunker-Growth-and-Sales-Intelligence/metax-salesforce` (ids de execução, commits e prints). Antes de agir, confira aqui contra as issues. O escopo vale pelo direcionamento do Guilherme (24/09 e reunião de 05/10, 22h23), e não pelo e-mail da Opção 2 (ver as memórias). **A seção "09/10" abaixo é o estado atual; as seções seguintes são o histórico.** O código está na `main` do clone `C:\Users\User\code\metax-salesforce` (o clone drift ficou só de histórico).

## 09/10/2026: ESTADO ATUAL

> **19/10/2026: a Virginia também aceitou** e pediu uma data. O Thiago sugeriu **quarta, 21/10, de manhã** para a reunião de entrega (a confirmar). Preparação da reunião em `docs/entrega/reuniao/` no clone.

> **ATUALIZAÇÃO DO THIAGO (15/10/2026): o aceite está DADO.** O Luiz Raphael já disse que por ele está certo; falta o retorno formal da Virginia ao e-mail de aceite. A correção de 13/10 ("aceite não dado") foi superada. **Falta só a reunião de apresentação:** a Virginia ainda não deu horário; o Lucas falou com ela em 15/10 e mandaram nova mensagem pelo Outlook, sem retorno. Depois da reunião: combinar a data de ativação e ativar (só com o ok do Thiago na hora).
>
> **Plano do Thiago (15/10, noite):** o Raphael respondeu "Por mim de acordo" por e-mail (#30). O guia **ainda não foi enviado**: vai junto com a apresentação. Em 16/10, o Thiago vê com o Guilherme ou o Lucas se dá para **ativar a jornada antes da apresentação**, reunir-se direto com o Raphael (e entregar o guia nessa conversa) e deixar a reunião completa com a Virginia para quando ela der horário. A reunião com a Virginia importa para a relação comercial: deixar aberta a possibilidade de outras soluções, sem oferta direta.

> **Última conferência registrada: 09/10/2026** (cargas de 08 e 09/10, 0 erros; semana de aceite fechada, 7 de 7). A próxima conferência vale a partir de 10/10. **Não repetir** o que esta seção dá como feito.

### Feito em 09/10
- **Fechamento pedido pelo Guilherme (#39 a #42; memória `metax-fechamento-guilherme`):** PRs #43 (código da #35, #37 e #38) e #44 (docs) mergeadas; 12 branches cobertas apagadas; **#45** (main igual à produção, retrieve da org inteira) mergeada. Retrieve: jornada igual na produção, na sandbox `metax-klockdev` e na `main`; nada customizado só na sandbox (detalhe na #40).
- **Issues fechadas em 09/10:** #26, #27, #28 (semana de aceite), #39, #40, #34, #35, #37, #38, #15, #16, #19, #33 e #36 (as duas últimas como "não planejadas"), #30 (aceite da Metax; a prova, um e-mail, vem pelo Guilherme). **Abertas (5): #17 (ativação), #21 (guia), #31 (e-mails), #41 (deck), #42 (reunião de entrega até 16/10).**
- **A Metax aceitou a especificação** (rascunho 10) antes da reunião; a reunião de entrega da #42 (Thiago, Lucas e Virginia Santos, gravada no Teams) **ainda não aconteceu**.
- **Os 7 e-mails definitivos** no Content Builder e nas atividades do rascunho da jornada (nada ativado). Texto e lógica de cada um em `docs/jornada-mc/textos-e-logica-emails.docx`; registro na #31. Ids (legacy) das atividades: dia 1 = 11011, dia 7 = 10969, dia 14 = 11017, dia 21 = 11012, dia 28 = 11016, dia 45 = 11018, dia 90 = 11019. Padrão: margem de 40 px, título com e sem nome no bloco de variáveis, pré-cabeçalho com entidades, botão `mailto` com assunto e corpo prontos (`@linkConsultor`, terminando em `&x=`), rodapé citando o nome do botão. Dia 1 sem botão; dia 90 com botão "Ainda tenho interesse" para o consultor (a especificação aceita dizia site; decisão do Thiago).
- **Testes na caixa (teste da jornada, só para thg.k@bunkerconsultancy.com):** dias 1, 7, 14 e 21 com contatos reais do dia; 28, 45 e 90 com 3 linhas `TESTE-D28/D45/D90` gravadas na DE real com o ok do Thiago e **apagadas logo depois** (DE de volta a 162 reais, 0 TESTE). Depois dos testes, o Thiago ajustou o e-mail 4 (perguntas encurtadas) e o 6 ("nos conte quando faria sentido"), e editou o 7 à mão.
- **Deck da #41 pronto:** `docs/entrega/deck-entrega-jornada-metax.pdf` e `.pptx` (14 slides, bunker-deck-copilot + `docs/entrega/montar_deck.py` com os tipos `print` e `galeria`; roteiro em `deck-entrega.json`; prints em `docs/entrega/prints`, contato borrado). Para regerar no Windows: `$env:BUNKER_CHROME = 'C:\Program Files\Google\Chrome\Application\chrome.exe'; python montar_deck.py deck-entrega.json --pdf --pptx --conferir`.
- **Git:** branch `docs/i31-emails-e-fechamento` (último commit `a735f2b`), **PR #46 aberta para a main, esperando o ok do Thiago** (deck, e-mails, manifesto).
- **Scripts novos em `scripts-mc/`:** `GRAVA-criar-email-dia*.apex` (cópia do e-mail do dia 7 pela API, com ensaio), `GRAVA-trocar-texto-email.apex` (troca de trecho com contagem), `GRAVA-margens-texto-email.apex`, `GRAVA-revisao-email-dia7.apex`, `GRAVA-inserir-linhas-teste-28-45-90.apex` / `GRAVA-apagar-linhas-teste-28-45-90.apex`, `ler-assets-jornada.apex` (JSON dos 7 e-mails), `ler-fase-por-faixa.apex`, `ler-escopo-credencial.apex`. **Cuidados:** gravar o arquivo `.apex` sem BOM (no PowerShell, `[IO.File]::WriteAllText` com `UTF8Encoding $false`); escolher a mensagem de novo numa atividade renomeia a atividade (restaurar o nome); mudança só de corpo não exige escolher de novo, mudança de assunto ou pré-cabeçalho exige.

### O que fazer AGORA
1. **Conferência da manhã de 10/10 em diante** (só leitura, como antes) e registro na #32.
2. **PR #46:** merge só com o ok do Thiago.
3. **#21 (guia do Raphael):** atualizar o conteúdo (está no rascunho 5, de 06/10, com o aviso "RASCUNHO INTERNO"; falta cobrir os 7 e-mails definitivos e o botão para o consultor, refazer o print 3.3 da Divisão 1 com `ForaDaJornada`, incluir "o consultor cria a tarefa de retorno" do e-mail 6) e gerar o PDF no padrão Bunker (bunker-doc-copilot). Pedido do Thiago em 09/10.
4. **#41:** fecha quando o Guilherme vir o deck. Falta um print opcional: o e-mail de teste na caixa do Thiago (ele manda o print do celular).
5. **#42 e #17:** reunião de entrega até 16/10 e ativação na data combinada nela (trocar a data de início do agendamento da entrada, que diz 03/10).
6. **Pauta da reunião da #42 (Thiago, 10/10):** o registro dos e-mails no Salesforce pelo EWS, que vai ser descontinuado. Sem ele, o `Respondeu` e o e-mail do consultor param de funcionar sem aviso. O guia ensina a conferir; a Metax decide quem acompanha (comentário na #42).
7. **Feito em 10/10, madrugada:** guia 1.0 no PDF (capa aos cuidados de Virginia, Raphael e Marketing da Metax, de Bunker Consultancy; sem dependência da Bunker no texto); aviso de falha na produção para `luiz.goncalves@metax.com.br` (deploy `0AfbL000001SPu9SAG`, 19/19 testes; registro na #17). Commits na branch da PR #46. A #21 fica aberta até o Thiago terminar de ler. O agendamento é do usuário "Consultoria Daspe Web", que tem o conjunto de permissões.
8. **10/10, depois:** guia aprovado pelo Thiago e **#21 fechada** (link do PDF no comentário de fechamento); deck da #41 atualizado (slides 3, 11 e 13; commit `3d63817`). Abertas: #17, #31, #41, #42. PR #46 com tudo, esperando o ok do Thiago para o merge.
9. **10/10, FECHAMENTO: zero issues abertas.** PR #46 mergeada na `main` (`86901a0`); nenhuma PR aberta e nenhuma branch fora da `main`. O Thiago fechou #17, #31, #41 e #42 antes da reunião. **Continua valendo, sem issue (lista no último comentário da #42):** a reunião com o Lucas e a Virginia até 16/10; a **ativação da jornada, que segue em RASCUNHO** (trocar a data de início da entrada, que diz 03/10, validar e ativar, só com o ok do Thiago na hora); o Guilherme ver o deck; a pauta do dia 90 e do EWS; a entrega do guia ao Raphael; o caso 00002414 na org da Bunker (prazo final 16/10).

## 07/10/2026 (histórico)

> **Última conferência registrada: 09/10/2026** (cargas de 08/10, job `707bL000016JRTbQAO`, e 09/10, job `707bL000016aXVeQAM`, 0 erros; semana de aceite fechada, 7 de 7). **#26, #27 e #28 fechadas em 09/10.** **09/10: o Guilherme abriu #39 a #42 (fechamento: main = produção, retrieve, deck, reunião de entrega com de acordo); ver memória `metax-fechamento-guilherme`.** A próxima conferência só vale a partir de 10/10. **Não repetir** o que esta seção dá como feito.

### A reunião com o Guilherme (05/10, 22h23) mudou a ordem do fim do projeto
Transcrição em `C:\Users\User\Downloads\Reunião do Teams.docx`. O Thiago adotou em 06/10 ("faça as atualizações conforme o alinhamento"):
- **O mecanismo foi aprovado** ("perfeito mesmo"; "o mais difícil está pronto"). Sem pedido de mudança na jornada.
- **Especificação primeiro, por e-mail, só texto, com "de acordo" formal da Metax. Nada da jornada nem dos e-mails é mostrado antes** (nem prints no guia, no status ou no deck). Mudança pedida depois do aceite é demanda nova. Memória `metax-nada-antes-do-aceite`.
- **#30:** o Guilherme abre o caso pelo Claude dele (valor de 750 já aceito) e manda a **work order**; o Thiago aceita, anexa a documentação e envia ao cliente (trecho truncado na transcrição; confirmar).
- **O que falta, para o Guilherme:** "pentear o macaco", ou seja, e-mails com aparência profissional (logo no topo e no centro, cabeçalho, rodapé, botão, celular), que o **Thiago monta à mão** nos blocos do Content Builder (para a certificação Email Specialist), e a **revisão completa pelo Claude** antes de entregar.
- **Remetente:** é o da Metax (`go.metax.com.br`), não o da DASP. Continua aberto para onde vai a resposta do cliente (é ela que liga o "respondeu").
- **WhatsApp fora de escopo** (Guilherme): a regra da #34/#35 só usa o que está registrado no Salesforce; a especificação fala em "conversa registrada".
- **Agenda:** reunião na **sexta, 09/10**, sobre o Outlook com o Marketing Cloud (EWS e Microsoft Graph), que o Thiago marca.
- **Achado de 06/10 no Content Builder (leitura):** a Metax já tem o modelo institucional `Email_Template` (id 32482: logo, banner, botão `#E10600`, aviso de segurança e rodapé com descadastro e endereço), a logo (`Logo Meta Colorido - 200px`, pasta Logos) e imagens em `image.go.metax.com.br`. Tem também uma campanha própria, `[Nutrição] [Campinas]` (7 e-mails), com a jornada `[Nutrição] [Campinas] Leads Frios` **em rascunho**. Publicadas na BU hoje: CSAT, DE_Conversoes e uma jornada de 17/09. Scripts novos de leitura: `ler-marca-content-builder.apex`, `ler-html-email.apex` e `ler-jornadas.apex`.

### Produção e Marketing Cloud
- **Integração no ar:** #17 (`0AfbL000001ROSHSA4`) e #32 (`0AfbL000001RVAQSA4`). O agendamento **`08ebL00000YRfoHQAT`** está `WAITING`, disparando às 05:00 de Brasília (**recriado em 06/10, à noite, para o deploy da #35**, depois do `08ebL00000YR5ODQA1`, da #37 e da #38; substituiu o `08ebL00000YLWhFQAX`, da #34, que fez a carga de 06/10, e este o `08ebL00000YA7StQAL`, que fez as de 03 a 05/10). **Deploy `0AfbL000001RyqjSAC` (06/10, ~18h20): #37 e #38 na produção, 52 de 52; colunas `ForaDaJornada`, `MotivoForaDaJornada`, `NomeConsultor` e `EmailConsultor` criadas nas duas DEs.** **4 cargas automáticas sem erro** (03, 04, 05 e 06/10). **Semana de aceite: 4 de 5; fecha em 09/10.**
- **DE real `Metax_Contatos_Jornada` (06/10):** **139 contatos reais e nenhuma linha TESTE**, todos com `DataAtualizacao` = 06/10. 113 abertas, 26 para sair, 15 com `Respondeu` e 0 opt-out. Temperatura: 107 pela oportunidade e 6 pelo WhatsApp. Confronto com o Salesforce: entre 110 e 114 contatos abertos na hora da carga (4 oportunidades fecharam ou mudaram depois das 05:00); a DE (113) cabe.
- **EWS (#32):** 05/10 com 81 e-mails recebidos; 06/10 com 49 até a conferência. O sinal está vivo.
- **Jornada real `d2a60886-…`: RASCUNHO, NÃO ATIVAR.** Tem **7 caminhos**, com a despedida no dia 90 montada e testada em 05/10, e a Divisão 2 pela `DataReferencia` (#34). Validação: 0 erros (**validar só depois de o canvas carregar por completo**). **Na ativação, trocar a data de início do agendamento da entrada, que ainda diz 03/10.**
- **E-mails `[TESTE]` (33686, 33687 e 33688):** provisórios. **Regra para os 7 definitivos:** pré-cabeçalho com entidades HTML, o bloco de data e, depois de qualquer edição, escolher a mensagem de novo em cada atividade e testar.
- **Git:** a `main` está em `9239786`. Branches pendentes: `feat/i35-conversa-do-consultor` (`9c1f5b4`, o Thiago revisa antes do deploy) e `docs/i30-especificacao-e-layout` (`01bba52`; especificação no rascunho 8, guia no rascunho 4, roteiro do layout e modelo com área de blocos; merge com o ok do Thiago).
- **Ferramentas:** o `sf` só funciona pelo **PowerShell**. Os scripts do MC estão em `Documents\Bunker\Metax\scripts-mc\` (ver `LEIA-ME.md`).

### Issues abertas (16)
- `e5-reteste`: #26, #27 e #28 fecham em 09/10, se a semana de aceite fechar sem falha (4 de 5 em 06/10).
- `e4-no-ar`: #17 (fecha com a ativação) e #19 (status diário, que o Thiago envia sempre).
- `e5-reteste`: **#34**, o WhatsApp registrado mede a temperatura; no ar desde 05/10, Divisão 2 trocada e validada; fecha com a ativação.
- `e4-no-ar` desde 06/10, à noite (deploy `0AfbL000001S0EDSA0`, 55 de 55, da `feat/i35-sobre-i38`): **#35**, a conversa do consultor (e-mail do consultor, WhatsApp na oportunidade, 7 dias antes). Critério do controle aprovado (05/10). **O Thiago revisa a branch antes**; depois, o deploy precisa da liberação dele nas permissões e de recriar o agendamento das 05:00.
- `e2-provado`: #15 e #16 (sobem com a ativação) e **#21** (guia no **rascunho 4**, branch `docs/i30-especificacao-e-layout`; só vai à Metax depois do de acordo; falta a revisão do Thiago e o PDF).
- `e1-medindo`: **#30** (especificação no **rascunho 8**, para o de acordo por e-mail; work order do Guilherme) e **#31** (layout agora, texto dos 7 depois do de acordo).
- `e4-no-ar` desde 06/10, à noite: **#37** (uma pessoa, um e-mail: `ForaDaJornada` para e-mail interno da Metax e e-mail repetido; 50 de 50 na metax-dev) e **#38** (nome e e-mail do consultor na carga, para o botão; 52 de 52), branches `fix/i37-email-repetido-interno` e `feat/i38-botao-consultor` (empilhada), worktree `C:\Users\User\code\metax-salesforce-i37`.
- `e0-triagem`: #36 (enxugar a estrutura, para depois) e #33 (vai para a conversa com a Metax). **#18 e #4 fechadas em 07/10 como fora do escopo** (decisão do Thiago; rótulo `nao-sera-atendido`): a #18 pede meses de histórico real e vira demanda nova; a #4 é cadastro da Metax e vai para a conversa depois do de acordo, como orientação.

### O que fazer AGORA (atualizado em 07/10, 14h)
**Estado em uma linha:** produção com #34, #35, #37 e #38 (agendamento `08ebL00000YRfoHQAT`); jornada em rascunho, validada sem erros, com a Divisão 1 lendo `ForaDaJornada` e a atividade "E-mail 2 · dia 7 (quente)" já com o e-mail novo "Jornada Metax" (id 10969); as outras 6 atividades ainda com os `[TESTE]`. O e-mail do dia 7 chegou na caixa pelo teste da jornada e ficou bom no celular, inclusive no modo escuro (Thiago, 07/10).

1. **Conferência diária de 08/10 e 09/10** (só leitura, só se a data for posterior à "Última conferência registrada"): o job das 05:00 do `08ebL00000YRfoHQAT`, `ler-totais-de-real.apex`, `ler-temperatura-whatsapp.apex`, `ler-fora-e-consultor.apex`, os e-mails recebidos do dia anterior (#32) e a **vigia do Einstein** (e-mails enviados a contatos da jornada pelo processo automático, "captura apenas de cabeçalho"). Em 09/10, se a semana (03 a 09/10) fechar sem falha, fechar #26, #27 e #28.
2. **E-mail do dia 7, ajustes do Thiago** (ele edita no Content Builder): texto alternativo "Placeholder image" → "Metax" e "Obra Metax"; assunto "negócio" → "proposta"; pré-cabeçalho com entidades HTML (`Solu&ccedil;&atilde;o, etapas e acompanhamento da sua obra.`); tirar "Sentimos sua falta"; botão "Falar com **o** consultor"; nomes completos nos textos alternativos dos ícones. Se mudar o assunto ou o pré-cabeçalho, **escolher a mensagem de novo** na atividade do dia 7.
3. **Testar na caixa SEMPRE pelo teste da jornada** (memória `metax-teste-pela-jornada`; o "Enviar teste" do Content Builder não entrega nesta conta): achar um contato num dia de envio com `scripts-mc/ler-candidatos-dia-de-envio.apex`, Journey Builder › esperar o canvas carregar › Validar › Testar a jornada › "Enviar apenas mensagens de teste" só para thg.k@bunkerconsultancy.com › Retornar ao rascunho. **Nunca clicar em "Ativar".** O Claude pode fazer pelo Chrome do Thiago (grupo de abas do Claude in Chrome), com o ok dele.
4. **Os outros 6 e-mails:** o Thiago monta copiando o do dia 7, com os textos de `docs/jornada-mc/textos-emails-rascunho.md` (pergunta única aprovada por e-mail). O Claude revisa (API e imagem) e testa pela jornada. Pôr cada um na sua atividade do rascunho só com o ok dele.
5. **Especificação, rascunho 9** (`docs/jornada-mc/especificacao.md`, sem [DECIDIR]): revisão final do Thiago e envio por e-mail para o de acordo (o envio é dele).
6. **Guia do Raphael (#21), rascunho 5:** revisão do Thiago; com o ok, o PDF no padrão Bunker. O print 3.3 precisa ser refeito (Divisão 1 com `ForaDaJornada`). Só vai à Metax depois do de acordo.
7. **Merges com o ok do Thiago:** `feat/i35-sobre-i38` (tem #35, #37 e #38, que estão em produção) e `docs/i30-especificacao-e-layout` na `main`.
8. **Conversa com o Guilherme:** a pauta curta está no briefing (seção "Pauta curta para 07/10"); a reunião de sexta, 09/10, sobre o EWS e o Einstein.

### DEPOIS do de acordo na especificação (NÃO propor antes)
- **Texto dos 7 e-mails (#31)** sobre o modelo, seguindo o papel de cada e-mail definido na especificação; a campanha `[Nutrição] [Campinas]` da Metax serve de referência de tom.
- **Montagem:** escolher a mensagem de novo nas 7 atividades, conferir o remetente em **Opções de entrega**, validar com o canvas carregado e testar só para a Bunker.
- **Revisão pelo Claude** (pedido do Guilherme), só leitura: remetente, assunto, pré-cabeçalho, personalização, links, imagens, computador e celular.
- **Conversa com a Metax**, a pauta só quando o Thiago pedir (briefing em `briefing-alinhamento-2026-10-05.md`, atualizado em 06/10): caixa de resposta, alerta de falha, oportunidades sem contato (#4), dono da rotina (#33), o fluxo "Aprovação financeria" e o grupo de atributos vazio. Ainda com o Guilherme: créditos do review e e-mail pós-fechamento.
- **Ativação** com o ok do Thiago (#17, #15 e #16, trocando a data de início do agendamento da entrada), **#36** (enxugar) e encerramento.

### 06/10: FEITO
- Conferência da manhã (só leitura), registrada na #26, #27, #28 e #32.
- Decisões do Thiago de 05/10, à noite, registradas na #35: revisar antes do deploy; critério de 10 dias aprovado.
- Especificação no rascunho 8, guia no rascunho 4, roteiro do layout e modelo com área de blocos, na branch `docs/i30-especificacao-e-layout`.
- Memórias atualizadas (ordem nova, #30, pauta e escopo) e memória nova `metax-nada-antes-do-aceite`. Briefing atualizado com a seção "Atualização de 06/10".

### 06/10, tarde: FEITO (o Thiago pôs o layout e os textos como prioridade máxima)
- **Layout:** o Thiago escolheu montar **do zero com os blocos**, com o modelo da Metax como referência (roteiro reescrito, `94cbb97`).
- **Remetente e resposta (só leitura, `scripts-mc/ler-remetente-resposta.apex`):** as 7 atividades usam a classificação "Metax - Comercial" e o remetente **"Metax - No Reply" (`noreply@go.metax.com.br`)**, com resposta automática ("Este endereço de e-mail não recebe respostas") e encaminhamento para `marketing@metax.com.br`, que não é usuário do Salesforce. **A resposta ao e-mail da jornada não liga o "respondeu".** O botão não pode ser "responda": as opções estão na especificação (item 7), e a decisão é do Thiago. Registrado na #30.
- **#35:** resumo para a revisão do Thiago em `Documents\Bunker\Metax\revisao-i35.md`. Risco apontado: o filtro do e-mail do consultor olha o tipo de usuário ("Standard"), não o perfil dos consultores, e um e-mail automático pode contar como conversa. Sugere uma consulta só de leitura dos remetentes antes do deploy.
- **#37 aberta (P1):** a nutrição iria em cópias, e para a Metax (decidida e provada depois; ver abaixo). O e-mail de um **usuário da Metax** está em 3 contatos de cliente com oportunidade aberta, e um endereço de cliente está em 2 contatos. Teste vermelho na metax-dev (`707Ha000018ghEc`: 4 vermelhos PROVA, controle verde), branch `fix/i37-email-repetido-interno` (`f8e0f34`), worktree `C:\Users\User\code\metax-salesforce-i37`. **`bloq-decisao`:** (a) campo novo `ForaDaJornada` nas DEs e na Divisão 1, ou (b) mandar essas linhas com `PossuiOportunidadeAberta` = falso; e qual contato fica com o e-mail.
- **Decisões do Thiago (06/10, tarde):** #37 com o campo novo `ForaDaJornada` (e `MotivoForaDaJornada`) nas DEs e na Divisão 1; **botão dos e-mails = e-mail do consultor dono da oportunidade** (#38, aberta como P0). Especificação, textos e roteiro atualizados (`6347975`, `7f1e0e3`; branch `docs/i30-especificacao-e-layout` agora no GitHub).
- **#37 e #38 provadas na metax-dev:** #37, sem a correção 5 vermelhos (`0AfHa00000DqFUxKAN`) e com ela 50 de 50 (`0AfHa00000DqFOUKA3`); #38, sem a mudança 1 vermelho (`0AfHa00000Dq7dsKAB`) e com ela 52 de 52 (`0AfHa00000DqFgFKAV`). **A metax-dev está com `main` + #37 + #38 (sem a #35).**
- **Pacote para a produção, cada passo com o ok do Thiago na hora, nesta ordem:** (1) colunas `ForaDaJornada`, `MotivoForaDaJornada`, `NomeConsultor` e `EmailConsultor` nas duas DEs, com `scripts-mc/GRAVA-adicionar-colunas-i37.apex` (pronto e **não rodado**; sem as colunas, o MC recusa a carga inteira); (2) deploy, proposto junto com a #35 depois da revisão dela, cancelando e recriando o agendamento das 05:00 uma vez só; (3) Divisão 1 da jornada lendo `ForaDaJornada` = falso, pela API, no rascunho.
- **Textos dos 7 (rascunho 1, interno):** `docs/jornada-mc/textos-emails-rascunho.md` (`f41c1eb`), no tom da campanha de Campinas da Metax.

### 06/10, fim da tarde: FEITO (enquanto o Thiago monta o layout)
- **#35, medição dos remetentes (só leitura):** 480 e-mails enviados a contatos em 30 dias; 425 de consultores (`DWUsuarioPadrao`) e 55 do processo automático, **53 deles capturas do Einstein** ("captura apenas de cabeçalho"), que o filtro "Standard" da #35 deixa de fora. Não há rascunho. Entre os e-mails dos consultores há medições e faturas. Sugestão simulada na seção 7 de `revisao-i35.md` e na #35: contar o consultor **ou** a captura do Einstein. **Decisão do Thiago antes do deploy.**
- **Script da Divisão 1 da #37 pronto e NÃO rodado:** `scripts-mc/GRAVA-jornada-i37.apex`. Ensaio só de leitura: compila, acha 1 critério e o JSON novo é válido. Ordem: colunas → deploy → uma carga com o código novo → este script.
- **Contrato de dados** com as 4 colunas novas (`5a3ed12`, branch da #38) e **guia no rascunho 5** (`c43e6f0`: uma pessoa, um e-mail; campos novos; botão do consultor; o print 3.3 precisa ser refeito quando a Divisão 1 mudar).
- **Status de 06/10, rascunho só de texto:** `status-2026-10-06.md`. #35, #37 e #38 ficam de fora porque não estão em produção. O texto traz o ponto de cadastro dos 3 contatos com e-mail de colaborador, marcado [DECIDIR enviar]. Sugestão: hoje sem deck. O envio é do Thiago.
- **Não feito, de propósito:** juntar a #35 com a #37 e a #38 numa branch só. Isso espera a revisão da #35, porque o filtro pode mudar.

### 06/10, noite: FEITO
- **Produção (ok do Thiago):** colunas criadas nas duas DEs; agendamento `08ebL00000YLWhFQAX` cancelado; deploy `0AfbL000001RyqjSAC` (#37 + #38, 52 de 52); agendamento recriado **`08ebL00000YR5ODQA1`**. #37 e #38 em `e4-no-ar`.
- **Conferência de 07/10 preparada:** `scripts-mc/ler-fora-e-consultor.apex`. Linha de base de 06/10, antes da carga nova: 113 abertas, 98 elegíveis, 0 fora, 0 com consultor.
- **#35 por cima da #37 e da #38:** branch `feat/i35-sobre-i38` (`a56acfa`), 55 de 55 na metax-dev (`0AfHa00000DqQroKAF`). A metax-dev está com #35 + #37 + #38. Deploy só depois da decisão do filtro (seção 7 de `revisao-i35.md`). **Subir desta branch, e não da `feat/i35-conversa-do-consultor`.**
- **Status de 06/10** atualizado com a #37 e a #38 ("vale a partir da carga de amanhã").
- **Prompt do layout** para outro chat: `Documents\Bunker\Metax\prompt-layout.md`.

### 06/10, mais tarde: FEITO
- **Decisões do Thiago** (`decisoes-especificacao-2026-10-06.md`): #35 sobe como está, com a vigia do Einstein (hoje as 3 opções dão 46 contatos); item 4 da especificação com o botão de WhatsApp como o jeito de registrar; item 7 com a tabela dos 7 papéis.
- **Especificação no rascunho 9, sem [DECIDIR]** (`d8efff9`); textos com a pergunta única de cada e-mail. Falta a revisão final do Thiago e o envio para o de acordo.
- **#35 NO AR:** agendamento `08ebL00000YR5ODQA1` cancelado; deploy `0AfbL000001S0EDSA0` (55 de 55, da `feat/i35-sobre-i38`); agendamento recriado **`08ebL00000YRfoHQAT`** (DaspeWeb, como antes). A produção agora tem #34 + #35 + #37 + #38. **O merge na `main` (da `feat/i35-sobre-i38`, que contém tudo) espera o ok do Thiago.**

### 07/10, manhã: FEITO
- **Conferência (5ª carga sem falha, 03 a 07/10):** job `707bL0000162IrSQAU` (o 2º registro, `707bL0000162510QAA`, é o *worker* do mesmo lote, não uma 2ª carga). DE: 147 reais, 117 abertas, 30 para sair, 17 respondeu, **1 opt-out** (o primeiro). **#35:** 50 pela conversa do consultor (eram 6), 71 pela oportunidade. **#37:** 3 fora, os 3 por "E-mail interno da Metax". **#38:** 117 de 117 abertas com consultor (113 metax.com.br, 4 do parceiro). Elegíveis pela Divisão 1 nova: 96. EWS de 06/10: 58. **Vigia do Einstein: 0.**
- 4 linhas "para sair" guardam datas de 05/10 (o upsert não apaga campo vazio; vem desde a #24); sem efeito, a Divisão 1 as tira.
- **Divisão 1 trocada às 09h07** (`GRAVA-jornada-i37.apex`, PUT 200; aprovada pelo Thiago em 06/10): agora exige `ForaDaJornada` = falso. Rascunho. Backup: `docs/jornada-mc/jornada-real-backup-2026-10-07-antes-i37.json` (no clone, ainda sem commit). **A validação pela API não existe (404): o Thiago valida no Journey Builder, com o canvas carregado.** O print 3.3 do guia precisa ser refeito.
- **Envio de teste que não chegou, diagnóstico:** os 3 envios de 06/10 (Send 125940 a 125942) estão Complete, com remetente noreply, mas com **0 destinatários, 0 excluídos, 0 erros e nenhum NotSentEvent**: a lista de destinatários do teste foi vazia (provável: e-mail digitado sem virar etiqueta com Enter). O assunto registrado diz "sobre o negócio", e não "sobre a proposta". O All Subscribers não pode ser lido pela API (permissão).
- **GitHub com erro 500 em toda gravação (07/10, ~12h), resolvido na 7ª tentativa automática:** push do backup feito e comentários publicados na #26, #27, #28, #31, #32, #35, #37 e #38; #35, #37 e #38 em `e5-reteste`.

### 07/10, tarde: FEITO
- **Envio de teste resolvido por eliminação:** o "Enviar teste" do Content Builder **não entrega nesta conta** (nem o e-mail antigo, com qualquer contato e endereço). O **Teste da jornada entrega**, inclusive o e-mail novo (Send 126079, chegou na caixa da Bunker às 13h42, com as imagens ok depois de liberadas no Outlook). O diagnóstico de "lista vazia" estava errado: era a opção "Suprimir Resultados", e a API não mostra teste. Memória `metax-teste-pela-jornada`; detalhe na #31.
- **Jornada validada sem erros** no Journey Builder, já com a Divisão 1 do `ForaDaJornada`.
- **Atividade "E-mail 2 · dia 7 (quente)" agora usa o e-mail novo "Jornada Metax"** (id 10969), no rascunho, com o ok do Thiago (opção A). Backup: `docs/jornada-mc/jornada-real-backup-2026-10-07-antes-email-dia7.json`. As outras 6 atividades continuam com os `[TESTE]`.
- **(FEITO às 14h40, ver "07/10, fim da tarde")** ~~Ajustes pendentes no e-mail do dia 7 (do Thiago):~~ texto alternativo "Placeholder image" → "Metax" e "Obra Metax" (no Outlook, as imagens chegam bloqueadas); assunto "negócio" → "proposta"; pré-cabeçalho com entidades HTML; tirar "Sentimos sua falta"; "Falar com **o** consultor"; nomes completos nos ícones das redes. Depois de editar o assunto ou o pré-cabeçalho, escolher a mensagem de novo na atividade do dia 7.

### 07/10, fim da tarde: FEITO (e-mail do dia 7 fechado)
- **Push da `docs/i30-especificacao-e-layout`** (c124ba4) feito na 2ª tentativa (GitHub com erro 500 antes).
- **E-mail do dia 7 aprovado pelo Thiago na caixa** (teste da jornada, contato Mariana `003bL000011BpmOQAS`, só para thg.k@bunkerconsultancy.com; rascunho, nada ativado). Ajustes dele: texto alternativo "Metax"/"Obra Metax", ícones "Metax no …", assunto "…sobre a nossa proposta?", pré-cabeçalho com entidades, rodapé centralizado por código. **Mantidos por decisão dele:** "Sentimos sua falta" e "Falar com consultor".
- **Botão com mensagem pronta:** `@assuntoConsultor`, `@corpoConsultor` e `@linkConsultor` (terminando em `&x=`) no bloco de variáveis, e `%%=v(@linkConsultor)=%%` no botão. O campo Assunto do botão nunca fica vazio (guarda `%0A`); o `&x=` absorve o resto. Regra em `textos-emails-rascunho.md`.
- **Atividade do dia 7:** mensagem escolhida de novo (backup `jornada-real-backup-2026-10-07-antes-email-dia7-v2.json`); **isso renomeia a atividade**, nome restaurado à mão. Validação: 0 erros. Registrado na #31. Scripts novos de leitura: `ler-ajustes-email-dia7.apex`, `ler-mailto-dia7.apex`, `ler-blocos-email-dia7.apex`.
- **Próximo:** os outros 6 e-mails a partir do modelo do dia 7 (o Thiago monta; o Claude prepara o material, revisa e testa; cada atividade só com o ok dele).

## 05/10/2026 (histórico)

### 05/10, manhã e tarde: FEITO
- **3 cargas automáticas sem erro:** 03/10 `707bL0000154RobQAE`, 04/10 `707bL000015GuAgQAK` e 05/10 `707bL000015STHfQAO`, todas Completed com 0 erros. O agendamento `08ebL00000YA7StQAL` está `WAITING`, com 3 disparos, e o próximo é em 06/10, às 05:00. **Dia 1 a 3 da semana de aceite: ok.**
- **DE real:** 136 linhas = 128 reais (todas com `DataAtualizacao` = 05/10) + 8 TESTE, que o Thiago **ainda não apagou** (servem ao teste do dia 90). Das reais: 104 abertas, 24 para sair, 14 com `Respondeu` e 0 opt-out. **Confronto: o Salesforce tinha 104 contatos em oportunidade aberta até as 05:00, igual à DE.** Os 5 a mais de hoje (109) são de oportunidades criadas depois da carga.
- **EWS:** e-mails recebidos registrados por dia: 01/10 71, 02/10 87, 03/10 0 (sábado), 04/10 1 (domingo), 05/10 51 até as 13h. O sinal está vivo.
- **As 8 do limbo foram para `e5-reteste`, com a prova em cada uma.** **Fechadas com o ok do Thiago: #11, #24, #25, #29 e #32 (`e6-validado`).** Ficam em `e5-reteste` até 09/10 a #26, a #27 e a #28, cujo cenário não acontece na produção.
- **MERGES (05/10, ok do Thiago):** `docs/status-2026-10-02` (`38e2536`) e `docs/despedida-dia-90` (`cf70502`) entraram na `main` com merge commit. A `main` já tem a especificação no rascunho 7 (7 e-mails) e o status de 02/10.
- **Despedida no dia 90:** o Thiago aprovou gravar a linha `TESTE-D90` (última oportunidade em 07/07/2026), com o script pronto em `scratchpad/inserir-teste-d90.apex`, a rodar depois de o caminho estar montado. A sessão do MC tinha expirado, e o Thiago precisa fazer login no Chrome. O e-mail provisório do dia 90 é o `[TESTE] … - frio`, sem criar nada novo.
- **DESPEDIDA NO DIA 90 MONTADA E TESTADA (05/10, 13h41):** 7º caminho "Dia 90" (copiado do Dia 45, Menos Hoje 90), com a atividade "E-mail 7 · dia 90 (despedida)" usando o provisório `[TESTE] … - frio`. Validação com 0 erros. Linha `TESTE-D90` gravada (ok do Thiago). Teste só para thg.k@: D90 → E-mail 7, controle D45 → Restante, **1 e-mail**, `SentEvent` só com a chave TESTE-D90. Jornada em rascunho. Branch `feat/despedida-d90-montada` (`6d110a6`), mesclada na `main` com o ok do Thiago. **As 9 linhas TESTE foram apagadas pela API (ok do Thiago); a DE tem só os 128 reais.** Para ativar, ajustar a data de início do agendamento da entrada, que ainda diz 03/10.
- **Modelos `[TESTE]` (05/10):** a data está corrigida (AMPscript `FormatDate`, o teste trouxe 07/07/2026). O pré-cabeçalho continua "nutri????o" porque a atividade da jornada guarda uma cópia; a regra para a #31 é usar entidades e escolher a mensagem de novo em cada atividade. Branch `fix/emails-teste-data-acento` (`da62000`), mesclada na `main`. Backup em `docs/jornada-mc/emails-teste-backup/`.
- **Lição do Journey Builder:** validar só depois de o canvas carregar por completo; validado cedo, ele acusa erro falso nas divisões.
- **Pauta da reunião de alinhamento com a Metax:** montar DEPOIS da conversa do Thiago com o Guilherme de hoje (decisão dele). Ganho rápido só conta o que não depende da Metax (memória `ganho-rapido-sem-metax`).
- **#30:** a conversa Thiago–Guilherme ficou para hoje, 05/10, e o Thiago vai pedir uma data. A pauta de 03/10 (memória) vale para essa conversa.
- **`sf` no Git Bash quebrado** ("'C:\Program' não é reconhecido"): no PowerShell funciona. Usar o PowerShell para `sf`; não mexer na instalação.

## 02/10/2026, fim do dia (histórico)

### No ar na PRODUÇÃO (Salesforce da Metax, alias `metax`)
- **Integração implantada:**
  - #17: `0AfbL000001ROSHSA4`, de 01/10;
  - #32, o sinal "respondeu": `0AfbL000001RVAQSA4`, de 02/10.
- **Credencial:** `MetaxMC`, preenchida pelo Thiago; o token responde HTTP 200. Permission Set dado ao `metax@daspeweb.com.br` (revisar no fim, #33). Capacidade de entrega já estava em "Todos os emails".
- **Primeira carga:** `707bL000014uEj6QAE`, com 0 erros e **126 contatos**, batendo com o Salesforce (103 abertos e 23 para sair).
- **Agendamento diário ATIVO:** **`08ebL00000YA7StQAL`**, todo dia às 05:00 de Brasília. Ele substituiu o `08ebL00000YA2ucQAD`, cancelado para implantar a #32. Reversão: `System.abortJob('08ebL00000YA7StQAL');`.
- **Issues em `e4-no-ar`:** #11, #17, #19, #24, #25, #26, #27, #28, #29 e #32. Elas fecham depois do reteste, ou seja, da carga das 05:00 sem erro. **A semana de cargas sem falha do aceite começa em 03/10**; o mínimo é 09/10.
- **Implantar com o agendamento ativo é barrado** ("classe programável com trabalhos pendentes"). Em vez de mudar a configuração da org, cancelar, implantar e reagendar.

### Marketing Cloud
- **DE real `Metax_Contatos_Jornada`:** **17 campos**, com o `Respondeu` novo. Hoje tem **134 linhas**: 126 reais + **8 `TESTE-…` com o e-mail do Thiago** (TESTE-D1, D7, D21, D45, D20, FECHOU, OPTOUT e RESPONDEU). **O Thiago apaga as 8 só depois da prova de envio.**
- **DE de teste `Metax_Contatos_Jornada_Teste`:** 17 campos (usada pela KlockDev).
- **Jornada real:** `Jornada de Nutrição Metax`, id `d2a60886-b1ea-4347-b303-8b7780412ece`, **em RASCUNHO, NÃO ATIVAR**. Desenho "um envio por dia" (`docs/jornada-mc/jornada-real.md`):
  - entrada pela DE real, diária às 06:00, a partir de 03/10, avaliando todos os registros, com reentrada a qualquer momento;
  - **Divisão 1 "Pode receber"**: aberta = V **E** opt-out = F **E** respondeu = F; o restante sai;
  - **Divisão 2**: `DataUltimaOportunidade` é igual a Menos Hoje 1, 7, 14, 21, 28 ou 45 dias, cada dia com o seu e-mail `[TESTE]` (quente nos dias 1, 7 e 14; morno nos dias 21 e 28; frio no dia 45); o restante sai;
  - validação: 0 erros e 1 recomendação (alta taxa de transferência);
  - **simulação do Journey Builder (não envia nada), com os 8 TESTE: 8 de 8 certos** (#16).
- **Jornada `[TESTE] Jornada de Nutrição Metax`:** Stopped. Não mexer nas outras jornadas da Metax (CSAT, DE_Conversoes, "Nova jornada…").
- **Grupo de atributos "Jornada Metax"** no Contact Builder: criado e **vazio**, porque o vínculo deu **403** e o `thiago.klock` não pode editar o modelo de dados. Não afeta nada; remover no fim por quem tiver permissão.

### (HISTÓRICO, JÁ EXECUTADO EM 05/10, NÃO REFAZER) Plano de 03/10, fechado com o Thiago em 02/10, às 22h
1. **Conferência das 05:00, só leitura na produção** (alias `metax`): o job do agendamento `08ebL00000YA7StQAL` (Concluído, 0 erros), o `count` da DE `Metax_Contatos_Jornada` (o número real mais as linhas TESTE que ainda existirem), o `Respondeu` chegando e os e-mails recebidos do dia 02 (EWS). Registrar nas issues. Se bater, as **8 do limbo** (#11, #24 a #29 e #32) vão de `e4-no-ar` para `e5-reteste` e, com a prova, fecham. A #17 (inclui ativar) e a #19 (status diário) ficam.
2. **Despedida no dia 90, com o Thiago na tela:** o 7º caminho na Divisão 2 ("Dia 90" = Menos Hoje 90, com e-mail `[TESTE]` provisório), a linha `TESTE-D90` na DE real (escrita na produção: pedir o ok dele na hora) e o teste com "Enviar apenas mensagens de teste", só para thg.k@. Depois, refazer os prints 3.2 e 3.4 do guia e avisar que ele pode apagar todas as linhas TESTE.
3. **Branches a mesclar na `main`, com o ok dele:** `docs/status-2026-10-02` (status de 02/10, último commit da branch) e `docs/despedida-dia-90` (especificação rascunho 7, jornada e guia, `052e3f4`).
4. **Com o Thiago:** enviar o status de 02/10 (`status-2026-10-02.md`, 8 slides), revisar o guia da #21 (depois dele, o PDF no padrão Bunker) e o status de 03/10 no fim do dia.
5. Depois: #31 (conteúdo dos 7 e-mails, a última etapa), a ativação com o ok dele e o fim (#33, o grupo de atributos vazio e a triagem da #1, #4 e #18).
6. **Cobrar a #30 ao abrir** (em 02/10, às 22h30, ainda não tinha o caso; o Thiago cobra o prazo do Guilherme na segunda, 05/10).

### 02/10, noite (sessão das 18h): FEITO
- **#30:** o Thiago confirmou de novo, às 18h13, que o Guilherme não criou o caso ("nao fez").
- **Prova de envio ✅ (#16, agora `e2-provado`, liberada pelo Thiago):** "Testar a jornada" com **"Enviar apenas mensagens de teste"** para thg.k@ e só os 8 TESTE. 8 de 8 caminhos e **exatamente 4 e-mails** às 18h22 (quente d1, quente d7, morno d21, frio d45). **O `SentEvent` da BU desde as 16h tem só os 4 (TESTE-D1, D7, D21, D45)**: ninguém mais recebeu. A jornada voltou a Rascunho, com 0 entradas. Prints em `evidencias/i16/` (`9a2daa4`).
- **Linhas TESTE:** os prints do guia já foram tirados; **o Thiago pode apagar as 8 linhas `TESTE-…` da DE real.**
- **#21 em andamento (`in-progress`):** rascunho 1 em `docs/jornada-mc/guia-raphael.md` (`f4345c5`), com 9 prints. Decidido pelo Thiago: o aviso de falha fica só com a Bunker (o metadado não muda), e a Bunker é o contato até o aceite (#30). Falta a revisão do texto pelo Thiago; o PDF no padrão Bunker sai depois do ok.
- **MERGES FEITOS (02/10, 20h40, ok do Thiago na hora):** a #22 entrou na `main` com merge commit (`6370a71`), e a #23, com a base apontada para a `main`, também (`8bed041`). As branches foram mantidas. Antes do merge, um retrieve só de leitura na produção bateu **25 de 25** arquivos da integração com a branch. A #7 fechou (`e6-validado`). O clone principal `C:\Users\User\code\metax-salesforce` foi atualizado na `main`. **Daqui em diante, branch nova sai da `main`.**
- **Status de 02/10 gerado, NÃO enviado:** `docs/status-report/2026-10-02/Jornada-MC-Metax-painel-2026-10-02.pdf`, com 8 slides, na branch `docs/status-2026-10-02` (`5060f37`), que ainda não foi mesclada. É o padrão de 7 slides mais, como exceção, o slide 7, com o compilado da semana (trilha das 8 entregas). O texto está em `status-2026-10-02.md`. O status de 01/10 não será feito (decisão do Thiago), e o report não cita isso.
- **DECISÃO 02/10, 22h: e-mail de despedida no dia 90, e a jornada passa a ter 7 e-mails** (#31). Nada muda no código. A especificação (rascunho 7), o `jornada-real.md` e o guia foram atualizados na branch `docs/despedida-dia-90` (`052e3f4`), que ainda não foi mesclada. O status de 02/10 também já mostra a despedida. **Falta, com o Thiago na tela:** montar o 7º caminho na Divisão 2 ("Dia 90" = Menos Hoje 90, e-mail `[TESTE]` provisório), criar a linha `TESTE-D90` na DE real (escrita na produção, com o ok dele na hora) e testar com "Enviar apenas mensagens de teste". Depois, refazer os prints 3.2 e 3.4 do guia.
- Na tela: "Copiar para nova jornada" e "Nova versão" ficam em **Versão › Visualizar painel de versão**. Fechar uma divisão sem mudar nada pede "Descartar alterações", que é seguro.

### (HISTÓRICO) Próximos passos de 02/10, já superados pela seção 05/10
0. **03/10 de manhã: a conferência (item 2 abaixo).** Ela não pôde ser feita em 02/10, às 18h, porque o job das 05:00 de 03/10 ainda não tinha rodado.
1. ~~**Prova de envio só para o Thiago**~~ ✅ feita em 02/10, às 18h22 (ver acima) (pedido dele: "se de fato vier só para mim"):
   - no "Testar a jornada", ver a opção de **enviar a endereços de amostra** e **conferir na tela, antes de iniciar, que só sai para `thg.k@bunkerconsultancy.com`**;
   - alternativa garantida: uma DE `_QA` só com as linhas TESTE e uma cópia da jornada;
   - **depois de os e-mails chegarem, sinalizar ao Thiago que ele pode apagar as 8 linhas `TESTE-…` da DE real.**
2. **03/10 de manhã:** conferir o job das 05:00 (0 erros), o `count` da DE, o campo `Respondeu` chegando e **os e-mails recebidos do dia 02** (monitoramento do EWS e do Einstein, decidido pelo Thiago). Com isso, mover para `e5-reteste`.
3. **#21:** documentação passo a passo para o Raphael.
4. ~~**Merges:** PR #22 (sincroniza a `main` com a org) e, depois, PR #23 (integração). Os dois já estão na produção.~~ ✅ feitos em 02/10, às 20h40
5. **#31:** conteúdo dos 6 e-mails, **a ÚLTIMA etapa**. Só quando o Thiago conhecer a cultura da Metax e o perfil de lead; não propor antes.
6. **Ativar a jornada real**: só com o conteúdo final e o ok explícito do Thiago.
7. **Fim:** #33 (usuário da rotina), remover o grupo de atributos vazio, triagem da #1, #4 e #18.

### Lembretes fixos
- **Cobrar o Thiago a cada sessão: "o Guilherme já criou o caso da Metax (#30)?"** Em 02/10 ainda não.
- Nada vai para o Guilherme nem para o cliente sem o Thiago mandar.
- Não mexer na configuração da org do cliente; contornar por fora.
- Comparar a opção mais simples **antes** de montar qualquer coisa.
- No Journey Builder, o Claude **não consegue arrastar**: canvas e campos do filtro são arrastados pelo Thiago, e o Claude configura o resto. No Contact Builder, o arraste funcionou como "clicar na origem e no destino". Para ver a tela, usar o Chrome da extensão (o Thiago já fica logado no Salesforce e no MC). O `sf org open` não abre janela a partir do terminal do Claude.
- Status diário ao cliente: deck de 7 slides (`docs/status-report/2026-09-30-rascunho/painel_metax_30.py`), com co-marca "Bunker + Metax", funil centralizado na ordem do rito e só "hoje" em destaque. O de 01/10 e o de 02/10 **não foram gerados**: perguntar ao Thiago.

## Situação agora (30/09, noite)
- **Integração na sandbox KlockDev, completa e provada:**
  - envio diário para a DE de teste (#26);
  - quem fecha a oportunidade ou pede opt-out sai na hora (#24, #27);
  - aviso de falha por e-mail (#28);
  - datas no horário de São Paulo e testes reforçados (#29);
  - 38 de 38 testes.
  - Tudo está em `e3-aguardando-deploy` e vai para a produção com a #17.
- **Marketing Cloud (produção da Metax, BU única):**
  - a DE real `Metax_Contatos_Jornada` tem **16 campos**, com os 2 novos criados em 30/09;
  - **5 linhas `TESTE-…` com o e-mail do Thiago**: quente, morno, frio, fechou e opt-out. **O Thiago apaga ao fim.**
  - 3 e-mails **[TESTE]** no Content Builder: ids 33686, 33687 e 33688 (legado 10903 a 10905), com rodapé CAN-SPAM completo.
  - Jornada **`[TESTE] Jornada de Nutrição Metax`**, montada pelo Thiago na tela com orientação:
    - entrada `Metax_Contatos_Jornada`;
    - divisão "Sai" (`PossuiOportunidadeAberta` = Falso OU `OptOutEmail` = Verdadeiro) → sair; "Continua" → faixas Quente, Morno e Frio ("é depois de Menos Hoje 16 / 31 / 91 dias"), cada uma com o seu e-mail;
    - modo de entrada: "reentrada só após sair"; e-mail pela origem de entrada;
    - agendamento: em ativação, sem repetir;
    - simulação de caminho ok (quente → Quente, morno → Morno).
  - **Ativada pelo Thiago em 30/09 ~20h e PROVADA:** às 20h03 chegaram **exatamente 3 e-mails** em thg.k@ (quente, morno e frio, com os dados certos) e nenhum do fechou e do opt-out. Registrado na #15 (`e2-provado`); a #16 foi coberta em parte.
  - Para a versão real: formatar a data no e-mail (sai "9/25/2026 12:00:00 AM"); o acento do pré-cabeçalho quebrou ("nutri????o"); falta o critério de saída durante a jornada, e os casos de mais de 90 dias e sem oportunidade (#16).
- **Próximo, nesta ordem:**
  1. ✅ o Thiago **parou a jornada [TESTE]** e **apagou as 5 linhas `TESTE-…`** da DE real. Conferido pela API em 30/09, noite: `status=Stopped` e `count=0` (comentário na #15). A mesma leitura mostrou outra jornada, **`[Nutrição] [Campinas] Leads Frios`**, em rascunho desde 25/09 (ver "Pontos em aberto"). Correção do mapa: a #28 está em `e2-provado` + `bloq-ambiente`, e não em `e3`;
  2. ❌ **cancelado pelo Thiago** ("não é para perguntar nada para o Guilherme. Eu defino tudo."). O defeito da skill está em `galeria.py:40` (plugin 1.31.0): a `_taxonomia()` roda sem o repo e pega o da Stara. Segue contornado no invólucro do relatório;
  3. ✅ **#31 decidida, versão final da noite:** **6 e-mails** (o Thiago achou 9 demais).
     - Calendário, em dias desde a última oportunidade: 3 na faixa quente (dias 1, 7 e 14), 2 na morna (21 e 28) e 1 na fria (45); sai no dia 90.
     - O contato entra pela fase atual e nunca recebe os e-mails anteriores.
     - Sai também ao responder: e-mail registrado ou ligação com "Conexão significativa" (#32).
     - Fontes, só de escolas de negócios: Stanford GSB, HBS e BYU, NYU Stern, Columbia e Boston College, e Georgia State. Estão na #31 e na memória.
     - Especificação no rascunho 5 (`be1539d`);
  4. ⏳ **#17 liberada** (`e1-medindo`), com o plano de 7 passos no comentário. O manifesto ganhou o `JornadaMC_Config__mdt`, que faltava e quebraria a produção; dry-run na KlockDev `0AfHa00000DmmcLKAR`, 38 de 38. **Próximo: o ok do Thiago para o dry-run na produção**;
  5. #11: agendamento na sandbox, que o Thiago pediu para aguardar;
  6. #7 e PR #22: merge **só depois da produção (#17)**, por decisão do Thiago;
  7. ⏳ #19: o **status de 30/09 foi regerado à noite** (`60747e5`, 21 slides, PDF e PPTX em `docs/status-report/2026-09-30-rascunho/`), com "Entrega e docs" como nome de exibição. **Não enviado; o envio é do Thiago.** No Windows, rodar com `PYTHONUTF8=1`, `BUNKER_CHROME` e o lançador de `file:///` (ver o README da pasta).
- **Feito também em 30/09, noite:** a #17 foi **validada na produção sem gravar**: `0AfbL000001RG4vSAG`, 17 de 17 componentes e 38 de 38 testes. **Próximo passo da #17: o ok do Thiago para implantar** (quick deploy desse id). O sinal de "respondeu ou pediu avaliação" vem do Sales Cloud (decisão do Thiago); **falta saber qual etapa ou campo da oportunidade o marca**. A leitura das etapas na produção foi barrada pela trava, e a resposta fica com o Thiago.
- **Sinal de "respondeu ou pediu avaliação" (decidido em 30/09, noite):** usar só o que já existe no Sales Cloud.
  - Sai quem, depois da data da última oportunidade, mandou um **e-mail registrado** ou teve uma **ligação com "Conexão significativa"**.
  - Medido na produção: de 11 a 17 dos 92 contatos com oportunidade aberta.
  - A DE ganha 1 coluna Boolean.
  - Virou a **#32** (P1, `e1-medindo`). Fica para antes da jornada real e **não entra na implantação de 01/10**.
- **#30, aceite do escopo: COBRAR O THIAGO a cada sessão.** Falta o Guilherme criar o **caso da Metax** no portal de casos da Bunker, onde o cliente aceita o contrato. Na reunião de 30/09, às 21h10, ele disse: "da Metax, eu não criei o caso até agora". O rascunho técnico (rascunho 6) serve de insumo. Não gerar PDF para a Metax.
- **Conteúdo dos 6 e-mails = Bunker (Thiago), e a Metax aprova. É a ÚLTIMA etapa**: só depois da integração no ar e dos testes rodados, e depois de o Thiago conhecer a cultura da Metax e o perfil de lead (decisão de 01/10). Não propor antes. (reunião de 30/09: "Tudo, tudo você… é tudo contigo"). Registrado na #31, que foi para SP-8 e tc-8, e na especificação, rascunho 6 (`1b7cf3e`).
- **Reunião de 30/09, às 21h10, outros pontos:** a Metax é tratada como *work order*, e não projeto (o controle segue no GitHub). O pagamento da Metax entrou, e a Fran vai pedir a nota fiscal em CNPJ (MEI). Produção: "não tem espaço para erro", então o roteiro precisa de plano de rollback. Transcrição em `Downloads\Reunião - alinhamento Metax e Ferronorte.docx`.
- **Próximo status:** barras do funil (slide 4) **centralizadas**, como o Guilherme pediu na reunião de 29/09 ("é passagem de estado, não distribuição"), e na ordem do rito.
- **02/10: A INTEGRAÇÃO ESTÁ NO AR NA PRODUÇÃO** (#17 em `e4-no-ar`).
  - Implantação `0AfbL000001ROSHSA4` (01/10, 19h03) e credencial preenchida pelo Thiago, com o token em HTTP 200.
  - Primeira carga `707bL000014uEj6QAE`: 0 erros e **126 contatos**, batendo com o Salesforce (103 com oportunidade aberta e 23 para sair).
  - **Agendamento diário** `08ebL00000YA2ucQAD`, às 05:00 de Brasília, primeiro disparo em 03/10. Ele roda em nome de `metax@daspeweb.com.br` (#33).
  - Capacidade de entrega já estava em "Todos os emails".
  - Foram para `e4-no-ar`: #11, #24, #25, #26, #27, #28 e #29. **A semana de cargas sem falha do aceite começa em 03/10**; o mínimo é 09/10.
  - **Próximo:** conferir o job das 05:00 de 03/10. Depois, #32 (coluna `Respondeu` nas duas DEs, ponta a ponta na KlockDev, validar e implantar), a jornada real (#15 e #16), a documentação (#21) e os merges.
  - **#32 NO AR (02/10, tarde):**
    - coluna `Respondeu` nas duas DEs, que agora têm 17 campos;
    - ponta a ponta na KlockDev: Ana `true`, Bruno e Carla `false`;
    - implantação `0AfbL000001RVAQSA4`, depois de cancelar o agendamento (para não mudar a configuração da org) e reagendar;
    - **o agendamento ativo agora é o `08ebL00000YA7StQAL`**, com disparo às 05:00;
    - branch mesclada na `feat/jornada-mc-integracao` (`16c74c2`).
  - **Conferência de 03/10 de manhã:**
    1. job das 05:00 com 0 erros;
    2. `count` da DE;
    3. `Respondeu` aparecendo;
    4. e-mails recebidos do dia 02 (monitoramento do EWS e do Einstein, decidido pelo Thiago; o Guilherme já foi avisado).
  - **Risco anotado na #32:** aviso de fim do EWS (sincronização do Outlook) em 01/10. Em 02/10 os e-mails recebidos ainda chegavam.
- **Feito em 01/10, de dia, sem tocar na produção:**
  - **#32 provada na sandbox** (`e2-provado`), na branch `feat/i32-sinal-resposta` (worktree `C:\Users\User\code\metax-salesforce-i32`, commit `fc7f7b2`). Par: vermelho `0AfHa00000DnCDRKA3`, verde `0AfHa00000Dn5YZKAZ` (41 de 41) e vermelho ao desfazer `0AfHa00000DnCTZKA3`. Está fora do pacote da #17. Falta: a coluna `Respondeu` nas duas DEs, o ponta a ponta na KlockDev e uma validação nova depois da #17.
  - **Roteiro da implantação da #17:** `docs/jornada-mc/roteiro-producao.md` (`eeca16c`), com reversão. A primeira carga deve trazer cerca de **109 contatos**. Decidir na hora quem implanta e agenda (o alias `metax` é `metax@daspeweb.com.br`).
- **Amanhã, 01/10, nesta ordem:**
  1. implantar a #17 pelo id validado `0AfbL000001RG4vSAG` (quick deploy), **com o ok do Thiago na hora**;
  2. o Thiago configura a External Credential e o Permission Set na produção, e confere a Capacidade de entrega;
  3. primeira carga e conferência na DE real (cerca de 100 contatos: 92 com oportunidade aberta em 30/09, mais os que só têm fechadas recentes);
  4. rito da #32 na KlockDev;
  5. o Thiago decide sobre o envio do status de 30/09.
- **Achado lateral (fora do escopo):** o fluxo `DW_Opportunity_Flow_After_Solicitacao_liberacao_visita_antecipada` filtra "Aprovação financeira", mas a etapa se chama "Aprovação financeria", então ele nunca dispara. Registrado na #31.
- **Permissões:**
  - `.claude/settings.local.json` libera `sf apex run`, `sed` e `Write`;
  - o pacote de API do MC tem journeys, email e saved content (ler e gravar; email também envia), **sem publicar**.
  - A trava do Claude Code bloqueou algumas ações de produção. Não contornar: pedir ao Thiago.
- **Relatório do cliente de 30/09:** `docs/status-report/2026-09-30-rascunho/`, com o slide ontem × hoje, a logo da Metax e o fluxo desde 28/09. **Não enviado.**

## Reunião com o Guilherme (29/09, 22h17)
Transcrição: `Downloads\Metax - produção até 29.09 (1).docx`. O que ele disse sobre slides e visual do relatório ficou de fora (ele mesmo corrige a skill).

**Decisões tomadas na reunião**
- **Automação do Vitor Viana fica para trás.** Como não foi concluída, não mexemos nela; a implantação é a nossa (continua pedindo autorização explícita, #17).
- **Status ao cliente é diário, todo dia**, como o Lucas ("Javas", o "Java" da transcrição) combinou com a Metax, no relatório padrão Bunker gerado pela skill `bunker-repo-pulse-copilot` (só o que a skill gera, sem misturar com o material antigo). Pôr o **Vitor Viana em cópia**.
- **Quem toca o projeto é o Thiago.** Os materiais e as issues não devem dizer "depende de decisão do Guilherme" (soa submisso). Rótulo `bloq-decisao` = decisão do Thiago ou do cliente.
- **Especificação assinada pelo cliente.** Registrar e fechar o escopo com a Metax (ex.: quantos e-mails a jornada tem), para proteger o escopo e liberar o recebimento. O valor combinado não muda.

**Não decidido na reunião; decidido pelo Thiago em 29/09, logo depois:**
- **#24 (1):** a data da última oportunidade é a `CreatedDate`, como já está.
- **#24 (2):** opção b, com o campo Boolean `PossuiOportunidadeAberta` na DE e na Batch.
- **#26:** opção a, com a DE `Metax_Contatos_Jornada_Teste` não enviável, escolhida pelo `Organization.IsSandbox`.
- **#28:** o alerta de falha vai por e-mail para o Thiago.
- Registrado nas issues em 29/09, com o ok do Thiago (comentários na #24, #26, #28, #17 e #19). A #24 perdeu o "(Guilherme)" do título, e a #24 e a #26 saíram de `bloq-decisao`.

**Feito em 29/09, noite, com a `bunker-fix-bug-copilot` e a `bunker-pulse-copilot`:**
- **#26 provada fora do ambiente** (etapa `e2-provado`). Em sandbox, a Batch grava em `METAX_CONTATOS_JORNADA_TESTE`, escolhida pelo `Organization.IsSandbox`.
  - Par: vermelho `0AfHa00000Dlv8DKAR`, verde `0AfHa00000DlvBRKAZ` (23 de 23, Batch com 100%) e vermelho ao desfazer `0AfHa00000DlvEfKAJ`.
  - Commits `eb8bc14` (correção) e `2c41404` (doc), com push na `feat/jornada-mc-integracao`, ou seja, no PR #23.
  - **Falta, com ok do Thiago:** criar a DE de teste no MC, implantar na KlockDev, refazer o ponta a ponta com print e apagar as 2 linhas da DE real (o Thiago faz).
- **Fila organizada:**
  - o marco "Marketing Cloud" virou **"Configuração do Marketing Cloud"**, o nome que o cliente já recebe no status;
  - a #1 foi para o marco "Jornada de nutrição";
  - issues novas: **#30**, especificação assinada (P0), e **#31**, conteúdo dos e-mails da jornada (P2), as duas na triagem.
  - A separação "Descoberta" × "Acessos" não foi feita: o cliente já conhece a fase 1 com esse nome.
- **Painel do backlog** (interno): `painel-2026-09-29/backlog/pulso.html`, com as conferências passando e as fotos em `backlog/fotos/`.
  - Leitura: 16 das 19 abertas estão na triagem, e a triagem é a porta do Thiago.
  - A receita da Metax (frentes e as cores `#EA0B0B` e `#b8130b` do tema da org) está em `backlog/receita-metax.json`. Ela vale só na cópia local das skills, em `%LOCALAPPDATA%/bk/skills`, que foi usada porque o caminho do plugin passa do limite do Windows. **O Guilherme precisa pôr esse bloco no `de-para.json` do plugin.**

**Critérios de progressão (como o projeto é medido)**
- Esteira do rito, por issue: sem triagem → triagem → análise/medindo → provada → aguardando deploy → no ar → reteste. Só conta como entrega o que está **no ar**.
- Épico está 100% quando todas as issues dele estão concluídas.
- Prioridade: P0 e P1 agora; P2 na fila; P3 no estacionamento. Dentro disso, WSJF (custo do atraso ÷ tamanho).
- A fila tem que encolher: entradas × saídas no período.
- Classificação tem que refletir a realidade: issue em desenvolvimento não pode aparecer como triagem. Corrige-se a issue, nunca o relatório.

**Comandos que ele deu para o Claude**
1. Atualizar o plugin da Bunker e usar a skill de pulse de repositório (já aparece: `bunker-repo-pulse-copilot`; também `bunker-pulse-copilot`, `bunker-consultant-copilot`, `bunker-onboarding-copilot`).
2. Rever a classificação de todas as issues (etapa, conclusão errada) e corrigir nas issues.
3. Rever os nomes dos épicos: "Marketing Cloud" é nome de nuvem, não de frente; separar "Descoberta" de "Acessos" se fizer sentido; separar setup do MC, integração e jornada de nutrição.
4. Mapear, com base no rito de correção e no escopo do cliente, **todas as atividades até o fim da entrega**.
5. Regerar o relatório só com o que a skill coloca e enviar ao cliente.

**Sugestões aproveitáveis**
- Toda hora trabalhada para o cliente vira notícia para o cliente: o que foi feito e qual é o próximo passo ("vou fazer D e F para chegar em H").
- Gráfico com o tripé pergunta de negócio → título com a resposta e o número → destaque no gráfico.
- Conversa que vira dois assuntos: usar *fork* em vez de novo contexto do zero.
- Transformar a trilha do Thiago neste projeto em cards para a trilha da Bunker (depois da entrega).
- Testar a skill do consultor (beta) e, sem pressa, a de onboarding.
- Reunião com cliente: fundo da Bunker (o Guilherme vai mandar) e roupa lisa (camisa social ou polo lisa).

## Ambientes
| | Onde | Acesso |
|---|---|---|
| **Produção Sales Cloud** | alias `metax`, `metax@daspeweb.com.br` | **Só leitura** (regra do Guilherme) |
| **Sandbox** | **`KlockDev`** (Developer, criada em 29/09 à 00h06), alias `metax-dev`, `thg.k@bunkerconsultancy.com.metax.klockdev`, com perfil Administrador | Liberada |
| **Marketing Cloud** | BU Metax, MID `546010257`, subdomínio `mckkn19vl9cjt6b8p-71zcp0dlz4` | Usuário `thiago.klock`, liberado pelo Luiz Raphael em 28/09 |
| **Código** | clone `C:\Users\User\code\metax-salesforce-drift`, branch `feat/jornada-mc-integracao` | Publicada: PR [#23](https://github.com/Bunker-Growth-and-Sales-Intelligence/metax-salesforce/pull/23), em rascunho, empilhado sobre o #22 |

As sandboxes `Bunker` e `MetaxCP` (Partial) não são mais usadas. A cobrança ao Vitor Viana pela senha da `Bunker` deixou de ser necessária.

## O que ficou pronto em 29/09
- **Código provado na KlockDev:**
  - vermelho `0AfHa00000DlRwaKAF`, verde `0AfHa00000DlgxBKAR` e implantação `0AfHa00000DlgfSKAR`;
  - 19 de 19 testes e cobertura entre 98% e 100%.
- **Configuração do NPX copiada da produção,** por orientação do Guilherme: 19 perfis e 58 qualificadores, e os 7 catálogos religados. Sem isso, nenhuma oportunidade é criada numa sandbox nova. Para as próximas sandboxes: `scripts/sandbox/copiar-config-npx.ps1`.
- **Massa de teste** na sandbox: 1 conta, 5 contatos e 5 oportunidades `[JORNADA-TESTE]`.
- **Marketing Cloud:**
  - pacote de API **"Jornada Metax - Salesforce"** criado, com os segredos no Zoho Vault;
  - DE **`Metax_Contatos_Jornada`** criada (#12, fechada), com 14 campos, enviável e sem retenção.
- **Credenciais:**
  - External Credential corrigida para o protocolo Custom (commit `d6cb1cc`);
  - `clientId`, `clientSecret` e `accountId` cadastrados pelo Thiago;
  - Permission Set atribuído.
- **Ponta a ponta:**
  - token com HTTP 200;
  - Batch `707Ha00001819ieIAA` concluída, sem erros;
  - DE com 2 linhas (Ana, 1 oportunidade com obra; Bruno, 2 oportunidades numa linha só);
  - datas `AAAA-MM-DD` aceitas pelo MC.
- **Documentação:** `docs/jornada-mc/implantacao.md` reescrito com o caminho real (commit `4e6635a`).
- **GitHub:**
  - PR [#22](https://github.com/Bunker-Growth-and-Sales-Intelligence/metax-salesforce/pull/22) (drift) e PR [#23](https://github.com/Bunker-Growth-and-Sales-Intelligence/metax-salesforce/pull/23) (integração, rascunho) abertos;
  - issues fechadas com evidência: #3 (em 28/09), e #5, #6, #8, #9, #10, #12, #13 e #14 (em 29/09);
  - a #11 continua aberta, com o rótulo `e2-provado`;
  - a nova **#24** (decisões do Guilherme) está com o rótulo `bloq-decisao`.

## Revisão pelo rito de correção (29/09, noite)
- **#25, P0, corrigido na sandbox.** O tipo de obra "Infraestrutura (Pontes, Passarelas, Viadutos)" tem 45 caracteres e a DE aceitava 40. O MC recusava o lote inteiro: 8 de 74 contatos da produção derrubariam a carga toda.
  - O Builder agora corta cada texto no tamanho do campo, e o `ObraTipo` foi para **100** na DE e no contrato.
  - Par: vermelho `0AfHa00000DlsOtKAJ`, verde `0AfHa00000Dlt6PKAR`, implantado `0AfHa00000DltBFKAZ`, 21 de 21.
  - Prints na issue. Etapa: `e3-aguardando-deploy` (fecha com a #17).
- **Achados medidos que aguardam o Thiago** para virar issue:
  - **sandbox gravando na DE real da produção:** há 2 linhas de teste lá, e a `MetaxCP` tem dados reais;
  - **opt-out:** 0 de 1.128 hoje, mas é LGPD;
  - **sem alerta** quando o job falha;
  - **buracos de teste e de script.**
- **Latentes, só registrados:** o fuso de quem agenda (todos em São Paulo hoje) e os segredos sem escape no JSON do token.
- **Quadro:**
  - a #3 e a #12 foram fechadas com o rótulo errado (`e0-triagem` e `bloq-ambiente`);
  - a #24 está sem etapa e sem WSJF;
  - a #5, a #6 e a #11 saíram da triagem sem a palavra do Thiago.
  - Tudo isso aguarda decisão.

## Próximos passos
0. **Estado em 30/09, manhã:**
   - #24, #28 e #30 liberadas da triagem (`e1-medindo`).
   - #28: o alerta vai para o Thiago **e o Luiz Raphael**, com a lista configurável (a Metax assume os avisos depois).
   - **#26 provada de ponta a ponta** (`e3-aguardando-deploy`; fecha com a #17):
     - implantada na KlockDev (`0AfHa00000DmN1FKAV`, 23 de 23);
     - a DE `Metax_Contatos_Jornada_Teste` foi criada pela API SOAP, não transmissível, sem retenção e com os 14 campos da real;
     - o Batch `707Ha0000186Rv3IAE` gravou a Ana e o Bruno na DE de teste (atualização em 30/09), e a DE real ficou intacta (29/09);
     - os prints estão em `evidencias/i26` (commit `90561b1`).
   - Scripts de SOAP do MC (ler a definição da DE, criar a DE, ler as linhas) ficaram no scratchpad da sessão de 30/09. Se forem úteis de novo, levar para `scripts/mc/`.
   - A DE real ainda tinha 2 gravações às 9h de 30/09.
   - O status report do cliente não foi gerado, por decisão do Thiago.
   - **#27 opt-out:** caminho B, com o campo `OptOutEmail` na DE e saída da jornada na hora. Implementar junto com a #24; a regra de saída fica "sem oportunidade aberta ou opt-out".
   - **DE real limpa** pelo Thiago (conferida pela API, `count=0`). **#11: aguardar**, por decisão do Thiago.
   - **#24 e #27 provadas de ponta a ponta** (`e3-aguardando-deploy`; fecham com a #17):
     - medido na produção, só leitura: 82 contatos com oportunidade aberta, 17 só com fechadas (todas mexidas nos últimos 90 dias) e 0 com opt-out;
     - par: vermelho `0AfHa00000DmY4jKAF`, verde `0AfHa00000DmWR8KAN` (28 de 28) e vermelho ao desfazer `0AfHa00000DmXwgKAF`;
     - implantado na KlockDev (`0AfHa00000DmWuCKAV`) e rodado no Batch `707Ha0000186Ve1IAE`: a Carla foi com `aberta=false` e a Ana com `optout=true` (marcado só no teste e desfeito);
     - a DE de teste ganhou os 2 campos Boolean (16 campos);
     - commits `877fc7d`, `355daaf` e `3e607e1`.
   - **Para a produção (#17):** criar `PossuiOportunidadeAberta` e `OptOutEmail` na DE real ANTES de implantar.
   - **Para a jornada (#15):** entrada exige `aberta=true` e `optout=false`; saída quando `aberta=false` ou `optout=true`.
   - **O Thiago precisa revisar** os 3 testes antigos que mudaram por causa da #24 (lista no comentário do par na #24). Como revisar: abrir o commit `877fc7d`, arquivo `JornadaContatoBatchTest.cls`, e responder na #24.
   - **#28 alerta de falha provado** (`e2-provado`):
     - commit `62cf26c`, par `0AfHa00000Dmd9FKAR` → `0AfHa00000DmdKXKAZ` (30 de 30) → `0AfHa00000DmWJ6KAN`;
     - implantado na KlockDev (`0AfHa00000DmdnZKAR`);
     - destinatários no Custom Metadata `JornadaMC_Config__mdt.Padrao`, por enquanto só o Thiago;
     - rodado sobre o job real que falhou em 29/09: o alerta foi montado, o envio foi barrado pela sandbox e a rotina não quebrou;
     - **falta** o Thiago liberar o e-mail na KlockDev (Setup → Capacidade de entrega → "Todos os e-mails") para ver o aviso chegar.
   - **Tarefa do final:** incluir o e-mail do Luiz Raphael nos destinatários (#28, #17).
   - **ESCOPO = direcionamento do Guilherme (reunião de 24/09, "Alinhamento - briefing Metax"), NÃO o e-mail da Opção 2.** Os termos mudaram depois da ligação do Lucas com a Virginia.
     - Entra: a DE central de contato, alimentada pelo Sales Cloud, com a régua de data e a jornada.
     - Fica de fora: Synchronized DE, Automation Studio e o retorno ao Chatter.
   - **#30 especificação:** rascunho 3 em `docs/jornada-mc/especificacao.md` (commit `343441b`).
     - **Régua em três temperaturas** (Thiago, pela orientação do Guilherme): até 15 dias quente, 16 a 30 morno, 31 a 90 frio, mais de 90 fora, vazio nunca entra. A jornada separa pela `DataUltimaOportunidade`; não há campo novo no código.
     - **O conteúdo dos e-mails é da Metax.**
     - Falta decidir: quantos e-mails por faixa e com que intervalo.
     - Os comentários errados de hoje na #20, na #30 e na #31 foram tarjados, com a retificação na #30.
   - **Conferência dos comandos do Guilherme (transcrição de 29/09), feita em 30/09:**
     - #9, #12 e #14 receberam avisos de "superado", sem reabrir;
     - a #28 trocou `in-progress` por `bloq-ambiente`;
     - lacuna achada: a jornada não tem onde ser testada (a DE de teste não envia). O Thiago decidiu pelo **modo de teste do Journey Builder** (#16).
   - **Triagem liberada pelo Thiago:** #19 (`e4-no-ar`), #7 (`e3-aguardando-deploy`), #31, #21 e #29. **#20 fechada**, resolvida pela especificação. Revisão dos 3 testes da #24: ok do Thiago, com um reforço (`50c252d`).
   - **#29 concluída na sandbox** (`e3-aguardando-deploy`):
     - 6 reforços de teste, provados por defeitos propositais;
     - token não-JSON tratado (`5aeb173`);
     - script NPX corrigido e `scripts/mc/` só de leitura (`d464e3a`);
     - datas em São Paulo (`173204e`);
     - escape do token e desempate aceitos como débito;
     - 38 de 38 implantados na KlockDev.
   - **Próximo: #21** (documentação passo a passo para o Raphael).
   - **Decisões técnicas e de escopo são todas do Thiago**, porque o cliente não tem conhecimento técnico. Os 10 pontos "de cliente" (arquitetura/#20, e-mails/#31, régua, #4, nutrição de 17/09, "Metax - Journey API", alertas, produção, documentação) passam a ser perguntas para o Thiago.
1. **Registrar as decisões do Thiago** (já tomadas, ver a reunião acima) na #24, na #26 e na #28, e tirar "(Guilherme)" do título da #24.
2. **Apagar as 2 linhas de teste da DE** (Ana e Bruno): o Thiago faz.
3. **Terminar a #26:** DE de teste no MC → implantação na KlockDev → ponta a ponta com print. Só então ligar a **#11** (`JornadaContatoSchedulable.agendar();`, 05:00).
4. **Rever classificação e épicos das issues** e mapear as atividades até o fim da entrega (pedido do Guilherme).
5. **Status diário** pela `bunker-repo-pulse-copilot`, com o Vitor Viana em cópia.
6. **Especificação** para a Metax assinar.
7. **Jornada no Journey Builder** (#15), com entrada pela régua de 15/30/90 dias.
8. **Revisar e fazer o merge:** o PR #22 na `main` primeiro; depois o #23, que passa a apontar para a `main`.

## Pontos em aberto
- **"Metax - Journey API":** pacote de API de outra integração, instalado em 24/09 e ainda em uso. O Guilherme não sabe de quem é. **Não mexer.**
- **Envios "[Nutrição] [Campinas]"** de 17/09 no Email Studio: já houve nutrição manual. Vale entender antes de montar a jornada.
- **Revisão automática do GitHub** (Claude bot) pulada por falta de créditos da organização. Não afeta nada; só um admin libera.
- **`DWPropostaMetaxControllerTest.cls:111`** provavelmente falha na V12. É código antigo, fora do escopo.

## Status diário ao cliente
- **Modelo:** `modelo-status-diario.md`, no formato do Lucas.
- **Destinatários:** Virginia, com Luiz Raphael, Lucas e (a partir da reunião de 29/09) Vitor Viana em cópia.
- **Formato:** relatório da `bunker-repo-pulse-copilot`, todo dia; sem datas nem prazos, até o Thiago conversar com o Lucas.
- **Envio:** 28/09 e 29/09 enviados (o de 29/09 reenviado pelo Thiago a todos), sempre como "Responder a todos" na thread original.

## Arquitetura (Guilherme, 24 e 25/09)
- Schedulable diária → Batch que monta um registro por contato (Account, Contact, Opportunity e OpportunityContactRole) → API do MC com Named Credential → DE central.
- Sem Flow. TDD com `HttpCalloutMock`. Tudo em sandbox, e produção só com autorização explícita (#17).
