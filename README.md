# bunker-lighthouse-copilot

Repositório de trabalho da skill **Lighthouse** (apelido nas conversas: Farol): o padrão de processo da Bunker para executar, com produtividade, trabalhos e projetos que ainda não dominamos.

**Status:** versão 2 do rascunho na branch `feat/rascunho-skill`, testada e esperando a revisão do Thiago. Nada foi enviado ao plugin.

## O que a skill vai fazer

Toda tarefa nova passa por duas fases, na lógica do processo judicial:

1. **Conhecimento (clarear).** A partir da transcrição ou da explicação colada pelo usuário, o Claude devolve o entendimento do serviço e do problema, pergunta só o que falta (uma pergunta por vez, com recomendação), faz a checagem de cobertura e emite a **sentença**. A emissão da sentença fecha a fase, com um aviso de que ela foi superada.
2. **Execução (fazer).** A ordem segue o caminho crítico, depois a maior incerteza, e o WSJF desempata. Transcrição nova é confrontada com a sentença e não a substitui.

O desenho completo e o que ainda está em aberto ficam em [`docs/decisoes.md`](docs/decisoes.md).

## Onde a skill vai morar

Toda skill da Bunker vive no plugin `bunker-claude-skills`, que é por onde ela chega a quem instalou. Este repositório guarda a pesquisa, as decisões e os rascunhos. A versão final entra no plugin por PR, em `skills/bunker-lighthouse-copilot/`, seguindo o padrão `bunker-<dominio>-copilot` e as checagens do README do plugin.

## Estrutura

```
skills/
  bunker-lighthouse-copilot/   a skill: SKILL.md e references/
evals/
  rota-lighthouse/             evals de roteamento, no formato do plugin
testes/
  comportamento/               casos com entrada, gabarito e resultado
integracao/
  PR-plugin.md                 o pacote do PR para o bunker-claude-skills
docs/
  decisoes.md     o que está fechado e o que está em aberto
  origem/         o pedido original (transcrição dos áudios)
    metax/        arquivos de trabalho do projeto Metax: o "onde paramos", os prompts de sessão e as decisões
  pesquisa/       padrão de levantamento, boas práticas de execução e evidências
  analise/        o que já existe nas skills da Bunker e onde há conflito
```
