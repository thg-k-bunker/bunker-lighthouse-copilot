# Modelos

Os três arquivos moram em `docs/lighthouse/`, no repositório do projeto, e são commitados. Datas em DD/MM/AAAA. Nada de credencial, token ou senha em nenhum deles.

## SENTENCA.md

```markdown
# Sentença: <nome do trabalho>

Emitida em DD/MM/AAAA. Quem conduz: <nome>.

## Resultado
<o que muda, para quem e até quando, em uma ou duas frases verificáveis>

## Critério de pronto
| Item | Como se prova | Essencial ou desejável |
|---|---|---|
| <item> | quando <isto acontecer>, então <aquilo>; se <falhar>, então <...> | essencial |

## Tolerâncias
| Aspecto | Mínimo | Provável | Máximo |
|---|---|---|---|
| Prazo | | | |
| Esforço (horas nossas) | | | |
| Escopo | <o que pode sair sem afetar o resultado> | | <o que pode entrar> |

Espera estimada pelo cliente, à parte do esforço: <faixa>.

## Fora de escopo
- <item>: <por quê>, decidido em DD/MM por <quem>.

## Premissas
| Premissa | Fonte e confiança | O que a invalida | Confirmar até |
|---|---|---|---|

## Decisões
| Data | Pergunta | Escolha | Alternativa descartada |
|---|---|---|---|

## Quem pode travar
<só quem a transcrição cita ou quem conduz informou; se ninguém, "ninguém citado">

## Riscos
<do pre-mortem, quando houve: risco e o que se faz para evitar>

## Maior incerteza
<qual é, e o passo que a resolve primeiro>

## Plano
Muda sem aditamento, desde que fique dentro das tolerâncias.

| # | Passo | Pacote | Depende de | Pronto quando | Esforço (h) | WSJF |
|---|---|---|---|---|---|---|

Só o próximo pacote vem detalhado em passos. Os seguintes ficam numa linha cada e são detalhados quando chega a vez deles. O fim de cada pacote é um marco.

## Aditamentos
Só para mudar resultado, critério de pronto ou tolerância.

| Data | O que mudou | Por quê | Decidido por |
|---|---|---|---|
```

## ESTADO.md

Nasce na confirmação do entendimento. Cabe numa tela. Reescrito inteiro a cada turno, nunca acumulado.

```markdown
# Estado: <nome do trabalho>

Fase: <conhecimento | execução>. Atualizado em DD/MM/AAAA, HHhMM.

**Onde estamos:** <uma frase>
**Próximo passo:** <o passo e por que ele vem agora>
**Falta:** <passos abertos, em uma linha cada>

**Esperando o cliente**
| O quê | De quem | Desde |
|---|---|---|

**Esperando quem conduz:** <decisão ou ok pendente, se houver>
**Não refazer:** <o que já está feito e pode parecer pendente, com a evidência>
```

Na fase de conhecimento, o estado traz também:

```markdown
**Perguntas abertas:** <as próximas da fila, em ordem>
**Premissas a confirmar no catch:** <lista curta>
**Em verificação pelo Claude:** <o que falta conferir>
```

## Histórico

Arquivo `HISTORICO.md`. Só acumula, do mais novo para o mais antigo.

```markdown
## DD/MM/AAAA
- **Feito:** <passo> · evidência: <link, id ou print>
- **Decidido:** <decisão> · por <quem>
- **Perguntado:** <pergunta> · resposta: <escolha> · <antes ou depois da sentença>
- **Conversa nova:** <fonte> · confirmou / acrescentou / contradisse <o quê>
- **Incidente:** <pequeno, médio ou grande> · <o que houve e o que se fez>
- **Reaberto:** <passo> · <por quê>
```

No encerramento, o histórico ganha uma seção final:

```markdown
## Encerramento DD/MM/AAAA
**O que deveria acontecer:** <...>
**O que aconteceu:** <...>
**Por que houve diferença:** <...>
**O que manter e o que mudar:** <...>

Perguntas depois da sentença: <n> · aditamentos: <n> · passos reabertos: <n>
Lições propostas para a skill: <lista, ou "nenhuma">
```

## Prompt da próxima sessão

Gerado no fim de cada turno. Traz os caminhos dos arquivos, sem copiar o que está neles.

```text
Continuar <nome do trabalho> com a bunker-lighthouse-copilot, na fase de <conhecimento | execução>.
Leia primeiro docs/lighthouse/ESTADO.md e, se já existir, docs/lighthouse/SENTENCA.md, em <repositório ou pasta>, branch <branch>. O histórico só se lê se o estado mandar.
Próximo passo: <o mesmo do ESTADO.md>.
Portas de aprovação: <o que espera o ok de quem conduz>.
```
