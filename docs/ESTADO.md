# Estado: bunker-lighthouse-copilot

Atualizado em 12/11/2026.

**Onde estamos:** a skill está na `main` deste repositório (versão 3, mais a decisão do aceite do cliente). O PR no plugin está pronto como patch em `integracao/`, conferido contra a `main` do plugin; falta só alguém com acesso de escrita abrir.

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
1. ~~Aceite do cliente~~: decidido em 12/11/2026. O escopo vai ao cliente na emissão da sentença, e o aceite não bloqueia a execução.
2. ~~Merge na `main`~~: feito em 12/11/2026.
3. **Abrir o PR no `bunker-claude-skills`**, com o patch e os comandos de `integracao/PR-plugin.md`. A sessão do Claude só tem leitura no plugin.
4. ~~Achado das descriptions acima do limite~~: já corrigido na `main` do plugin.
5. **Correções nas skills donas, para o Guilherme:**
   - a wsjf refaz as notas a cada rodada;
   - a esteira de defeito foi aplicada a trabalho de projeto;
   - a repo-pulse não separa a espera do cliente (`docs/decisoes.md`).

**Não refazer:** os testes v2 já rodaram. A v3 só esclarece regras e não mudou a `description`, então os evals continuam valendo.
