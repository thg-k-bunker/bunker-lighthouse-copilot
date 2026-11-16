# Skills públicas candidatas para a Lighthouse

Levantamento de 11/11/2026 no GitHub (busca de repositórios e de código). **Nenhuma skill foi lida por inteiro.** Os dados vêm só dos metadados do repositório e de trechos da descrição. Estrelas e licença são do repositório, não da skill. Antes de adotar qualquer uma, ler o `SKILL.md` e conferir a licença.

Critério mínimo de confiança: repositório com pelo menos 50 estrelas e licença clara. Mesmo assim, nada entra sem leitura integral do `SKILL.md` e dos scripts anexos (rede, `curl`, escrita fora do projeto) e conferência da licença da skill.

Filtro aplicado: ficou de fora o que a Bunker já validou (perguntar uma por vez, WSJF, anatomia de issue e triagem, fechar turno, relatório ao cliente) e os frameworks de spec-driven development (`spec-kit`, `OpenSpec`, `GSD`), que repetem as duas fases. Pelo princípio "não copia regra de ninguém", o uso é referenciar a ideia, não copiar o texto.

## Candidatas por lacuna

| Lacuna | Skill | Repositório (licença, estrelas) | Ideia a aproveitar | Leitura |
|---|---|---|---|---|
| Provar o mapa antes de assinar | `process-map-validation-and-signoff` | `Sahil-SS9/agent-personas` (MIT, 69★) | Cada elemento rastreado até a evidência, caminhos percorridos com quem executa, versões e aprovações | lida em 11/11/2026 (ver abaixo) |
| A sentença em si | `to-spec` | `mattpocock/skills` (MIT, 321k★) | Sintetiza a conversa em spec sem entrevistar. É o catch | lida em 11/11/2026 (ver abaixo) |
| Decisão que mora com outra pessoa | `to-questionnaire` | `mattpocock/skills` | Questionário assíncrono para o cliente responder | lida em 11/11/2026 (ver abaixo) |
| Trabalho maior que uma sessão | `wayfinder` | `mattpocock/skills` | Mapa de tickets de decisão, resolvidos um por vez | lida em 11/11/2026 (ver abaixo) |
| Manter a skill enxuta | `classify-size` | `genkovich/sdd` (MIT, 203★) | Tamanho XS–XL define rota rápida, padrão ou completa | lida em 11/11/2026 (ver abaixo) |
| Deriva de termos e decisões | `glossary`, `decide-adr` | `genkovich/sdd` | Termo canônico com "NÃO é"; registro posterior de decisão tomada em chat | lida em 11/11/2026 (ver abaixo) |
| Falso "pronto" | `verification-before-completion` | `obra/superpowers` (MIT, 316k★) | Nada fecha sem evidência | lida em 11/11/2026 (ver abaixo) |
| "Onde paramos" | `planning-with-files`; `handoff` | `OthmanAdi/planning-with-files` (MIT, 28k★); `mattpocock/skills` | `task_plan.md`, `findings.md` e `progress.md` em disco, com recuperação de sessão; handoff para outro agente retomar | lida em 11/11/2026 (ver abaixo) |
| Antecipar falha | `pre-mortem` | `avelikiy/great_cto` (MIT, 115★); `akillness/jeo-skills` (MIT, 54★) | Imagina o projeto já falhado e trabalha de trás para frente; tigre, tigre de papel e elefante | lida em 11/11/2026 (ver abaixo) |

## Ordem sugerida de leitura

1. `process-source-elicitation` e `process-map-validation-and-signoff`: cobrem a entrada, onde nasceu o retrabalho da Metax.
2. `to-spec` e `to-questionnaire`: reforçam o catch e a decisão que depende de terceiro.
3. `verification-before-completion`: ataca o falso "pronto".

## Leitura integral de 11/11/2026

Lidos `SKILL.md`, arquivos anexos, `NOTICE` e `LICENSE` de cinco skills, nos commits `4ae2317` (mattpocock/skills), `22f0b46` (obra/superpowers) e `e0524f5` (Sahil-SS9/agent-personas). Nenhuma tem script próprio nem referência de rede (`curl`, `wget`, URL). Licença MIT confirmada nos três repositórios.

| Skill | O que faz de fato | Dependências | Veredito |
|---|---|---|---|
| `to-spec` | Sintetiza a conversa em spec sem entrevistar; esboça os pontos de teste e confirma com o usuário; publica no tracker com o rótulo `ready-for-agent`. Modelo: problema, solução, histórias, decisões, testes, fora de escopo | Tracker de issues e `/setup-matt-pocock-skills`; vocabulário de código (seams, ADR) | Aproveitar a ideia: sentença = síntese sem nova entrevista, com "fora de escopo" explícito. O modelo é de software; precisa de modelo próprio |
| `to-questionnaire` | Entrevista o usuário só sobre o envio (quem recebe, o que precisa de volta) e escreve um questionário em Markdown para outra pessoa responder. Ordem por importância, uma ideia por pergunta, "não sei" é resposta válida | Nenhuma | Aproveitar quase inteira. É a mais próxima de uso direto. Casa com "decisor mapeado só em 20/10" na Metax |
| `wayfinder` | Mapa de tickets de decisão para trabalho maior que uma sessão: destino, decisões já tomadas, "ainda não especificado" (neblina) e "fora de escopo". Um ticket por sessão | Tracker, `grilling`, `domain-modeling`, `research`, `prototype`, subagentes | Aproveitar só a distinção neblina x ticket ("a pergunta já dá para formular com precisão?") e o "fora de escopo". O resto duplica a fase de conhecimento e a fila de issues da Bunker |
| `verification-before-completion` | Lei única: nenhuma afirmação de conclusão sem evidência fresca. Roda o comando, lê a saída, só então afirma. Tabela de "o que prova cada afirmação" e de desculpas | Nenhuma | Aproveitar. Os exemplos são de código (testes, build), mas a regra serve a entrega de projeto: "requisitos atendidos" exige checklist linha a linha, não "testes passam". Cobre o falso "pronto" |
| `process-map-validation-and-signoff` | Valida mapa de processo em três camadas: evidência (cada elemento ligado a um fato ou marcado como assumido; acima de cerca de 1/5 assumido não segue), estrutura e gente. Passa o caminho com quem executa e registra versão e aprovação | `bpmn-xml-authoring-and-validation`, `process-map-visual-standard` (scripts `check_bpmn.py`, `check_visual_standard.py`) e uma etapa de elicitação, que não li | Aproveitar a regra do assumido e o registro de aprovação. A skill sozinha não fecha: pressupõe um mapa e uma elicitação feitos antes, e a elicitação é justamente a lacuna da Lighthouse |

Os scripts `check_bpmn.py` e `check_visual_standard.py` foram lidos na segunda leitura: só `xml`, `json`, `re`, `zipfile` e `argparse`, sem rede nem subprocesso.

## Segunda leitura de 11/11/2026

Commits lidos: `genkovich/sdd` `b7e1e6e`, `OthmanAdi/planning-with-files` `51bf62d`, `avelikiy/great_cto` `0ebfcde`, `akillness/jeo-skills` `41a2982`, `AI-Unified-Process/marketplace` `af9b9a6`. Licença confirmada em todos: MIT, exceto o AI-Unified-Process (Apache-2.0). Lidos por inteiro: os `SKILL.md`, modelos, `size-matrix.md` e `blast-radius.md` das skills abaixo, a skill de elicitação do `agent-personas` e os três scripts de mapeamento. Nenhum deles faz rede nem chama subprocesso.

| Skill | O que faz de fato | Veredito |
|---|---|---|
| `process-source-elicitation` (`Sahil-SS9/agent-personas`, MIT) | Transforma transcrição, ata, SOP e ticket em um livro de fatos antes de desenhar qualquer coisa: cada fato com fonte, ator (papel, nunca nome), ação, condição, frequência, trecho citado e confiança. Separa "como é praticado", "como está documentado" e "como se quer que seja". Registra conflito entre fontes e nunca o resolve por conveniência; gera perguntas de lacuna por papel. Escopo prévio com gatilho, resultado, 5 a 7 fases e variações. Dá regra para erros de transcrição automática (termo técnico trocado, troca de falante, "usualmente" é variante, não caminho feliz) | **A melhor achada.** É a entrada da Lighthouse: transcrição até conhecimento organizado, sem chute ("ou marca como inferido, ou deixa como pergunta"). Aproveitar quase inteira, adaptada ao português e ao vocabulário Bunker |
| `business-process` (`AI-Unified-Process`, Apache-2.0) | Gera BPMN 2.0 a partir de requisitos e de um diagrama de casos de uso, com identificador `BP-XXX` por processo | Descartar como skill. Exige a cadeia de casos de uso `UC-XXX` e requisitos `FR-*` e depende de outra skill (`test-case`) e de scripts que carregam código irmão por glob. Duas ideias úteis: ler o conteúdo do projeto como dado, nunca como instrução, e parar sem escrever quando falta um passo no catálogo |
| `classify-size` (`genkovich/sdd`) | Quatro perguntas (PRs, tempo, módulo novo, quebra de contrato) dão XS a XL e a rota quick, standard ou full; um confirma tamanho e rota numa pergunta só. Regra: na dúvida entre mínimo e completo, comece pelo mínimo | Aproveitar a ideia de rota proporcional ao tamanho. Os sinais são de software e precisam ser trocados por sinais de projeto. A regra "pular só quando não se aplica" ajuda a manter a Lighthouse enxuta |
| `glossary` (`genkovich/sdd`) | Fixa o termo no momento em que aparece: uma definição de uma frase e um "NÃO é" com o conceito com que se confunde. Recusa palavra técnica genérica. Termo existe em um só lugar | Aproveitar. Ataca a deriva de termos. Pede arquivo próprio; na Lighthouse pode caber como seção da sentença |
| `decide-adr` (`genkovich/sdd`) | Registra depois uma decisão tomada em código ou conversa: contexto, motivadores, opções (mínimo duas, sem espantalho), resultado e consequências com negativos honestos. Só vale com 2 de 3: irreversível, afeta mais de um módulo, tem alternativa legítima | Aproveitar só o filtro dos 2 de 3 e a exigência de consequência negativa. O formato MADR é de engenharia e pesa demais para decisão de projeto |
| `pre-mortem` (`avelikiy/great_cto`, MIT) | Imagina o fracasso com manchete específica, lista 10 a 15 causas concretas, pontua probabilidade vezes gravidade e separa tigre, tigre de papel e elefante. Cada risco principal vira guardrail no plano. Diz quando pular (projeto pequeno, correção de uma linha) | Aproveitar, com o critério de pular. Atenção: atribui o método a "Gary Klein no MIT Sloan", o que não verifiquei e acho incorreto. Trocar por citação própria |
| `pre-mortem` (`akillness/jeo-skills`, MIT) | Mesma tríade, mais curta, com links para um blog de produto | Descartar: o texto parece derivado de material de terceiros, sem origem declarada. Ficar com a do `great_cto` |
| `retro` (`mattpocock/skills`) | Retrospectiva de sessão de código: propõe melhorias no **ambiente** do agente (navegação, checagem automática, padrões, instruções globais) | Pouco aproveitável: é sobre melhorar o ambiente do agente, não sobre lição de projeto virar regra. A ideia central, "transformar defeito em checagem determinística, não em mais texto de instrução", vale para a Lighthouse |
| `handoff` (`mattpocock/skills`) | Resume a conversa em arquivo para outro agente retomar; não duplica o que já está em issue, commit ou spec; remove segredos | Aproveitar a regra de referenciar em vez de copiar e de remover segredo. Grava em `/tmp`, ao contrário do que a pesquisa da Metax pede ("onde paramos" no repositório, com histórico) |
| `planning-with-files` (`OthmanAdi`, MIT) | Três arquivos (`task_plan.md`, `findings.md`, `progress.md`) como memória em disco, com fases e "Próximo passo"; teste dos 5 pontos para saber se o contexto está são. Instala ganchos em todo prompt e em toda chamada de ferramenta, com cerca de 550 KB de scripts, modos autônomo e com portão de conclusão | Não adotar como skill: pesada demais para uma skill que deve ser natural e enxuta, e os ganchos mexem em toda a sessão. A documentação de segurança é boa (dado entre delimitadores, atestado por hash, sem envio de rede). Aproveitar só a ideia: três arquivos, o teste dos 5 pontos ("onde estou, para onde vou, qual é a meta, o que aprendi, o que fiz") e "Próximo passo" sempre atualizado. Regra útil: conteúdo externo vai só para `findings.md`, nunca para o plano |

### O que ainda não foi lido

- Os scripts do `planning-with-files` foram só varridos por padrões (rede, `curl`, `eval`, `rm -rf`, `git push`): nada de rede, e os ganchos só leem e escrevem em `.planning/` do projeto, mas o `session-catchup.py` lê as transcrições de sessões do usuário quando chamado de forma explícita. Não li as 550 KB linha a linha.
- Não li os modelos e exemplos do `planning-with-files`, as skills de que `to-spec` e `wayfinder` dependem (`domain-modeling`, `research`, `prototype`, `writing-for-agents`; a `grilling` foi lida em 16/11/2026, ver "Quarta leitura"), nem as demais skills de `agent-personas` e `great_cto` (por exemplo `process-architecture-levels` e `momtest-interviewing`).

## Conclusão: o que entra como referência de desenho

| Etapa da Lighthouse | Fonte aproveitada |
|---|---|
| Entrada: transcrição até fatos organizados | `process-source-elicitation` |
| Decisão que depende de terceiro | `to-questionnaire` |
| Sentença | `to-spec` (síntese sem nova entrevista, com fora de escopo) |
| Proporção do ritual | `classify-size` (rota proporcional ao tamanho) |
| Termos e decisões | `glossary` (com "NÃO é") e filtro 2 de 3 do `decide-adr` |
| Risco antes de executar | `pre-mortem` do `great_cto` |
| Falso "pronto" | `verification-before-completion` |
| Prova do mapa e aprovação | `process-map-validation-and-signoff` |
| Onde paramos | três arquivos e teste dos 5 pontos, sem os ganchos |

## Terceira leitura (`agent-personas`, MIT, commit `e0524f5`)

| Skill | Veredito |
|---|---|
| `process-architecture-levels` | Hierarquia L1 a L4 de processo, com correspondência ao APQC. Pensada para panorama de organização inteira, grande demais para uma skill por tarefa. Aproveitar só a **matriz de cobertura** (o que a evidência sustenta em cada nível) e duas regras: "nunca fabricar detalhe fino a partir de conversa grosseira" e "não colapsar evidência rica numa caixa e perdê-la: guardar como candidata" |
| `momtest-interviewing` | Entrevistar comportamento passado, não opinião. Curta e já coberta pela escala de confiança da `process-source-elicitation` (observado vale mais que dito, dito vale mais que desejo). Descartar por redundância |

## Quarta leitura (`mattpocock/skills`, MIT, commit `5863806`, 16/11/2026)

Lidas `grill-me` e `grilling`. A `grill-me` só chama a `grilling` e roda apenas quando o usuário digita `/grill-me`. Nenhuma das duas tem script nem referência de rede.

| Skill | O que faz de fato | Veredito |
|---|---|---|
| `grilling` | Entrevista o usuário até o entendimento ficar comum. Organiza as decisões numa árvore de dependência e, a cada rodada, faz de uma vez todas as perguntas cujos pré-requisitos já estão resolvidos, numeradas e com resposta recomendada, redigidas para que "sim" aceite a recomendação. Fato é trabalho do agente: um subagente busca no ambiente sem travar as perguntas que não dependem dele; decisão é do usuário. Termina quando nada ficou assumido em silêncio, e não age antes da confirmação | A Lighthouse já cobre o núcleo na fase de conhecimento (pergunta com recomendação, o Claude pesquisa o técnico, regra de parada) e vai além (sentença, arquivos, execução). Não adotar como skill. Descartar a rodada com todas as perguntas de uma vez (contraria "uma pergunta por vez" da casa) e o "nada assumido" (a Lighthouse assume de propósito o que não muda escopo, custo ou risco e confirma em bloco na sentença) |

**Ideias candidatas, sem entrar na skill agora.** Decisão do Thiago em 16/11/2026: só registrar; o foco é pôr a Lighthouse em uso. Cada ideia entra só se o uso real mostrar o sinal correspondente.

| Ideia | Sinal no uso real que justifica entrar | Cuidado |
|---|---|---|
| Ordem pela dependência: uma pergunta só vai quando as perguntas de que ela depende já foram respondidas | Pergunta feita antes da resposta de que dependia | Não mudar o lote da pressa (até quatro, como na `bunker-fix-bug-copilot`), para não se afastar do padrão da casa |
| Subagente busca o fato sem travar a conversa; esperam só as perguntas que dependem dele | Conversa parada esperando o Claude conferir algo no ambiente ou na documentação | Custa tokens, e nem todo lugar onde a skill roda tem subagente (o chat do claude.ai, por exemplo) |

## Fechamento da etapa de pesquisa de skills públicas

**Concluída em 11/11/2026.** Todas as candidatas que passaram o critério mínimo foram lidas, e as lacunas da Lighthouse que a pesquisa podia cobrir estão cobertas (ver tabela "Conclusão: o que entra como referência de desenho").

Comparação de estrutura com referências públicas de ciclo de vida com portões. Não é certificação.

| Prática de referência | Cobertura na Lighthouse |
|---|---|
| Fase de criação seguida de fase de execução, com portão entre elas (IBM Garage: Co-Create, Co-Execute, Co-Operate; ciclos de governo do Reino Unido, Canadá e Victoria com pontos de decisão) | Conhecimento, catch e execução |
| Termo de abertura e linha de base de escopo aprovada (PMI) | Sentença com resultado, critério de pronto e fora de escopo |
| Levantamento de requisitos rastreável (prática de análise de negócio) | `process-source-elicitation`: livro de fatos com fonte e confiança |
| Controle de mudança depois da linha de base | Aditamento da sentença, só com decisão do usuário |
| Aceite formal pelo cliente | Regra "nada em produção antes do aceite da sentença" e registro de aprovação do `process-map-validation-and-signoff` |
| Gestão de risco antecipada | `pre-mortem` |
| Lições que viram regra | Regra "lição só vale se mudar o processo" |

**O que não foi verificado:** o método da Deloitte (não encontrei documento público com fases e portões, só páginas de marketing) e o conteúdo oficial do PMBOK 8 (só fontes secundárias, que divergem entre si sobre grupos de processos). A estrutura acima está alinhada com o que é público; não afirmamos conformidade com Deloitte, IBM ou PMI.

**Decisões de desenho ainda abertas (não são lacunas de pesquisa).** Conferidas em 11/11/2026 contra `../decisoes.md` e `padrao-global-levantamento.md`, já com a análise da Metax no repositório:
1. ~~Quem decide e quem aprova~~ Decidido em 11/11/2026 (ver `../decisoes.md`): o Thiago é sempre o responsável, e quem puder travar o projeto vem na transcrição ou é informado por ele. A skill não pergunta isso.
2. ~~Tolerâncias~~ Decidido em 12/11/2026 (ver `../decisoes.md`): prazo, esforço e escopo, em faixa, com gestão por exceção. Método verificado em `prince2-tolerancias.md`.
3. ~~Proporção do ritual~~ Decidido em 12/11/2026: o Claude infere o perfil do projeto e o confirma no entendimento de 3 ou 4 linhas. A `classify-size` fica só como inspiração.

A fase de execução e o processo no GitHub deixaram de ser pendência de pesquisa: a análise da Metax foi concluída e o processo de issues ficou fora da Lighthouse (decisão de 11/11/2026).

## Lacuna de mapeamento a partir de transcrição

`gersoncorreias/claude-bpmn` (0★) e `andrewluxem/standard-operating-procedures` (0★) saíram pelo critério mínimo. Podem servir só como referência de ideia, sem rodar nem copiar. A `process-source-elicitation` do `agent-personas` fecha essa lacuna (ver acima). A `business-process` do `AI-Unified-Process` foi avaliada e descartada.

## Excluídas por licença

`BMAD-METHOD` e `borghei/Claude-Skills` (NOASSERTION); `anthropics/skills` e `opscale-co/skills` (sem licença no repositório).

## Limite da pesquisa

O acesso a repositório externo estava bloqueado na sessão, então só foi possível usar a busca. A leitura do conteúdo fica para a próxima etapa.
