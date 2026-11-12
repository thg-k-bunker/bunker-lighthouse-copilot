# O que já existe nas skills da Bunker

Leitura feita em 11/11/2026, sobre o plugin `bunker` versão 1.116.0: README do plugin e as skills `bunker-wsjf-copilot`, `bunker-fix-bug-copilot`, `bunker-consultant-copilot`, `bunker-repo-pulse-copilot` e `bunker-confetes-ou-perguntas-copilot`.

## Por que nenhuma delas cobre a Lighthouse

| Skill | O que ela cobre | Por que não serve |
|---|---|---|
| `bunker-fix-bug-copilot` | o rito de consertar defeito | parte de um defeito que já existe, não de um projeto novo; com 986 linhas, encaixar escopo de projeto nela misturaria dois propósitos |
| `bunker-consultant-copilot` | o que fazer agora, entre projetos | escolhe a próxima ação, não fecha escopo |
| `bunker-playbook-de-adocao-copilot` | o documento vivo de adoção | específica para Go Live de CRM |

## O que a Lighthouse reaproveita

- **Perguntas** (fix-bug, passo 0): em `AskUserQuestion`, em linguagem de negócio, um assunto por pergunta, até quatro opções, a recomendada primeiro. Com pressa, até quatro perguntas de assuntos diferentes numa chamada.
- **WSJF** (wsjf): WSJF = (valor + urgência + risco) ÷ tamanho, notas 1, 2, 3, 5, 8 e 13, prioridade de P0 (8 ou mais) a P3 (abaixo de 3). A IA dá as notas e o código faz a conta.
- **Issues** (fix-bug, anatomia da issue): procurar issue parecida antes de abrir, inclusive nas abertas por outras sessões nas últimas 24 horas; issue guarda-chuva que lista as filhas; rótulos `bloq-decisao` e `bloq-ambiente`; marco com o nome que o cliente usa.
- **Fecho do turno** (confetes-ou-perguntas): confete quando a entrega fechou, caixinha quando falta uma decisão do operador.
- **Princípio da consultant:** "não copia regra de ninguém". Regra copiada vira duas verdades que divergem no primeiro ajuste.

## Conflitos e lacunas encontrados

1. **Refazer nota de WSJF.** A wsjf-copilot recalcula todas as notas a cada rodada, inclusive as dadas à mão (decisão de 08/10/2026). A fix-bug diz que nota humana existente nunca é refeita, e a própria wsjf registra essa divergência. A Lighthouse fechou "nota dada uma vez, só refeita com fato novo".
2. **Esteira de defeito aplicada a projeto.** A anatomia da fix-bug parte de "uma issue é um sintoma reportado". Não há regra para issue de trabalho de projeto, e foi aí que a fila da Metax inchou.
3. **Relatório ao cliente.** A repo-pulse não trata issue bloqueada à parte. A issue que espera o ok do cliente aparece no relatório como trabalho que não anda.

## Números do GitHub da Metax

Medidos pela aba "Boas práticas + case Metax" sobre 41 issues, 5 PRs, 247 comentários e 876 eventos (28/09 a 10/10/2026). A leitura dos comentários terminou: a análise completa está em [`metax-github.md`](metax-github.md), e os scripts em [`scripts-metax-github/`](scripts-metax-github/). Pela decisão de 11/11/2026, o processo no GitHub segue o padrão da Bunker; estes números ficam como referência.

| Medida | Resultado |
|---|---|
| Trocas de rótulo em duas semanas | 699, das quais 56% eram só a nota WSJF sendo refeita (até 25 vezes na mesma issue) |
| Da correção provada ao fechamento | mediana de 162 h, cerca de 7 dias |
| Do "no ar" ao fechamento | mediana de 69 h |
| Fechamentos em 09/10 | 18 das 46, num dia só |
| Bloqueios reais (`bloq-ambiente`, `bloq-decisao`) | cerca de 280 h no total |
