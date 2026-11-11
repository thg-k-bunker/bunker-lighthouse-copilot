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
| Manter a skill enxuta | `classify-size` | `genkovich/sdd` (MIT, 203★) | Tamanho XS–XL define rota rápida, padrão ou completa | não lida |
| Deriva de termos e decisões | `glossary`, `decide-adr` | `genkovich/sdd` | Termo canônico com "NÃO é"; registro posterior de decisão tomada em chat | não lida |
| Falso "pronto" | `verification-before-completion` | `obra/superpowers` (MIT, 316k★) | Nada fecha sem evidência | lida em 11/11/2026 (ver abaixo) |
| "Onde paramos" | `planning-with-files`; `handoff` | `OthmanAdi/planning-with-files` (MIT, 28k★); `mattpocock/skills` | `task_plan.md`, `findings.md` e `progress.md` em disco, com recuperação de sessão; handoff para outro agente retomar | não lida |
| Antecipar falha | `pre-mortem` | `avelikiy/great_cto` (MIT, 115★); `akillness/jeo-skills` (MIT, 54★) | Imagina o projeto já falhado e trabalha de trás para frente; tigre, tigre de papel e elefante | não lida |

## Ordem sugerida de leitura

1. `process-map-validation-and-signoff` e `business-process` (AI-Unified-Process): cobrem a entrada, onde nasceu o retrabalho da Metax.
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

Pendente de leitura: os scripts `check_bpmn.py` e `check_visual_standard.py` e as skills de elicitação do `agent-personas`.

## Lição que vira regra

`retro` em `mattpocock/skills` (MIT, 321k★), não lida. A `claude-lessons-learned` (14★) saiu pelo critério mínimo.

## Lacuna sem candidata confiável: mapear processo a partir de transcrição

`gersoncorreias/claude-bpmn` (0★) e `andrewluxem/standard-operating-procedures` (0★) saíram pelo critério mínimo. Podem servir só como referência de ideia, sem rodar nem copiar. A trilha segura é escrever esse trecho na própria Lighthouse. A `business-process` do `AI-Unified-Process/marketplace` (Apache-2.0, 163★) ainda precisa ser avaliada.

## Excluídas por licença

`BMAD-METHOD` e `borghei/Claude-Skills` (NOASSERTION); `anthropics/skills` e `opscale-co/skills` (sem licença no repositório).

## Limite da pesquisa

O acesso a repositório externo estava bloqueado na sessão, então só foi possível usar a busca. A leitura do conteúdo fica para a próxima etapa.
