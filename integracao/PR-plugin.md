# PR da Lighthouse no plugin `bunker-claude-skills`

Preparado em 12/11/2026. **Pronto para abrir.** A sessão do Claude tem só leitura no repositório do plugin, então o push e o PR ficam com quem tem acesso de escrita.

## O que está pronto

- `lighthouse-1.117.0.patch`: um commit sobre a `main` do plugin em `c2b94d8` (versão 1.116.0, de 10/11/2026), com 23 arquivos:
  - `skills/bunker-lighthouse-copilot/`: o `SKILL.md` e os quatro `references/`;
  - `evals/rota-lighthouse/`: os 6 evals de roteamento;
  - a linha da skill no README, na seção "Começar o dia, e saber o que fazer agora", logo abaixo da `bunker-onboarding-copilot`;
  - a `version` em `.claude-plugin/plugin.json` e em `.claude-plugin/marketplace.json`, de 1.116.0 para 1.117.0.
- Conferido numa cópia nova da `main` do plugin:
  - o patch aplica sem conflito;
  - `python3 scripts/check-plugin.py --base origin/main` dá "tudo certo": a skill entrou, a versão subiu e o marketplace está em sincronia;
  - nenhuma menção à Metax nos arquivos que entram.

**Não entra:** `testes/comportamento/`, `docs/` e nada da Metax.

## Como abrir o PR

Num clone do plugin com acesso de escrita, a partir da `main` atualizada:

```bash
git checkout main && git pull
```

```bash
git checkout -b feat/lighthouse
```

```bash
git am /caminho/para/bunker-lighthouse-copilot/integracao/lighthouse-1.117.0.patch
```

```bash
python3 scripts/check-plugin.py --base origin/main
```

```bash
git push -u origin feat/lighthouse
```

Se a `main` do plugin tiver subido de versão depois de 12/11, o `git am` vai conflitar nos dois arquivos de `.claude-plugin/`: ajuste para a versão seguinte à da `main` e rode o `check-plugin.py` de novo.

## Título do PR

feat(lighthouse-copilot) 1.117.0: padrão para começar e conduzir trabalho novo que quem executa ainda não domina

## Texto do PR

```markdown
## O que é

Skill nova, `bunker-lighthouse-copilot`: o padrão da Bunker para começar e conduzir um trabalho novo que quem executa ainda não domina, a partir da transcrição ou do briefing desse trabalho.

Duas fases, na lógica do processo judicial:

- **Conhecimento:** devolve o entendimento em 3 ou 4 linhas, pergunta só o que muda escopo, custo ou risco (uma por vez, com recomendação), roda a checagem de cobertura em três camadas e emite a sentença, o escopo único do trabalho, com resultado, critério de pronto e tolerâncias.
- **Execução:** segue o caminho crítico, resolve cedo a maior incerteza, usa o WSJF de desempate, confronta toda conversa nova com a sentença e guarda sentença, estado e histórico junto do projeto.

Usa sem copiar: o formato de pergunta do passo 0 da `bunker-fix-bug-copilot`, a régua da `bunker-wsjf-copilot` e o fecho da `bunker-confetes-ou-perguntas-copilot`. Não cria regra de issue.

## Como foi testada

- Evals de roteamento (`evals/rota-lighthouse/`): 6 de 6 com nota máxima. Carrega para transcrição ou briefing de projeto novo; não carrega para defeito já reportado, "o que eu faço agora" e dúvida sobre a casa.
- Testes de comportamento com gabarito, em dois casos (um inventado e um real), duas rodadas cada, por agentes que não viram o gabarito.
- Revisão independente do texto contra as decisões de desenho.
- `check-plugin.py --base origin/main`: tudo certo.

## Checagens

- [x] `name` igual ao nome da pasta; `description` com 990 caracteres
- [x] skill no catálogo do README
- [x] `version` 1.116.0 → 1.117.0 no `plugin.json` e no `marketplace.json`
```
