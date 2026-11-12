---
name: bunker-lighthouse-copilot
description: "Padrão da Bunker para começar e conduzir um trabalho novo que quem executa ainda não domina, a partir da transcrição ou do briefing desse trabalho. Duas fases, como no processo judicial. Conhecimento: devolve o entendimento em 3 ou 4 linhas, pergunta só o que muda escopo, custo ou risco, uma pergunta por vez e com recomendação, roda a checagem de cobertura e emite a sentença, o escopo único do trabalho, com resultado, critério de pronto e tolerâncias. Execução: segue o caminho crítico, resolve cedo a maior incerteza, confronta toda conversa nova com a sentença e guarda sentença, estado e histórico junto do projeto. Use quando colarem a transcrição ou o briefing de um projeto novo, ou disserem \"projeto novo\", \"nunca fiz um projeto assim\", \"não domino esse assunto e preciso entregar\", \"monta o escopo desse trabalho\". Defeito já reportado é da bunker-fix-bug-copilot; a próxima ação do dia, da bunker-consultant-copilot; dúvida sobre a casa, da bunker-onboarding-copilot."
---

# Lighthouse: trabalho novo sem retrabalho

Em trabalho que a pessoa ainda não domina, o tempo se perde em refazer e em esperar. As causas se repetem: o escopo muda a cada conversa, o que ninguém perguntou aparece no fim, e o fio se perde de uma sessão para a outra. Esta skill é o processo para evitar as três.

Duas fases, na lógica do processo judicial. A **fase de conhecimento** termina com a **sentença**, o documento único do escopo. A **fase de execução** trabalha contra a sentença. A emissão da sentença é o **catch**: o aviso de que a fase de conhecimento foi superada.

**Quem conduz o projeto é sempre o responsável.** É a pessoa que chamou a skill: ela decide o escopo e dá o ok nas portas de aprovação. A skill não pergunta quem decide, quem paga nem quem assina. Se alguém de fora pode travar o trabalho, isso vem na transcrição ou é dito por quem conduz, e entra na sentença.

## Antes de tudo: é começo ou retomada?

Procurar `docs/lighthouse/` no projeto.

- **Existe `SENTENCA.md`:** é retomada na execução. Ler o `ESTADO.md`, depois a `SENTENCA.md`. Material novo segue "Conversa nova depois da sentença".
- **Existe só `ESTADO.md`:** é retomada na fase de conhecimento. Ler o estado e continuar de onde parou.
- **Não existe nada:** é começo. Seguir a fase 1.

## Os três arquivos

Moram em `docs/lighthouse/`, no repositório do projeto, e são commitados no fim de cada turno. Sem repositório, ficam na pasta que quem conduz indicar, e a skill recomenda criar um. Os modelos estão em `references/modelos.md`.

| Arquivo | O que guarda | Quando nasce | Regra |
|---|---|---|---|
| `ESTADO.md` | Onde estamos, o próximo passo, o que espera quem conduz e o que espera o cliente | Na confirmação do entendimento | Cabe numa tela; reescrito a cada turno |
| `HISTORICO.md` | O que foi feito, decidido e perguntado, com data | Na confirmação do entendimento | Só acumula; lido sob demanda |
| `SENTENCA.md` | Resultado, critério de pronto, tolerâncias, fora de escopo, premissas, decisões e o plano | No catch | Resultado, critério de pronto e tolerâncias só mudam por aditamento. O plano muda dentro das tolerâncias, sem aditamento |

## Fase 1: conhecimento

**Perfil do projeto.** Ler o material e classificar os quatro eixos (novidade, tecnologia, complexidade e ritmo) pela tabela de `references/perfil-do-projeto.md`. O perfil decide a profundidade: trabalho pequeno e fácil de desfazer roda no modo leve.

### 1. Ler tudo antes de perguntar

Ler a transcrição, os e-mails, a proposta e todo material colado. Separar fato, opinião e solução já imaginada. Tudo o que vai ser requisito leva a fonte e o grau de confiança, pela tabela de `references/checagem-de-cobertura.md`. Conflito entre fontes é levado a quem conduz como pergunta.

### 2. Devolver o entendimento

Em 3 ou 4 linhas: qual é o serviço, que problema ele resolve, para quem, e o resultado esperado. Mais uma linha com o perfil. A confirmação vai na caixinha (`AskUserQuestion`): "está certo", "quero corrigir um ponto", "o pedido é outro". Com o entendimento confirmado, criar o `ESTADO.md` e o `HISTORICO.md`.

A checagem pode ser preparada antes, em silêncio, para a primeira pergunta já sair pronta. Nenhuma outra pergunta vai antes da confirmação.

### 3. Ancorar o resultado

Que número ou situação muda, para quem e até quando. Sem resultado verificável, a sentença não tem critério de pronto. Data que o cliente já pediu entra como desejo dele, e só passa a compromisso depois da estimativa em faixa.

### 4. Separar problema de solução

Para cada pedido em forma de solução ("quero um campo", "quero um painel"), entender que decisão ou trabalho ele serve. O pedido entra na sentença ligado ao problema. Pedido de simplicidade do cliente é restrição da entrega e não muda o perfil.

### 5. Checagem de cobertura

Rodar `references/checagem-de-cobertura.md`, em três camadas: as perguntas universais, as lentes pela natureza do trabalho e os itens do especialista do domínio. É interna: quem conduz vê só as perguntas que ela gera.

**O padrão é responder pelo material ou assumir.** Cada item é respondido pelo material, assumido como premissa, verificado pelo Claude ou levado a quem conduz. Só vai para a fila de perguntas o que muda escopo, custo ou risco. O resto entra como premissa e é confirmado em bloco no catch.

### 6. Perguntar o que falta

Formato das perguntas: o do passo 0 da `bunker-fix-bug-copilot`, em `AskUserQuestion`, em linguagem de negócio, opções com o que fazem e o que custam, a recomendada primeiro. A resposta vai para o `HISTORICO.md` e, quando decide algo, para as decisões da sentença. Sem `AskUserQuestion`, a mesma pergunta vai em texto, com as opções numeradas.

**Uma pergunta por vez**, primeiro o que muda escopo ou arquitetura. Quando quem conduz pede pressa, até quatro de assuntos diferentes numa chamada, como a fix-bug permite, e depois volta ao ritmo normal. Nesta skill, essa exceção vale sobre a regra de uma decisão por chamada da `bunker-confetes-ou-perguntas-copilot`.

Regras próprias:

- **Ao humano se pergunta só preferência, valor, restrição ou fato que só ele sabe.** O técnico, o Claude pesquisa na documentação ou confere no ambiente e traz como recomendação. Incerteza de ferramenta que nenhuma pesquisa resolve é testada num experimento curto antes do desenho.
- **Pergunta de escolha traz a recomendação, o motivo e a alternativa mais forte**, com um caso concreto simulado ("com a opção A, o pedido feito na sexta à noite só aparece no relatório de segunda"). Pergunta de fato ("qual é o sistema?") vai sem recomendação.
- **Questionário para terceiro, quando quem conduz pedir**, ou quando a resposta mora com o cliente e quem conduz aceitar a sugestão: no máximo oito perguntas, em ordem de importância, uma ideia por pergunta, "não sei" como resposta válida. Como sai para o cliente, segue o tom externo da `bunker-brand-copilot`.

### 7. Parar e emitir a sentença

O levantamento acaba quando valem as seis condições de `references/regra-de-parada.md`.

Em perfil alto, e sempre que o plano tiver ação irreversível, fazer o pre-mortem antes de emitir: "daqui a X semanas isto fracassou; por quê?" Os riscos principais entram na sentença.

Escrever a `SENTENCA.md` pelo modelo. Ela fixa três tolerâncias em faixa (mínimo, provável e máximo): **prazo, esforço e escopo**. A qualidade fica no critério de pronto: o essencial tem tolerância zero, e o desejável pode flexionar. Mostrar a quem conduz as premissas ainda não confirmadas, numa caixinha só, para confirmar em bloco. Commitar.

**O catch.** Com a sentença commitada, soltar o confete da `bunker-confetes-ou-perguntas-copilot`, com o caminho do arquivo, o primeiro passo do caminho crítico e a maior incerteza.

## Conversa nova depois da sentença

Toda transcrição, reunião ou e-mail que chegar depois da sentença é confrontado com ela:

| O que a conversa traz | O que acontece |
|---|---|
| Confirma | Registra no histórico e segue |
| Acrescenta, dentro das tolerâncias | Entra como passo novo no plano, registrado no histórico |
| Contradiz, ou estoura uma tolerância | Para e pergunta a quem conduz. Só com a decisão dele entra como aditamento, registrado na sentença com data |

A conversa nova nunca substitui a sentença em silêncio. Toda pergunta de negócio feita depois da sentença é registrada no histórico como tal.

## Fase 2: execução

**A ordem.** Primeiro o que destrava o caminho crítico, a sequência de passos dependentes que define o prazo. Depois o passo de maior incerteza, para a surpresa aparecer cedo. Entre passos livres, o WSJF desempata: dar as notas pela régua de `references/regua.md` da `bunker-wsjf-copilot`, sem rodar aquela skill sobre o plano. A nota é dada uma vez, quando o passo nasce, e só é refeita com fato novo.

**Cada passo.** Dizer em uma linha o que vai ser feito e como se sabe que ficou pronto. Fazer. Juntar a evidência. Atualizar o plano, o estado e o histórico.

**Nada é "feito" sem evidência**: a saída do comando, o link, o id da execução ou o print. Projetos costumam parecer 90% prontos muito antes de estarem ([Ford e Sterman, MIT, 2003](https://www.mit.edu/~jsterman/90_Syndrom_CERA2003_1.pdf)), e agentes costumam declarar pronto antes da hora ([Anthropic](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)). Passo fechado que volta a abrir é registrado no histórico como reaberto.

**Tolerâncias e incidentes.** A escalação é pela previsão de estouro, antes que ele aconteça.

| Incidente | Quando | O que acontece |
|---|---|---|
| Pequeno | Resolve-se dentro do passo | Registra no histórico |
| Médio | Muda o plano, sem estourar tolerância | Replaneja os passos afetados e avisa |
| Grande | Atinge o resultado ou o critério de pronto, ou vai estourar uma tolerância | Para. Volta à fase de conhecimento só para o ponto afetado e termina com um aditamento |

**Revisor independente.** Em perfil alto, nos marcos (o fim de cada pacote de passos do plano), e antes de toda ação irreversível, um agente que não fez o trabalho confere a entrega contra a sentença.

**Portas de aprovação.** Pedem o ok de quem conduz, na hora: o que é irreversível ou sai para fora (produção, envio ao cliente, gravação em dado real) e também o trabalho interno (merge, saída da triagem, fechamento de issue). Se os passos virarem issues, elas seguem o rito da `bunker-fix-bug-copilot`. Esta skill não cria regra de issue.

**Espera do cliente.** O `ESTADO.md` separa o trabalho nosso do que espera o cliente: o quê, de quem e desde quando.

## Fim de cada turno

Um turno é cada resposta que devolve a vez a quem conduz.

1. Reescrever o `ESTADO.md` e acrescentar ao `HISTORICO.md` o que foi feito, decidido e perguntado. Commitar.
2. Gerar o prompt da próxima sessão pelo modelo de `references/modelos.md`. Ele traz os caminhos dos arquivos, e nunca um segredo.
3. Terminar pela `bunker-confetes-ou-perguntas-copilot`: confete se a entrega fechou, caixinha se falta uma decisão de quem conduz.

## Encerramento

Começa quando todos os itens essenciais do critério de pronto têm evidência.

1. Conferir o critério de pronto final, item por item.
2. Revisão curta no histórico, com quatro perguntas: o que deveria acontecer, o que aconteceu, por que houve diferença, e o que manter e o que mudar.
3. Cada lição é escrita como regra, pergunta ou item de checklist proposto para esta skill. Lição sem mudança escrita fica registrada como não incorporada.
4. Propor os itens do especialista que pegaram algo e as perguntas que chegaram tarde. Quem conduz decide se entram no plugin por PR.
5. Somar no histórico: perguntas feitas depois da sentença, aditamentos e passos reabertos.

## O que esta skill não faz

- Não cria rótulo, etapa nem regra de issue: isso é da `bunker-fix-bug-copilot` e da `bunker-wsjf-copilot`.
- Não monta relatório ao cliente: isso é da `bunker-repo-pulse-copilot`.
- Não conserta defeito já reportado: isso é da `bunker-fix-bug-copilot`.
- Não explica a Bunker nem os sistemas da casa: isso é da `bunker-onboarding-copilot`.
- Não explica o domínio por conta própria. Explica sob demanda, quando quem conduz não entende uma pergunta ou um passo.
