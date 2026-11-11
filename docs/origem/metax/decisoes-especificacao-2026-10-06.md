# Decisões para fechar a especificação (#30) e a #35

**Uso interno do Thiago.** 06/10/2026, noite. Cada decisão traz a medição (produção, só leitura), um caso simulado, a recomendação e o texto pronto para a especificação. **Aprovou, eu aplico.**

---

## 1. O filtro do e-mail do consultor (#35)

**A pergunta:** que e-mail enviado ao contato conta como conversa do consultor?

**Medição de hoje, nos 117 contatos com oportunidade aberta** (e-mails enviados depois da oportunidade usada, últimos 97 dias):

| Opção | O que conta | Contatos com conversa por e-mail |
|---|---|---|
| **A. Como está** | e-mail criado por usuário Standard (os consultores) | **46** |
| B. A + captura do Einstein | também os registrados pelo processo automático do Einstein ("captura apenas de cabeçalho") | **46** (+0) |
| C. Qualquer e-mail enviado | também automações | **46** (+0) |

- As 53 capturas do Einstein pelo processo automático (30 dias) caem quase todas em contatos **fora** da jornada, ou antes da oportunidade. Só 1 contato da jornada tem uma, e ele também tem e-mail do consultor.
- **Fatura e medição:** nenhum contato da jornada tem como única "conversa" uma fatura ou medição.
- **Rascunho:** nenhum (os 480 e-mails estão como "Enviado"). **Lembrete de WhatsApp "a fazer":** nenhum (as 33 tarefas estão concluídas).

**Caso simulado:** a Marina, oportunidade em 29/09; o consultor escreve a ela em 01/10 pelo Outlook.
- Hoje, com o EWS ainda funcionando, o e-mail é registrado como enviado pelo consultor (Standard): conta em **A, B e C**. O próximo e-mail da jornada sai em 08/10.
- Se, com o fim do EWS, o registro passar a vir só pela captura do Einstein (processo automático): conta em **B e C**, **não em A**. Ela receberia o e-mail do dia 7 em 06/10, no meio da conversa.

**Recomendação: A, como está, e subir a #35 já** (da branch `feat/i35-sobre-i38`, 55 de 55 na metax-dev). Hoje não há diferença, e a A não precisa de mais código nem de novo par de testes. **Com uma vigia:** na conferência da manhã, contar os e-mails capturados pelo processo automático em contatos da jornada. Se aparecerem (fim do EWS, assunto da reunião de sexta com o Guilherme), passar para a B. É uma mudança pequena, com teste.

---

## 2. Item 4 da especificação: o que conta como conversa, e o WhatsApp pelo nome

**A tensão:** o Guilherme disse que o WhatsApp está "completamente fora de escopo". Mas a regra só funciona se o consultor registrar a conversa pelo botão "Enviar mensagem WhatsApp", e quem precisa saber disso é a Metax.

**Caso simulado:** o consultor Pedro conversa com a Marina pelo WhatsApp do celular e não registra. A especificação diz só "conversa registrada no Sales Cloud", sem dizer como. A Metax não orienta os consultores, e a Marina recebe o e-mail do dia 7 no meio da conversa. Na reunião depois, a Metax diz que "a jornada não respeita a conversa".

**Recomendação:** citar o botão **como o jeito de registrar**, e deixar claro, na seção 4 (fora do escopo), que não existe integração com o WhatsApp. Isso já está no rascunho 8. Assim, o escopo fica protegido (a Bunker não lê nem envia WhatsApp) e a regra fica operável.

**Texto pronto para o item 4** (com a recomendação 1, a #35 em produção):

> | 4 | **Conversa do consultor reinicia a contagem** | Quando o consultor conversa com o contato e essa conversa fica **registrada no Sales Cloud**, a contagem recomeça a partir dela: o contato volta a ficar quente, e o próximo e-mail da jornada só sai 7 dias depois. Contam: a mensagem de WhatsApp registrada pelo botão "Enviar mensagem WhatsApp" (no contato ou na oportunidade) e o e-mail que o consultor envia ao contato pelo e-mail integrado ao Sales Cloud. Conversa nos 7 dias antes da oportunidade só pula o primeiro e-mail. Enquanto o consultor conversa, a jornada fica em silêncio. Conta só o que está registrado, e por pessoa: a conversa com o comprador não segura os e-mails do engenheiro da mesma negociação. |

*(Se a #35 não subir antes do envio da especificação, o texto fica só com "a mensagem de WhatsApp registrada pelo botão 'Enviar mensagem WhatsApp' no contato", e sem a frase dos 7 dias antes.)*

---

## 3. Item 7 da especificação: o papel de cada e-mail

**A base:** o seu e-mail do dia 7, já montado ("Vamos retomar?", uma pergunta só, o consultor a um clique), e o padrão que você definiu: curto, uma pergunta só, sem cortesia vazia, "o seu consultor", a proposta e a obra no lugar de "nossas soluções".

**Caso simulado:** a Marina, sem conversa registrada depois da oportunidade (29/09), recebe a sequência inteira. Cada e-mail tem um motivo diferente para ela responder, e nenhum repete o anterior:

| Dia | Faixa | Papel | Pergunta única |
|---|---|---|---|
| 1 | quente | agradece e apresenta o consultor como o ponto de contato | — (sem pergunta: é o primeiro contato) |
| 7 | quente | retoma a proposta ✅ montado | Ficou alguma dúvida sobre a proposta? |
| 14 | quente | um caso real de obra (depoimento da CPN) | Quer ver como seria na sua obra? |
| 21 | morna | o diferencial: "a Metax não é uma locadora de equipamento" (engenharia, gestão e proximidade) | — |
| 28 | morna | a obra mudou? oferece rever a solução | O cronograma ou a necessidade mudou? |
| 45 | fria | o projeto continua? | O projeto continua de pé? |
| 90 | despedida | encerra com a porta aberta ("43 anos construindo soluções…") | — |

**Recomendação:** aprovar essa tabela. Na especificação, ela entra como uma linha por e-mail, sem o texto em si: o texto é apresentado depois do de acordo.

**Texto pronto para o item 7** (substitui a frase "[DECIDIR] o papel de cada e-mail, proposta: …"):

> **O papel de cada e-mail:** dia 1, agradece e apresenta o consultor como o ponto de contato; dia 7, retoma a proposta e abre espaço para as dúvidas; dia 14, um caso real de obra; dia 21, o que diferencia a Metax de uma locadora de equipamento; dia 28, pergunta se a obra mudou e oferece rever a solução; dia 45, pergunta se o projeto continua; dia 90, a despedida, com a porta aberta. Cada e-mail é curto e traz uma única pergunta ou chamada, que leva ao consultor.

---

## Em resumo, para aprovar

1. **#35:** subir como está (opção A), da `feat/i35-sobre-i38`, com a vigia das capturas do Einstein na conferência.
2. **Item 4:** citar o botão de WhatsApp como o jeito de registrar; integração com WhatsApp fora do escopo (texto acima).
3. **Item 7:** a tabela dos 7 papéis (texto acima).

Com os três aprovados, a especificação sai do rascunho 8 sem nenhum [DECIDIR], pronta para a sua revisão final e o envio.
