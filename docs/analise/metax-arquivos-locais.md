# O que os arquivos locais da Metax mostram

Leitura feita em 11/11/2026 da pasta local do projeto (`Documents\Bunker\Metax`), enviada pelo Thiago. Os arquivos úteis estão em [`../origem/metax/`](../origem/metax/). Ficaram de fora: os decks e PDFs de status, o painel, os status diários enviados e a lista de melhorias visuais das skills de relatório. As versões antigas do "onde paramos" e do prompt da próxima sessão foram lidas e removidas: o que elas tinham de próprio está registrado abaixo.

Complementa a análise do GitHub da Metax feita na aba "Boas práticas + case Metax" (ver [`skills-bunker-existentes.md`](skills-bunker-existentes.md)).

## 1. A passagem de sessão já existia, feita à mão

O projeto funcionou com dois arquivos que o Thiago mantinha fora do repositório:

- **`onde-paramos.md`, o mapa.** Estado atual no topo e histórico embaixo.
- **`prompt-proxima-sessao.md`, o prompt de abertura de cada sessão nova.** Diz o que ler, onde está o código, o que fazer agora e as regras que valem.

É o mesmo desenho que a pesquisa recomenda: um arquivo de estado curto lido em toda retomada e um histórico lido sob demanda. Só que os dois estavam no mesmo arquivo, e isso cobrou um preço:

| Sinal | Medida |
|---|---|
| Crescimento do mapa | de 6.917 palavras (05/10) para 10.676 (versão final), cerca de 55% em uma semana |
| Estado e histórico misturados | o prompt precisava dizer "leia só a seção 09/10/2026: ESTADO ATUAL (o resto é histórico)" |
| Avisos contra refazer trabalho | "NÃO refaça", "Não repetir" e "HISTÓRICO, JÁ EXECUTADO, NÃO REFAZER" aparecem várias vezes. É sinal de que sessões novas refaziam o que já estava feito |
| Correções empilhadas | no topo do estado atual, atualizações de 13/10, 15/10 e 19/10 em blocos de citação, uma corrigindo a outra ("a correção de 13/10 foi superada") |
| Fora do repositório | o mapa nunca foi commitado; não tinha histórico nem era visível para ninguém além do Thiago |

**Para a Lighthouse:** o estado mora no repositório do projeto, cabe numa tela e é reescrito a cada ciclo; o histórico fica em outro arquivo, que só acumula. O prompt da próxima sessão sai pronto no fim de cada turno. Antes de escrever essa regra, conferir a `bunker-fechar-turno-copilot`, que já cuida do fim da sessão.

## 2. O escopo tinha três fontes, e nenhuma era a sentença

O próprio mapa avisava: "O escopo vale pelo direcionamento do Guilherme (24/09 e reunião de 05/10), e não pelo e-mail da Opção 2." Ou seja, havia três fontes ao mesmo tempo:

1. o e-mail aprovado da Opção 2 (24/09), que o `setup-quadro-metax.sh` cita como origem do plano;
2. as conversas com o Guilherme (24/09, 25/09, 29/09 e 05/10);
3. a especificação, começada em 30/09, dois dias depois do primeiro código (28/09), e levada do rascunho 1 ao 10.

O que mudou no caminho, só nos arquivos locais:

- o número de e-mails da jornada (3, depois 9, 6 e, por fim, 7);
- quem escreve os e-mails: "o conteúdo dos e-mails é da Metax" (30/09) virou "conteúdo = Bunker (Thiago), a Metax aprova" (01/10);
- o que fica de fora: Synchronized DE, Automation Studio e o retorno ao Chatter, que estavam na Opção 2, saíram depois de uma ligação do Lucas com a Virginia ("os termos mudaram"), registrada só no mapa;
- o WhatsApp: em 05/10, a #34 passou a medir a temperatura pelo WhatsApp registrado; no mesmo dia, o direcionamento foi "WhatsApp fora de escopo, só o que está registrado no Salesforce".

**Confirma duas regras já fechadas:** a sentença é a fonte única, e cada conversa nova (transcrição, reunião, e-mail) é confrontada com ela. E a checagem de cobertura teria levantado os canais reais de contato (WhatsApp incluído) no mapeamento de 25/09, e não em 05/10, depois da integração no ar.

## 3. O quadro de issues nasceu inteiro, num script

Em 25/09, o `setup-quadro-metax.sh` criou de uma vez 6 marcos e 20 issues:

| Medida | Resultado |
|---|---|
| Issues com P0 | 11 das 20 |
| Issues que nasceram em `e0-triagem` | 19 das 20 |
| Abertas em triagem em 29/09 | 16 de 19, e "a triagem é a porta do Thiago" |

Muitas não eram defeitos nem entregas, e sim rituais e eventos: "Status diário ao cliente" (#19, aberta o projeto inteiro), "Alinhar com o Raphael a arquitetura", e depois o aceite (#30), o deck (#41) e a reunião de entrega (#42). No fim, issues foram fechadas para zerar o quadro antes da reunião, e o trabalho que continuava valendo ficou numa lista "sem issue" no último comentário da #42.

**Para as regras de issues da Lighthouse (ainda em aberto):**
- issue é uma entrega verificável, não um evento, um ritual ou um pedido de aprovação; reunião, aceite e status vivem na sentença e no estado;
- P0 é escasso por definição: com 11 de 20 em P0, a prioridade não ordena nada;
- a fila nasce da sentença, aos poucos, e não de um script com o plano inteiro antes do mapeamento.

## 4. Muitas portas de aprovação

"Com o ok do Thiago" aparece 23 vezes no mapa. Uma parte protege o que precisa ser protegido: produção, ativação da jornada, envio ao cliente e gravação de dados reais. Outra parte é porta interna: merge de documentação, saída da triagem, fechamento de issue e merge de PR de docs. Exemplo: em 09/10, o PR #46 (deck, e-mails e manifesto) ficou aberto esperando o ok.

Também havia dependência de terceiro acompanhada por cobrança: "Cobrar o Thiago a cada sessão: o Guilherme já criou o caso da Metax (#30)?"

**Decisão do Thiago (11/11/2026):** as portas ficam, as externas e as internas. Elas não causaram o retrabalho, e a skill vai para outras pessoas da Bunker no mesmo cenário de quem não domina o trabalho. Os números do GitHub batem com isso: o tempo parado veio do rito aplicado a trabalho pronto (nota refeita, print para mudar etapa, reteste) e da espera do cliente, e não das aprovações.

## 5. A estimativa e a espera do cliente

Em 05/10, o mapa estimava o trabalho interno restante em "cerca de 19 h, 2,5 dias cheios". O trabalho interno terminou em 10/10 (zero issues abertas). A ativação, porém, ainda esperava a reunião com a Metax em 19/10, mais de uma semana depois. O calendário foi dominado pela espera do cliente, e não pelo trabalho.

**Para a Lighthouse:** o estado e o relatório separam "trabalho nosso" de "espera do cliente". É a mesma lacuna da `bunker-repo-pulse-copilot`, que não separa "aguardando o cliente" de "em andamento".

## 6. O que funcionou e vale virar padrão

- **Decisão pronta para aprovar** (`decisoes-especificacao-2026-10-06.md`): cada decisão traz a medição, um caso simulado, a recomendação e o texto pronto para a especificação. Fecha com "Aprovou, eu aplico." É exatamente o formato de pergunta que a Lighthouse quer.
- **Revisão em linguagem de negócio** (`revisao-i35.md`): a mudança explicada pelo que acontece com o contato, com caso concreto e data ("o e-mail do dia 7 sai em 06/10, cinco dias depois da proposta").
- **Regra do Thiago:** "antes de recomendar uma opção, simular um caso concreto".
- **Briefing em três partes** (`briefing-alinhamento-2026-10-05.md`): o que levar ao Guilherme, o que levar ao cliente numa reunião única, e o que é decisão só do Thiago e não vai para ninguém.
- **Sessão paralela com escopo fechado** (`prompt-layout.md`): "Esta conversa é SÓ sobre layout e texto dos e-mails… Você NÃO grava nada." Um assunto por sessão, com o que ela pode e não pode fazer.
- **Modelo de status ao cliente** (`modelo-status-diario.md`): sem jargão interno, cada item fala do resultado, e todo pedido ao cliente diz o quê, de quem e até quando.
- **Scripts separados por efeito:** os que só leem (`ler-*.apex`) e os que gravam (`GRAVA-*.apex`), com ensaio antes.
