# Pacote do PR para o plugin `bunker-claude-skills`

Preparado em 12/11/2026. **Nada foi enviado ao repositório do plugin:** o PR espera o ok do Thiago.

## O que entra

| Origem neste repositório | Destino no plugin |
|---|---|
| `skills/bunker-lighthouse-copilot/` (SKILL.md e references/) | `skills/bunker-lighthouse-copilot/` |
| `evals/rota-lighthouse/` (sem o `RESULTADO.md`) | `evals/rota-lighthouse/` |
| `testes/comportamento/generico-clinica/` | opcional, como referência de teste manual |

**Não entra:** `testes/comportamento/metax-jornada/`, `docs/` e qualquer coisa da Metax.

## Mudanças em arquivos do plugin

1. **README, seção "Começar o dia, e saber o que fazer agora"**, logo abaixo da linha da `bunker-onboarding-copilot`:

```markdown
| `bunker-lighthouse-copilot` | Começar e conduzir um trabalho novo que você ainda não domina, a partir de uma transcrição colada. Na fase de conhecimento: entendimento confirmado, uma pergunta por vez, checagem de cobertura e a sentença, o escopo único do trabalho. Na de execução: caminho crítico, depois a maior incerteza, WSJF de desempate, e sentença, estado e histórico no repositório do projeto. |
```

2. **Versão:** subir a `version` em `.claude-plugin/plugin.json` e em `.claude-plugin/marketplace.json` (as duas precisam bater). Na cópia testada, de 1.116.0 para 1.117.0; no PR, a próxima versão a partir da `main` do dia.

3. **Descrição do plugin** (`plugin.json` e `marketplace.json`), opcional: acrescentar à lista "início de trabalho novo com escopo fechado".

## Rito do PR (README do plugin)

```bash
git checkout -b feat/lighthouse
```

```bash
python3 scripts/check-plugin.py --base origin/main
```

Commit conventional em pt-BR, PR para a `main`.

## O que já foi conferido numa cópia local do plugin 1.116.0

- `check-plugin.py`: a Lighthouse passa (description com 982 caracteres pela conta do script) e o README fica com as 33 skills no catálogo.
- A trava de versão (`--base`) não rodou, porque a cópia local não tem histórico git. Roda no PR.
- Os evals de roteamento passaram 6 de 6 (`evals/rota-lighthouse/RESULTADO.md`).

## Achado fora do escopo

Na mesma checagem, três skills que já existem passam do limite de 1.024 caracteres na `description`, e o script diz que, acima disso, a skill é descartada sem aviso: `bunker-alumni-copilot` (1.030), `bunker-fix-bug-copilot` (1.033) e `bunker-playbook-de-adocao-copilot` (1.042). Na prática, a `bunker-fix-bug-copilot` carregou normalmente no eval `defeito-reportado`, então o script deve estar contando o texto bruto, com aspas e escapes, e a skill não chega a ser descartada. Mesmo assim, a checagem reprova, e o PR da Lighthouse pode acabar barrado por erro alheio. Vale conferir na `main` do plugin antes do PR, porque a cópia instalada aqui pode estar atrás.
