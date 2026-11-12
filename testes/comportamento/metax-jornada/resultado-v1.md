# Resultado v1: jornada Metax (só neste repositório)

Rodado em 12/11/2026 sobre o rascunho `0574b8a`, por um agente que leu só a skill e a entrada, sem pesquisa externa.

## Cobertura contra o gabarito: 7 inteiros, 4 em parte, 1 não levantado

| # | Item | Levantou? | Onde |
|---|---|---|---|
| M1 | Conflito entre a Opção 2 e a arquitetura | Sim | Q1, com a regra de não escolher sozinho |
| M2 | Canais reais dos vendedores (WhatsApp, e-mail) | Sim | O10 e questionário, item 3 |
| M3 | Estado dos dados: repetidos, sem vínculo, sem e-mail | Sim | E7, O13 |
| M4 | Remetente e para onde vai a resposta | Em parte | Q9 trata o remetente; a resposta do lead não aparece |
| M5 | Quantos e-mails, quem escreve e quem aprova | Sim | Q6 |
| M6 | Aceite formal do cliente antes de construir | **Não** | A confirmação é só de quem conduz (decisão "Quem decide") |
| M7 | Incerteza de ferramenta no Journey Builder | Em parte | Maior incerteza no lado do Marketing Cloud e teste curto; o limite de juntar ramos não aparece |
| M8 | Objetivo próprio do cliente (operar e aprender) | Em parte | O5, como premissa de autonomia |
| M9 | Em nome de quem ficam rotina e credencial | Sim | O18 |
| M10 | Prazo em faixa e espera do cliente | Sim | O29, Q8 |
| M11 | Opt-out e LGPD | Sim | O14 |
| M12 | Bonificação sem instrumento formal | Em parte | Q8 (teto de horas) e Q2 |

## Ponto para decisão

O M6 é o único item não levantado, e é consequência da decisão "Quem decide": a skill só pede a confirmação de quem conduz e não pergunta quem assina. Na Metax, a especificação chegou ao rascunho 10 sem o aceite do cliente.

## Problemas da skill apontados pelo teste

Coincidem com os do caso genérico e da revisão independente, e foram corrigidos na v2: estado inexistente na fase 1, confirmação sem formato, "pressa declarada" sem definição, eixos do perfil confusos, status intermediários faltando, fonte de memória sem marca, conflito entre "não pergunta quem decide" e itens que perguntavam isso.
