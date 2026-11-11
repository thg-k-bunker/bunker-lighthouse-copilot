# Skills públicas candidatas para a Lighthouse

Levantamento de 11/11/2026 no GitHub (busca de repositórios e de código). **Nenhuma skill foi lida por inteiro.** Os dados vêm só dos metadados do repositório e de trechos da descrição. Estrelas e licença são do repositório, não da skill. Antes de adotar qualquer uma, ler o `SKILL.md` e conferir a licença.

Filtro aplicado: ficou de fora o que a Bunker já validou (perguntar uma por vez, WSJF, anatomia de issue e triagem, fechar turno, relatório ao cliente) e os frameworks de spec-driven development (`spec-kit`, `OpenSpec`, `GSD`), que repetem as duas fases. Pelo princípio "não copia regra de ninguém", o uso é referenciar a ideia, não copiar o texto.

## Candidatas por lacuna

| Lacuna | Skill | Repositório (licença, estrelas) | Ideia a aproveitar | Leitura |
|---|---|---|---|---|
| Mapear processo a partir de transcrição | claude-bpmn | `gersoncorreias/claude-bpmn` (MIT, 0★) | Transcrição de reunião vira BPMN com evidência por passo, contradição sinalizada e pergunta em aberto | não lida |
| Provar o mapa antes de assinar | `process-map-validation-and-signoff` | `Sahil-SS9/agent-personas` (MIT, 69★) | Cada elemento rastreado até a evidência, caminhos percorridos com quem executa, versões e aprovações | não lida |
| Padronizar o processo em SOP | `standard-operating-procedures` | `andrewluxem/standard-operating-procedures` (MIT, 0★) | Modos rascunho e auditoria: gatilho, dono, controle e exceção de cada passo | não lida |
| A sentença em si | `to-spec` | `mattpocock/skills` (MIT, 321k★) | Sintetiza a conversa em spec sem entrevistar. É o catch | não lida |
| Decisão que mora com outra pessoa | `to-questionnaire` | `mattpocock/skills` | Questionário assíncrono para o cliente responder | não lida |
| Trabalho maior que uma sessão | `wayfinder` | `mattpocock/skills` | Mapa de tickets de decisão, resolvidos um por vez | não lida |
| Manter a skill enxuta | `classify-size` | `genkovich/sdd` (MIT, 203★) | Tamanho XS–XL define rota rápida, padrão ou completa | não lida |
| Deriva de termos e decisões | `glossary`, `decide-adr` | `genkovich/sdd` | Termo canônico com "NÃO é"; registro posterior de decisão tomada em chat | não lida |
| Falso "pronto" | `verification-before-completion` | `obra/superpowers` (MIT, 316k★) | Nada fecha sem evidência | não lida |
| "Onde paramos" | `planning-with-files`; `handoff` | `OthmanAdi/planning-with-files` (MIT, 28k★); `mattpocock/skills` | `task_plan.md`, `findings.md` e `progress.md` em disco, com recuperação de sessão; handoff para outro agente retomar | não lida |
| Antecipar falha | `pre-mortem` | `avelikiy/great_cto` (MIT, 115★); `akillness/jeo-skills` (MIT, 54★) | Imagina o projeto já falhado e trabalha de trás para frente; tigre, tigre de papel e elefante | não lida |
| Lição que vira regra | `retro`; `claude-lessons-learned` | `mattpocock/skills`; `aplaceforallmystuff/claude-lessons-learned` (MIT, 14★) | Retrospectiva que vira mudança de processo | não lida |

## Ordem sugerida de leitura

1. `claude-bpmn` e `process-map-validation-and-signoff`: cobrem a entrada, onde nasceu o retrabalho da Metax.
2. `to-spec` e `to-questionnaire`: reforçam o catch e a decisão que depende de terceiro.
3. `verification-before-completion`: ataca o falso "pronto".

## Excluídas por licença

`BMAD-METHOD` e `borghei/Claude-Skills` (NOASSERTION); `anthropics/skills` e `opscale-co/skills` (sem licença no repositório).

## Limite da pesquisa

O acesso a repositório externo estava bloqueado na sessão, então só foi possível usar a busca. A leitura do conteúdo fica para a próxima etapa.
