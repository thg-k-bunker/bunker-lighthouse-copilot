# Estado: bunker-lighthouse-copilot

Atualizado em 12/11/2026.

**Onde estamos:** a skill está pronta e testada na `main` deste repositório, que também é um plugin pessoal do Claude Code (`lighthouse` 0.1.0, só da conta do Thiago). Agora é a fase de uso: instalar no PC do Thiago, usar num trabalho real e ajustar.

**Próximo passo:** terminar a instalação no PC do Thiago (Windows, PowerShell).
- O `gh` já está logado como `thg-k-bunker`, com acesso a repositório.
- Falta o Claude Code de terminal. O comando `irm https://claude.ai/install.ps1 | iex` roda sem mostrar nada, e isso é normal. Depois dele: abrir um PowerShell novo e rodar `claude --version`. Se não for reconhecido, conferir `Test-Path "$env:USERPROFILE\.local\bin\claude.exe"`: com `True`, falta pôr essa pasta no PATH do usuário; com `False`, instalar com `winget install Anthropic.ClaudeCode`.
- Com o `claude` funcionando: `claude plugin marketplace add thg-k-bunker/bunker-lighthouse-copilot` e `claude plugin install lighthouse@lighthouse`. Pelo app, a alternativa é `/plugin install lighthouse --marketplace thg-k-bunker/bunker-lighthouse-copilot` numa sessão de código.

**Depois da instalação**
1. Usar a skill num trabalho real e anotar o que precisar ajustar.
2. A cada mudança, subir a `version` em `.claude-plugin/plugin.json` e em `.claude-plugin/marketplace.json`; o Thiago atualiza com `claude plugin update lighthouse`.
3. Quando quiser compartilhar com a Bunker: o PR está pronto em `integracao/` (patch e guia). Ao entrar no plugin da Bunker, desinstalar o pessoal.

**Para conversar com o Guilherme, sem pressa:** a wsjf refaz as notas a cada rodada; a esteira de defeito foi aplicada a trabalho de projeto; a repo-pulse não separa a espera do cliente (`docs/decisoes.md`).

**Onde está cada coisa**
- A skill: `skills/bunker-lighthouse-copilot/`.
- As decisões, todas fechadas: `docs/decisoes.md`.
- Os testes: `evals/rota-lighthouse/` (roteamento, 6 de 6) e `testes/comportamento/` (dois casos, duas rodadas).

**Não refazer:** pesquisa, decisões de desenho, testes v1 e v2, merge na `main`, patch do PR e plugin pessoal. Está tudo feito e no repositório.
