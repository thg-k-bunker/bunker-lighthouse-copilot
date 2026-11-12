# Estado: bunker-lighthouse-copilot

Atualizado em 12/11/2026.

**Onde estamos:** a versão 3 da skill está na branch `feat/rascunho-skill`, testada e esperando a sua revisão. Nada foi para a `main` nem para o plugin.

**O que foi feito enquanto você estava fora**
- Rascunho da skill (`skills/bunker-lighthouse-copilot/`) com 504 linhas, contando o `SKILL.md` e os quatro `references/`.
- Revisão independente: 3 bloqueadores e 9 pontos importantes, todos corrigidos.
- Evals de roteamento (`evals/rota-lighthouse/`): 6 de 6, na versão 1 e na 2.
- Testes de comportamento (`testes/comportamento/`), duas rodadas cada:
  - Clínica: 10 de 10 nas duas rodadas, com a fila caindo de 9 perguntas para 6.
  - Metax: na v2, 8 itens inteiros, 3 em parte e 1 de fora, com a fila caindo de 12 perguntas para 10.
- Pacote do PR para o plugin (`integracao/PR-plugin.md`), com a checagem oficial aprovada numa cópia local.
- Conferências: zero achados no detector da `bunker-copy-copilot`, nenhum termo da Metax na skill, nenhum termo proibido da marca.

**Esperando você**
1. **Aceite do cliente.** No caso Metax, a skill não pede o aceite formal do cliente antes de construir, por causa da decisão "Quem decide". A sentença deve pedir esse aceite quando o trabalho é para cliente?
2. **Revisão do `SKILL.md` v3** e ok para o merge da branch na `main`.
3. **PR no `bunker-claude-skills`:** ok para abrir. Também decidir em que seção do README a skill entra; a proposta é "Começar o dia, e saber o que fazer agora".
4. **Achado fora do escopo, para o Guilherme:** três skills do plugin passam do limite da `description` na checagem oficial (`integracao/PR-plugin.md`).
5. **Correções nas skills donas, para o Guilherme:**
   - a wsjf refaz as notas a cada rodada;
   - a esteira de defeito foi aplicada a trabalho de projeto;
   - a repo-pulse não separa a espera do cliente (`docs/decisoes.md`).

**Não refazer:** os testes v2 já rodaram. A v3 só esclarece regras e não mudou a `description`, então os evals continuam valendo.
