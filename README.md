# bunker-lighthouse-copilot

Repositório de trabalho da skill **Lighthouse** (apelido nas conversas: Farol): o padrão de processo da Bunker para executar, com produtividade, trabalhos e projetos.

**Status:** versão 2 do rascunho na branch `feat/rascunho-skill`, testada e esperando a revisão do Thiago. Nada foi enviado ao plugin.

## O que a skill vai fazer

Toda tarefa nova passa por duas fases, na lógica do processo judicial:

1. **Conhecimento (clarear).** A partir da transcrição ou da explicação colada pelo usuário, o Claude devolve o entendimento do serviço e do problema, pergunta só o que falta (uma pergunta por vez, com recomendação), faz a checagem de cobertura e emite a **sentença**. A emissão da sentença fecha a fase, com um aviso de que ela foi superada.
2. **Execução (fazer).** A ordem segue o caminho crítico, depois a maior incerteza, e o WSJF desempata. Transcrição nova é confrontada com a sentença e não a substitui.

O desenho completo e o que ainda está em aberto ficam em [`docs/decisoes.md`](docs/decisoes.md).

## Instalar para uso pessoal

Este repositório é também um plugin do Claude Code, só da sua conta, para usar a skill antes de ela ir para o plugin da Bunker. No Claude Code, num passo:

```
/plugin install lighthouse --marketplace thg-k-bunker/bunker-lighthouse-copilot
```

Ou pelo terminal, em dois:

```bash
claude plugin marketplace add thg-k-bunker/bunker-lighthouse-copilot
```

```bash
claude plugin install lighthouse@lighthouse
```

O repositório é privado: a máquina precisa ter acesso a ele pelo `gh` autenticado, como no plugin da Bunker. Para receber uma versão nova, subir a `version` em `.claude-plugin/plugin.json` e em `.claude-plugin/marketplace.json` e rodar `claude plugin update lighthouse`. Quando a skill entrar no plugin da Bunker, desinstalar este com `claude plugin uninstall lighthouse`, para não haver duas cópias.

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
