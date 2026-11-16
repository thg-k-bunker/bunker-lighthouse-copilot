# Decisões da bunker-lighthouse-copilot

Atualizado em 12/11/2026. A pesquisa terminou e as decisões para começar a produção estão fechadas.

## Fechado

| Tema | Decisão |
|---|---|
| Nome | `bunker-lighthouse-copilot`, no padrão `bunker-<dominio>-copilot`. O `name:` do SKILL.md é igual ao nome da pasta. "Farol" é só apelido |
| Objetivo | Padrão de processo internalizado para ter produtividade em tarefas desconhecidas, sem retrabalho e sem tempo improdutivo. Skill de suporte, no estilo das outras da Bunker. Natural: nem interrogatório, nem burocracia, nem muitas etapas. Vai sendo refinada com o uso |
| Coerência | Vale criar: nenhuma skill da Bunker cuida da entrada de um trabalho novo (transcrição até escopo fechado). Condição: ser enxuta, cuidar só dessa lacuna e apontar para as skills donas do resto, sem copiar regra |
| Entrada | Quase sempre uma transcrição ou explicação colada pelo usuário: sempre existe contexto prévio |
| Início da fase 1 | O Claude devolve o entendimento (serviço, problema, para quem, resultado esperado) em 3 ou 4 linhas, e o usuário confirma |
| Mapa do terreno | Não é obrigatório. Explicação só sob demanda |
| Perguntas | Uma por vez, com recomendação. Exceção: a regra do passo 0 da `bunker-fix-bug-copilot`, que junta até 4 perguntas de assuntos diferentes numa chamada e depois volta ao ritmo normal |
| Transcrição nova | É confrontada com a sentença: confirma, acrescenta ou contradiz. Só a contradição muda a sentença, e só com decisão do usuário (aditamento) |
| Checagem de cobertura | Antes da emissão da sentença, o Claude confronta a sentença com o que todo trabalho daquele tipo precisa ter (exemplo: o WhatsApp como canal de venda no Brasil). O que faltar vira pergunta. É interna, não é explicação |
| Emissão da sentença | Fecha a fase de conhecimento, com um aviso de que ela foi superada. O termo "catch", usado no início das conversas, queria dizer o pulo do gato da skill, e não é nome de etapa: não se usa na skill (Thiago, 12/11/2026) |
| WSJF | Sai do conhecimento e vai para a execução. Ordem: caminho crítico, depois a maior incerteza, e o WSJF desempata, com a régua da `bunker-wsjf-copilot`. A nota é dada uma vez e só é refeita com fato novo |
| Trabalho manual | Não entra na skill: se o usuário quiser fazer à mão, faz |
| Processo no GitHub | Fica fora da Lighthouse e segue o padrão da Bunker: rito da `bunker-fix-bug-copilot` e régua da `bunker-wsjf-copilot`. A Lighthouse não cria rótulos, etapas nem regras de issue. Motivo: na Metax, o trabalho de controle no GitHub foi quase todo do agente e pesou pouco no tempo humano; o gargalo foi a falta de processo definido (decisão do Thiago, 11/11/2026). Análise em [`analise/metax-github.md`](analise/metax-github.md) |
| Alcance | A skill cobre qualquer projeto, de qualquer tipo ou domínio, sem lista fechada de tipos. A checagem de cobertura combina perguntas universais, lentes pela natureza do trabalho e itens do especialista gerados na hora, que viram biblioteca com o uso (Thiago, 11/11/2026) |
| Foco da pesquisa | Um padrão global de levantamento e mapeamento: o que um profissional muito eficiente faz toda vez antes de executar. A Metax é exemplo, não a lista completa dos problemas (Thiago, 11/11/2026) |
| Portas de aprovação | Ficam as duas: o ok humano no que é irreversível ou sai para fora (produção, cliente, dado real) e também no trabalho interno (merge, saída da triagem, fechamento de issue). Motivo: a skill vai para outras pessoas da Bunker que também não dominam o que estão fazendo, e as portas não foram a causa do retrabalho na Metax (decisão do Thiago, 11/11/2026) |
| Quem decide | O Thiago é sempre o responsável: decide o escopo e dá os oks das portas de aprovação. A skill não pergunta quem decide, quem paga nem quem assina. Se existir alguém que possa travar o projeto (TI, jurídico, diretoria, o cliente), isso vem na transcrição ou é informado por ele. Terceiro citado na transcrição é registrado na sentença; ausente, não vira pergunta (Thiago, 11/11/2026) |
| Tolerâncias | A sentença fixa o resultado, o critério de pronto e três tolerâncias, em faixa (mínimo, provável, máximo): **prazo, esforço e escopo**. A qualidade é coberta pelo critério de pronto, em que o essencial tem tolerância zero e o desejável pode flexionar. O plano de passos é revisável dentro das tolerâncias, sem aditamento. Só vira aditamento a mudança de resultado, de critério de pronto ou de tolerância. A escalação é pela **previsão** de estouro, não depois dele. Incidente pequeno: resolvido dentro do passo. Médio: muda o plano sem estourar tolerância. Grande: atinge resultado ou critério de pronto, ou estoura tolerância. Método verificado em [`pesquisa/prince2-tolerancias.md`](pesquisa/prince2-tolerancias.md) (Thiago, 12/11/2026) |
| Perfil do projeto | O Claude **infere** o perfil (novidade, tecnologia, complexidade e ritmo, Camada 0 do [`padrao-global-levantamento.md`](pesquisa/padrao-global-levantamento.md)) a partir da transcrição e o confirma dentro do entendimento de 3 ou 4 linhas, sem pergunta extra. O perfil define a profundidade do levantamento (Thiago, 12/11/2026) |
| Formato (D1) | O `SKILL.md` leva só o fluxo: entendimento, perguntas, cobertura, sentença e execução. Em `references/` ficam as perguntas universais, as lentes, a regra de parada e o modelo da sentença, lidos conforme o perfil do projeto (Thiago, 12/11/2026) |
| Etapas da fase de conhecimento (D2) | Sete, tiradas dos 11 movimentos do [`padrao-global-levantamento.md`](pesquisa/padrao-global-levantamento.md): ler tudo antes de perguntar (1), devolver o entendimento (2), ancorar o resultado com métrica (parte do 3, sem o decisor), separar problema de solução (4), checagem de cobertura (7), uma pergunta por vez (8), regra de parada e sentença (11). Processo real (5), dados e ambiente (6), critério verificável (9) e estimativa em faixa (10) viram itens obrigatórios da checagem de cobertura, sem etapa própria (Thiago, 12/11/2026) |
| Rastreio da origem (D3) | Leve. Só o que vira requisito leva a fonte e o grau de confiança: visto, dito por quem faz, dito por gestor, só documentado ou inferido. Conflito entre fontes vira pergunta e nunca é resolvido por conveniência. Opcional, sob demanda: um questionário para terceiro responder, quando a resposta mora com o cliente (Thiago, 12/11/2026) |
| Sentença, estado e histórico (D4) | Três arquivos no repositório do projeto, commitados: `SENTENCA.md` (estável, só muda por aditamento), `ESTADO.md` (cabe numa tela, reescrito a cada ciclo, inclui o que se espera do cliente) e `HISTORICO.md` (só acumula, lido sob demanda). O prompt da próxima sessão sai pronto no fim de cada turno. A `bunker-fechar-turno-copilot` não cobre estado nem prompt, então a Lighthouse é a dona desse formato (Thiago, 12/11/2026) |
| Práticas da execução (D5) | Proporcionais ao perfil. Sempre: nada é "feito" sem evidência (saída, link ou print); ao humano só se pergunta preferência, valor, restrição ou fato que só ele sabe, e o técnico o Claude pesquisa; o passo que vai estourar a tolerância para e é reavaliado. Só em perfil alto ou ação irreversível: pre-mortem antes da sentença e revisor independente nos marcos. No encerramento: revisão curta de 4 perguntas, e a lição só vale se virar regra, pergunta ou item de checklist. WIP = 1 não é escrito, porque a ordem já é um passo por vez (Thiago, 12/11/2026) |
| Biblioteca do especialista (D6) | Fica para a v2. Na v1, no encerramento, o Claude propõe os itens que pegaram algo, e o Thiago decide se entram no plugin por PR (Thiago, 12/11/2026) |
| Métricas (D7) | Sem painel na v1. O histórico registra só três fatos: perguntas feitas depois da sentença, aditamentos e passos reabertos (Thiago, 12/11/2026) |
| A Metax não é escopo | A Metax foi só o exemplo que originou a skill. Nada dela entra no que vai para o plugin (`SKILL.md`, `description`, `references/` e evals): nem nome, nem pessoas, nem números de issue, nem termos do projeto (tensor, NPX, Journey Builder, canais da Metax). Os exemplos da skill são genéricos, de qualquer domínio. Os parênteses "o que teria pegado na Metax" do [`padrao-global-levantamento.md`](pesquisa/padrao-global-levantamento.md) e os itens do especialista semeados a partir dela ficam só como pesquisa. Na skill, "o Thiago" vira "quem conduz o projeto", porque ela vai para outras pessoas da Bunker. As pastas `analise/` e `origem/metax/` são evidência e não vão para o plugin (Thiago, 12/11/2026) |
| Testes | O caso Metax é usado como teste de comportamento à mão, só neste repositório, porque é o único com gabarito real do que faltou perguntar. Para os evals do plugin, um caso genérico de outro domínio. Nada da Metax vai para o plugin (Thiago, 12/11/2026) |
| Aceite do cliente | Quando o trabalho é para um cliente, o escopo vai para ele na emissão da sentença, ao fim da fase de conhecimento, quando já se sabe o que vai ser entregue e como. A skill prepara a versão em linguagem de negócio, e quem conduz revisa e envia. O aceite **não bloqueia nada**, nem o início da execução: a sentença só registra se está pendente ou obtido, e o pendente aparece no estado como espera do cliente. Mudança de ideia que vem do aprendizado de quem executa (como o número de e-mails na Metax) é parte do trabalho, e a skill não deve atrapalhar a curva de aprendizado (Thiago, 12/11/2026) |
| Confete na emissão da sentença | Na troca da fase de conhecimento para a de execução, a skill solta o confete da `bunker-confetes-ou-perguntas-copilot`, como numa entrega: a sentença emitida é verificável (o arquivo existe no caminho dito). Continua valendo o confete no fim da entrega (Thiago, 12/11/2026) |

## O que a skill usa sem copiar

| Assunto | Skill dona |
|---|---|
| Como perguntar | `bunker-fix-bug-copilot`, passo 0 |
| Ordem e notas | `bunker-wsjf-copilot`, `references/regua.md` |
| Anatomia da issue e procura de issue parecida | `bunker-fix-bug-copilot` |
| Como terminar o turno | `bunker-confetes-ou-perguntas-copilot` |
| Relatório ao cliente | `bunker-repo-pulse-copilot` |

## Ponto de atenção principal: a qualidade das perguntas

Registrado pelo Thiago em 16/11/2026. **É o ponto mais crítico para as próximas mudanças da skill.** Não muda nada agora; é para validar no uso.

A fase de conhecimento foi desenhada para perguntas rápidas e objetivas, que não tomem muito tempo: pergunta-se só o que muda escopo, custo ou risco, uma por vez, e o resto entra como premissa confirmada em bloco. O risco é a pressa custar qualidade na sentença: perguntas rasas demais, ou contexto de menos para trabalho complexo.

O que observar em cada uso real:

- **Premissa errada:** algo assumido na sentença que se mostrou falso depois.
- **Pergunta que chegou tarde:** dúvida de negócio que só apareceu depois da sentença (o encerramento já soma essas perguntas no histórico).
- **Aditamento por falta de pergunta:** mudança de escopo que uma pergunta na fase de conhecimento teria evitado.
- **Pergunta rasa:** quem conduz sentiu que a pergunta não tocou no ponto difícil do trabalho, ou respondeu sem pensar porque a recomendação parecia óbvia.

Se esses sinais aparecerem, a mudança provável é dar mais profundidade à fase de conhecimento quando o perfil do projeto for alto (mais contexto lido antes de perguntar, mais perguntas, ou perguntas mais abertas), sem perder a rapidez no trabalho pequeno.

## Em aberto

Nenhuma decisão de desenho pendente: as sete da [`sintese-pre-producao.md`](sintese-pre-producao.md) (D1 a D7) foram fechadas em 12/11/2026, todas pela recomendação. O rascunho do `SKILL.md`, da `description` e dos `references/` está em `skills/bunker-lighthouse-copilot/`, na branch `feat/rascunho-skill` (12/11/2026), esperando a revisão do Thiago. Depois vêm os evals de roteamento e o teste de comportamento com a Metax.

Nenhuma decisão pendente. A última, sobre o aceite do cliente, foi fechada em 12/11/2026 (linha "Aceite do cliente" acima).

Ficam registrados, sem bloquear a produção:

- **Regras de issues para trabalho de projeto:** saem da Lighthouse pela decisão de 11/11/2026 (padrão da Bunker). Os indícios de [`analise/metax-arquivos-locais.md`](analise/metax-arquivos-locais.md), seção 3, ficam como sugestão para a skill dona, se o Thiago quiser levar adiante.
- **Ajustes de texto em outros arquivos:** os da seção 6 da síntese (bloco "Pessoas e decisão" do padrão global e o resumo da página Padrão Farol, já superado por este arquivo).
- **Correções nas skills donas** (fora da Lighthouse, pedem alinhamento com quem decidiu as regras):
  - a `bunker-wsjf-copilot` refaz todas as notas a cada rodada, inclusive as dadas à mão, e isso contradiz "nota dada uma vez";
  - a esteira e0 a e6 da `bunker-fix-bug-copilot` foi feita para defeito e, aplicada a trabalho de projeto, deixou entregas prontas esperando cerca de 7 dias para fechar;
  - a `bunker-repo-pulse-copilot` não separa "aguardando o cliente" de "em andamento".
