---
name: bunker-lighthouse-copilot
description: "Padrão da Bunker para começar e conduzir um trabalho que quem executa ainda não domina, a partir de uma transcrição ou explicação colada. Duas fases, como no processo judicial. Conhecimento: devolve o entendimento em 3 ou 4 linhas, pergunta só o que falta, uma pergunta por vez e com recomendação, roda a checagem de cobertura e emite a sentença, o escopo único do trabalho, com resultado, critério de pronto e tolerâncias. Execução: segue o caminho crítico, depois a maior incerteza, com o WSJF de desempate, confronta toda conversa nova com a sentença e guarda sentença, estado e histórico no repositório do projeto. Use quando colarem a transcrição de uma reunião ou o briefing de um trabalho novo, ou disserem \"projeto novo\", \"nunca fiz isso\", \"não domino isso\", \"por onde começo esse projeto\", \"monta o escopo\". Defeito já reportado é da bunker-fix-bug-copilot; a próxima ação do dia, da bunker-consultant-copilot; dúvida sobre a casa, da bunker-onboarding-copilot."
---

# Lighthouse: trabalho novo sem retrabalho

Em trabalho que a pessoa ainda não domina, o tempo se perde em refazer e em esperar. As causas se repetem: o escopo muda a cada conversa, o que ninguém perguntou aparece no fim, e o fio se perde de uma sessão para a outra. Esta skill é o processo para evitar as três.

Ela tem duas fases, na lógica do processo judicial. A **fase de conhecimento** termina com a **sentença**, o documento único do escopo. A **fase de execução** trabalha contra a sentença e só a muda por **aditamento**. A emissão da sentença é o **catch**: o aviso de que a fase de conhecimento foi superada.

**Quem conduz o projeto é sempre o responsável.** É a pessoa que chamou a skill: ela decide o escopo e dá o ok nas portas de aprovação. A skill não pergunta quem decide, quem paga nem quem assina. Se alguém de fora pode travar o trabalho (TI, jurídico, diretoria, o cliente), isso vem na transcrição ou é dito por quem conduz, e entra na sentença.

## Os três arquivos

Moram no repositório do projeto, na pasta `docs/lighthouse/`, e são commitados. Os modelos estão em `references/modelos.md`.

| Arquivo | O que guarda | Regra |
|---|---|---|
| `SENTENCA.md` | Resultado, critério de pronto, tolerâncias, fora de escopo, premissas, decisões, maior incerteza e passos | Estável e curta. Só muda por aditamento |
| `ESTADO.md` | Onde estamos, o que falta, o próximo passo e o que esperamos do cliente | Cabe numa tela. Reescrito a cada ciclo e lido em toda retomada |
| `HISTORICO.md` | O que foi feito e decidido, com data | Só acumula. Lido sob demanda |

Ao retomar um trabalho, a primeira leitura é o `ESTADO.md`, depois a `SENTENCA.md`. O histórico só se lê quando o estado manda.

## Fase 1: conhecimento

Antes de qualquer pergunta, classificar o **perfil do projeto** em quatro eixos (novidade, tecnologia, complexidade e ritmo), lendo a transcrição. O perfil decide a profundidade de tudo o que vem abaixo, pela tabela de `references/perfil-do-projeto.md`. Trabalho pequeno e fácil de desfazer roda no modo leve.

### 1. Ler tudo antes de perguntar

Ler a transcrição, os e-mails, a proposta e todo material colado. Separar o que é fato, o que é opinião e o que é solução já imaginada por alguém.

Tudo o que vai ser requisito leva a fonte e o grau de confiança:

| Confiança | Quando |
|---|---|
| visto | conferido no ambiente, no dado ou na tela |
| dito por quem faz | quem executa o trabalho no dia a dia disse |
| dito por gestor | quem gerencia disse, sem ver na prática |
| só documentado | está num documento, e ninguém confirmou |
| inferido | conclusão do Claude, marcada como premissa |

Quando duas fontes discordam, o conflito é levado como pergunta a quem conduz, e a versão mais conveniente nunca é escolhida por conta própria.

### 2. Devolver o entendimento

Em 3 ou 4 linhas: qual é o serviço, que problema ele resolve, para quem, e o resultado esperado. Na mesma mensagem, o perfil inferido, numa linha. Quem conduz confirma ou corrige. Sem a confirmação, nada segue.

### 3. Ancorar o resultado

Que número ou situação muda, para quem e até quando. Sem um resultado verificável, a sentença não tem critério de pronto.

### 4. Separar problema de solução

Para cada pedido em forma de solução ("quero um campo", "quero um painel"), entender que decisão ou trabalho ele serve. O pedido entra na sentença como uma das soluções possíveis, ligado ao problema.

### 5. Checagem de cobertura

Rodar `references/checagem-de-cobertura.md`, em três camadas: as perguntas universais, as lentes pela natureza do trabalho e os itens do especialista do domínio, gerados na hora. Processo real, dados e ambiente, critério verificável e estimativa em faixa são obrigatórios em todo trabalho.

Cada item termina **respondido**, **assumido** (premissa com dono e prazo para confirmar) ou **fora de escopo**. Nenhum fica em branco. A checagem é interna: quem conduz vê as perguntas que ela gera, e não a lista.

### 6. Perguntar o que falta

As perguntas seguem o passo 0 da `bunker-fix-bug-copilot`: em `AskUserQuestion`, em linguagem de negócio, **uma por vez**, primeiro o que muda escopo ou arquitetura. Com pressa declarada, até quatro de assuntos diferentes numa chamada, e depois volta ao ritmo normal.

Três regras próprias desta skill:

- **Ao humano se pergunta só preferência, valor, restrição ou fato que só ele sabe.** O técnico, o Claude pesquisa na documentação ou confere no ambiente e traz como recomendação. Incerteza de ferramenta que nenhuma pesquisa resolve é testada num experimento curto antes do desenho.
- **Toda recomendação traz o motivo e a alternativa mais forte**, e vem de um caso concreto simulado ("com a opção A, o pedido feito na sexta à noite só aparece no relatório de segunda").
- **Quando a resposta mora com outra pessoa**, a skill pode escrever um questionário curto para quem conduz encaminhar: ordem por importância, uma ideia por pergunta, "não sei" como resposta válida.

### 7. Parar e emitir a sentença

O levantamento acaba quando valem as seis condições de `references/regra-de-parada.md`. Parar por sensação ("já entendi") é o erro mais comum.

Em projeto de perfil alto (novidade, tecnologia ou complexidade alta), fazer o pre-mortem antes de emitir: "daqui a X semanas isto fracassou; por quê?" Os riscos principais entram na sentença.

Escrever a `SENTENCA.md` pelo modelo, criar o `ESTADO.md` e o `HISTORICO.md`, e commitar. A sentença fixa três tolerâncias em faixa (mínimo, provável e máximo): **prazo, esforço e escopo**. A qualidade fica no critério de pronto: o essencial tem tolerância zero, e o desejável pode flexionar.

**O catch.** Com a sentença commitada, soltar o confete da `bunker-confetes-ou-perguntas-copilot`, com o caminho do arquivo e a maior incerteza, que é por onde a execução começa.

## Conversa nova depois da sentença

Toda transcrição, reunião ou e-mail que chegar depois da sentença é confrontado com ela, item por item:

| O que a conversa traz | O que acontece |
|---|---|
| Confirma | Registra no histórico e segue |
| Acrescenta, dentro das tolerâncias | Entra como passo novo no plano, registrado no histórico |
| Contradiz, ou estoura uma tolerância | Para. Pergunta a quem conduz. Só com a decisão dele entra como aditamento, registrado na sentença com data |

A conversa nova nunca substitui a sentença em silêncio.

## Fase 2: execução

**A ordem.** Primeiro o que destrava o caminho crítico. Depois o passo de maior incerteza, para a surpresa aparecer cedo. O WSJF desempata, com a régua da `bunker-wsjf-copilot`. A nota é dada uma vez, quando o passo nasce, e só é refeita com fato novo.

**Cada passo.** Declarar em uma linha o que vai ser feito, como se sabe que ficou pronto e por que ele vem agora. Fazer. Juntar a evidência. Atualizar o estado e o histórico.

**Nada é "feito" sem evidência**: a saída do comando, o link, o id da execução ou o print. "Parece pronto" não conta. Projetos costumam parecer 90% prontos muito antes de estarem ([Ford e Sterman, MIT, 2003](https://www.mit.edu/~jsterman/90_Syndrom_CERA2003_1.pdf)), e agentes costumam declarar pronto antes da hora ([Anthropic](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)).

**Tolerâncias e incidentes.** O plano de passos é revisável dentro das tolerâncias, sem aditamento. A escalação é pela previsão de estouro, antes que ele aconteça.

| Incidente | Quando | O que acontece |
|---|---|---|
| Pequeno | Resolve-se dentro do passo | Registra no histórico |
| Médio | Muda o plano, sem estourar tolerância | Replaneja os passos afetados e avisa |
| Grande | Atinge o resultado ou o critério de pronto, ou vai estourar uma tolerância | Para. Volta à fase de conhecimento só para o ponto afetado e termina com um aditamento |

Passo que vai estourar o próprio orçamento também para e é reavaliado antes de continuar.

**Revisor independente.** Em projeto de perfil alto, e antes de toda ação irreversível, um agente que não fez o trabalho confere a entrega contra a sentença.

**Portas de aprovação.** Pedem o ok de quem conduz, na hora: o que é irreversível ou sai para fora (produção, envio ao cliente, gravação em dado real) e também o trabalho interno (merge, saída da triagem, fechamento de issue). Issues, rótulos, etapas e notas seguem o padrão da Bunker: o rito da `bunker-fix-bug-copilot` e a régua da `bunker-wsjf-copilot`. Esta skill não cria regra de issue.

**Espera do cliente.** O `ESTADO.md` separa o trabalho nosso do que espera o cliente, com o que se espera, de quem e desde quando.

## Fim de cada turno

1. Reescrever o `ESTADO.md` e acrescentar ao `HISTORICO.md` o que foi feito e decidido.
2. Gerar o prompt da próxima sessão pelo modelo de `references/modelos.md`. Ele traz os caminhos dos arquivos, e nunca um segredo.
3. Terminar pela `bunker-confetes-ou-perguntas-copilot`: confete se a entrega fechou, caixinha se falta uma decisão de quem conduz.

## Encerramento

1. Conferir o critério de pronto final, item por item, com evidência.
2. Conferir a passagem: nenhuma rotina agendada, integração ou credencial fica no nome de quem sai do projeto.
3. Revisão curta, em cinco linhas, com quatro perguntas: o que deveria acontecer, o que aconteceu, por que houve diferença, e o que manter e o que mudar.
4. Cada lição é escrita como regra, pergunta ou item de checklist proposto para esta skill. Lição sem mudança escrita fica registrada como não incorporada.
5. Propor os itens do especialista que pegaram algo, e as perguntas que chegaram tarde. Quem conduz decide se entram no plugin por PR.
6. Registrar no histórico três números: perguntas de negócio feitas depois da sentença, aditamentos e passos reabertos.

## O que esta skill não faz

- Não cria rótulo, etapa nem regra de issue: isso é da `bunker-fix-bug-copilot` e da `bunker-wsjf-copilot`.
- Não monta relatório ao cliente: isso é da `bunker-repo-pulse-copilot`.
- Não conserta defeito já reportado: isso é da `bunker-fix-bug-copilot`.
- Não explica a Bunker nem os sistemas da casa: isso é da `bunker-onboarding-copilot`.
- Não explica o domínio por conta própria. Explica sob demanda, quando quem conduz não entende uma pergunta ou um passo.
