# Resultado dos evals de roteamento

Rodados em 12/11/2026 com `claude plugin eval`, numa cópia do plugin `bunker` 1.116.0 com a `bunker-lighthouse-copilot` acrescentada. Dois braços por caso: com o plugin e sem ele.

| Caso | Esperado | Com o plugin | Sem o plugin |
|---|---|---|---|
| `transcricao-projeto-novo` | carrega a Lighthouse | 1,00 | 0,00 |
| `nunca-fiz-isso` | carrega a Lighthouse | 1,00 | 0,00 |
| `monta-escopo` | carrega a Lighthouse | 1,00 | 0,00 |
| `defeito-reportado` | não carrega; carrega a fix-bug | 1,00 | 0,50 |
| `o-que-faco-agora` | não carrega; carrega a consultant | 1,00 | 0,50 |
| `pergunta-da-casa` | não carrega; carrega o onboarding | 1,00 | 0,50 |

6 de 6 com nota máxima. Custo da rodada: US$ 0,87.

**Versão 2** (description nova, mais estreita), rodada no mesmo dia: de novo 6 de 6 com nota máxima, com as mesmas diferenças em relação ao braço sem o plugin. Custo: US$ 0,94.

Limite: os evals deste formato só testam qual skill carrega. O comportamento da skill está em `testes/comportamento/`.

No PR para o plugin, esta pasta entra em `evals/rota-lighthouse/` sem este arquivo.
