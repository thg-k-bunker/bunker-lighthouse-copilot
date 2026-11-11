> Análise das 46 issues e PRs, 247 comentários e 876 eventos do metax-salesforce (11/11/2026). **Só referência:** pela decisão do Thiago de 11/11/2026, o processo no GitHub segue o padrão da Bunker e fica fora da Lighthouse. A proposta de rito enxuto da seção 7 não vale. O que vale daqui: o rito de correção (vermelho e verde, revisão) pegou defeitos reais, e o trabalho de controle foi quase todo do agente, não da pessoa.

# A organização do GitHub no projeto Metax: ajudou ou atrapalhou?

Base: 40 issues e 6 PRs, 247 comentários (199 mil caracteres) e 876 eventos do repositório metax-salesforce, mais o git log (123 commits). Tudo foi lido. **Fato** é o que está nos dados. O que vem marcado como **inferência** é interpretação minha.

## Veredito curto

A queixa procede em parte. Ela é verdadeira para a **camada de rótulos** (etapas, WSJF, bloq-*) e para alguns **modelos de comentário copiados**. É falsa para o **rito de correção**, aquele que mede a premissa, faz o vermelho e o verde e desfaz a correção para ver o vermelho de novo. Esse rito achou defeitos reais antes da produção. Quase nenhum bloqueio longo foi falso: os que de fato atrasaram vieram da produção, do cliente ou do acesso. O custo do ritual foi outro: muita **contabilidade** e um **estado que mentia**, porque os rótulos andavam atrás do trabalho. Ele não chegou a segurar a produção.

## 1. Anatomia de um comentário típico

Os 244 comentários da conta thg-k-bunker têm voz de agente: "Liberada pelo Thiago", "com o ok do Thiago". A mediana é de 506 caracteres, e 10% passam de 1.665. Estes são os modelos que se repetem:

| Modelo | Comentários | Exemplo |
|---|---|---|
| Passos do rito (premissa, vermelho, ataque ao teste, par, implantado) | 26 | #25, 29/09: "É vermelho pelo motivo certo: não houve erro de compilação nem de montagem." |
| Tabela de ids de execução (0Af…, 707…) | 62 | #26, 29/09: par vermelho, verde e vermelho ao desfazer |
| Decisão ("Decisão · Thiago, data") | 39 | #27, 30/09: "Caminho B: enviar o contato marcado." |
| Rodapé "Falta / Travou em / Espera o ok" | 27 | #17, 30/09: "Espera o ok explícito do Thiago." |
| Linha de etapa ("Etapa: e4-no-ar → e5-reteste") | 33 | #11, 05/10 |
| Prova de tela ("Print N de M") | 10 (29 imagens) | #16, 02/10: 11 prints |
| Reteste ou conferência na produção | 27 | #11, 05/10: "3 cargas automáticas sem erro" |
| Fechamento "Entregue:" | 13 | #28, 09/10 |
| Riscado com "RETIFICADO" | 3 (#20, #30, #31) | #30, 30/09: "Estava errado." |

Quase não há justificativa de WSJF nos comentários (só #24, #31 e #37). O WSJF morava nos rótulos e no README.

**Composição do texto (método).** Dividi cada comentário em blocos (parágrafos e tabelas). Bloco já visto antes (normalizado) virou (b). Bloco que abre com marca de rito (etapa, liberação, fechamento, print, "Entregue") virou (c). Bloco que abre com espera ("Travou", "Falta", "aguarda") virou (d). O resto ficou como (a).

| | Mecânico | Sem a listagem de arquivos da #40 (18 mil caracteres) | Estimativa ajustada (inferência) |
|---|---|---|---|
| (a) informação nova, decisão, evidência | 80% | 78% | 60–65% |
| (b) repetição | 7% | 7% | 15–20% |
| (c) rito e contabilidade | 8% | 9% | 10–12% |
| (d) espera ou bloqueio | 5% | 6% | 5–7% |

O ajuste leva para (b) três coisas que o método mecânico não pega: as paráfrases (os resumos "Entregue", que repetem o comentário de prova; os 15 resumos de rascunho de especificação e guia, que repetem o commit e o doc; os ponteiros "Detalhe na #26"); as decisões revertidas depois (veja a seção 6); e as tabelas de reteste postadas em issues onde o cenário "não foi exercido". Mesmo assim, **a maior parte do texto é trabalho real**: medição na produção, ids de execução, decisões. A redundância se concentra em poucos modelos.

## 2. A mesma informação em vários lugares

**Fato: 26 comentários são cópias exatas ou quase exatas de outros, somando 13,7 mil caracteres.**
- O reteste de 05/10 ("Reteste na produção: 3 cargas automáticas sem erro") foi postado **8 vezes**, todas no mesmo minuto (15h59), em #11, #24, #25, #26, #27, #28, #29 e #32.
- "No ar na produção (02/10/2026)", com o mesmo id de implantação `0AfbL000001ROSHSA4`, aparece em 6 issues.
- "Fechada com o ok do Thiago (05/10/2026)…" aparece 5 vezes. "Liberada da triagem pelo Thiago em 30/09/2026." aparece 4 vezes.
- "No ar na produção (06/10/2026, ~18h20)", com 1.520 caracteres, é idêntico em #37 e #38.
- "Conferido na carga de 07/10" está em #35 (duas vezes, com 1 minuto de diferença), #37 e #38.
- A conferência diária saiu completa na #26 e resumida, com "Detalhe na #26", na #27 e na #28 (06, 07 e 09/10).

**O escopo do Guilherme (sem Synchronized DE, sem Chatter)** foi reescrito em #1 (25/09 e 05/10), #20 (dois comentários), #30 (dois) e #31. Também está no corpo da #1, da #20 e da #30, na especificação, no roteiro de produção e no deck.

**Uma mesma decisão chega a 5 camadas.** Exemplo: a regra do WhatsApp (#34). Ela está no corpo da issue, em 7 comentários, em `contrato-de-dados.md`, no guia (seções 1 a 3), na especificação (rascunho 8), no status de 05/10 ("slide 5") e em 6 commits.

**Status diário.** A decisão foi "O status sai todo dia" (#19, 29/09). O repositório guarda 3 relatórios (30/09, 02/10 e 05/10), com 12 MB em `docs/status-report`, e todos dizem "não enviado: o envio é do Thiago". O status repetia o que o quadro de issues já dizia.

## 3. Bloqueios: reais e de rito

Durações tiradas dos eventos de rótulo e dos comentários.

| Issue | O que travou | Quanto tempo | Real ou rito | Por quê |
|---|---|---|---|---|
| #1, #3, #12, #13, #14 | Acesso ao Marketing Cloud (`bloq-ambiente`) | 25/09 → 28/09 23h; rótulo tirado em 29/09, às 21h55 | **Real**, com rótulo vencido por cerca de 22 h | Sem acesso não havia trabalho. Na #3 o rótulo ficou depois de fechada: "fechada em 28/09 sem a troca de rótulo". |
| #24 | `bloq-decisao`: data da oportunidade e o que fazer com quem fechou | 2,3 h | **Real** | Regra de negócio, resolvida na reunião de 29/09 |
| #26 | `bloq-decisao`: opção a, b ou c para a sandbox | 1,6 h; depois cerca de 21 h até o Thiago apagar 2 linhas pela tela | **Real** | Risco de gravar na base real; o agente não pode apagar dado |
| #37 | `bloq-decisao`: campo novo ou falso sinal | 21 min | **Real** | Escolha de modelo de dado |
| #17 | Ok para a primeira implantação | 30/09, 23h29 → 01/10, 22h04, em UTC (cerca de 22 h) | **Real** | Mudança na produção, com validação sem gravar antes |
| #24, #25, #26, #27, #29 | `e3-aguardando-deploy` | 46 a 69 h (mediana de 46 h) | **Real** | Esperavam a mesma implantação da #17 |
| #35 | `e3`: revisão do Thiago | 26 h | **Real, e rendeu** | A revisão mediu que "53 são capturas do Einstein", que o filtro deixaria de fora |
| #30 | Aceite formal da Metax | 06/10 → 19/10 | **Real (externo)** | Assinatura do cliente |
| #30 | Caso e WO no portal da Bunker | 02/10 → 05/10, 23h ("ainda não foi criado", 2×) | **Burocracia interna** | Não bloqueava a produção, só o faturamento |
| #28 | `bloq-ambiente`: liberar envio de e-mail na KlockDev "para ver o alerta chegar" | 46 h (30/09 → 02/10) | **Rito** | O teste e o log já provavam: "Alerta da Jornada MC não saiu… FINISH_OK". O bloqueio saiu porque a issue foi para a produção, e o alerta real nunca foi visto: "falta só um job com falha para ver o aviso chegar". |
| #11 | Ligar a agenda na sandbox, que era o critério da issue | 69 h em e2 | **Rito** (no começo foi real, pela #26) | "Fica parada até a palavra dele." A agenda nunca foi ligada na sandbox; a issue fechou pela produção. |
| #26, #27, #28 | `e5-reteste` até a "semana de aceite" | cerca de 95 h | **Rito** na maior parte | Nas palavras da própria issue: "cenário não exercido na produção… a produção não tem o que mostrar". Fecharam em e5, sem e6. |
| #16 | Ficou em `e0-triagem` com os testes já feitos | 101 h | **Rito** (rótulo atrasado) | Não segurou nada, mas o quadro mostrava "triagem" |
| #32 | "Evidência de tela pendente" | dispensada 24 min depois | **Rito** | Foi para a produção sem o print, que nunca chegou |
| #7 | Merge do PR #22 "depois da produção" | 51 h | **Ordem de processo, com efeito real** | A mesma regra deixou a produção à frente da `main` de 06 a 09/10 (#39: "O código que está em produção não está na main") |

**Leitura.** Todos os bloqueios longos que de fato atrasaram tinham motivo real. Os bloqueios de rito deixaram rótulos parados de 46 a 101 h cada, mas **não seguraram a produção**: o trabalho seguia, e o rótulo ficava para trás. **Fato:** #5 e #6 "tinham saído da triagem sem a liberação dele". O portão da triagem era nominal.

## 4. Custo do ritual

- **699 eventos de rótulo** para 40 issues: mediana de 13 por issue, média de 17,5 e máximo de 40 (#26 e #35). Para comparar, foram 247 comentários.
- **193 eventos de etapa e 115 entradas de etapa.** O tempo em cada uma conta a história:
  - **e1-medindo, mediana de 0,7 h; e2-provado, mediana de 0,16 h.** O rótulo era posto depois do fato. A #34 passou de e1 a e5 em 63 minutos, e a #35 recebeu e2, e1 e e2 de novo no mesmo minuto.
  - **e3, mediana de 46 h; e4, mediana de 69 h.** São as únicas etapas que mediram espera de verdade: o ok da produção e as 3 cargas.
  - **e5-reteste: 5 issues ficaram 2 minutos** (05/10, das 15h59 às 16h01), entre "Proposta: fechar" e "Fechada com o ok". As outras 7 **fecharam em e5** e nunca chegaram a e6.
- **O estado final dos rótulos não bate com a realidade.** Das 40 issues, só 16 fecharam em e6-validado. Fecharam 7 em e0-triagem, 7 em e5, 3 em e2, 2 em e1 e 2 em e4; 3 não tinham etapa. As duas issues mais trabalhadas, #30 e #31, ficaram em `e1-medindo` do começo ao fim.
- **Saltos e voltas.** Houve saltos de etapa (e0 → e4 na #19, e1 → e3 na #29 e na #38, e1 → e4 na #17), 26 eventos de `in-progress` (6 só na #26) e e1 tirado e posto de novo no mesmo minuto (#28). Não houve volta de etapa por defeito real.
- **WSJF: 393 eventos de rótulo e 86 mudanças de nota em 16 issues.** Destes, **214 eventos foram da conta guimreis entre 08/10, às 23h, e 09/10, às 13h**: a skill de WSJF repontuou "16 de 16 issues abertas" (README). Horas depois, em 09/10 às 15h, 13 delas foram fechadas. A #35, que estava na produção desde 06/10, foi P0 → P1 (23h28) → P0 (00h26). Mais 5 commits "docs(wsjf): fila por WSJF na página inicial" foram feitos para uma fila que estava fechando. **Isso é churn puro.**
- **e3, e4, e5 e e6.** A diferença entre "no ar" (e4) e "validado" (e6) teve valor uma vez: as 3 cargas da semana de aceite, com o confronto DE × Salesforce ("104, o mesmo da DE", 05/10). **O reteste não achou nenhum defeito.** Ele confirmou números. Já o e5 como etapa separada não acrescentou nada: ou durou 2 minutos, ou ficou esperando um cenário que a produção não exerce.

**O que o ritual pegou (valor real, quase todo do rito de correção e da revisão):**
- #25: um tipo de obra de 45 caracteres derrubaria o lote; "na produção, 8 de 74 contatos derrubariam a carga toda".
- #26: a sandbox gravava na DE real. Achado na revisão adversarial do PR #23.
- #29: "os 30 testes antigos passaram com os 6 defeitos no código". Achou também o defeito do fuso e o do token.
- #24: na revisão, o teste "não conferia **quem** era a segunda linha".
- #17: o manifesto sem o `JornadaMC_Config__mdt`, que na produção "não compilaria".
- #35: a medição antes do deploy achou as capturas do Einstein.
- #30, 06/10 (guimreis): "A Metax assinaria uma regra diferente da que roda."
- #39 e #40: reconciliação entre a org e o GitHub.

## 5. Aprovações humanas

- **Fato:** a aprovação está sempre registrada **por terceiros, pelo agente**. Há cerca de 90 menções: "com o ok" (25), "decisão do Thiago" (28), "Liberada… pelo Thiago" (12), "Fechada pelo Thiago / com o ok" (10), "aprovado(a) pelo Thiago" (6). Só um comentário parece escrito pelo próprio Thiago (#24, 30/09: "Revisei os 3 testes. Solicitada alteração, na sequência revisei as 2 novas linhas. Ok."). Não houve nenhuma revisão nativa de PR.
- **As aprovações vêm em lotes.** Dos 40 fechamentos de issue, 34 se concentram em 6 janelas:
  - 29/09, 21h (7 issues);
  - 05/10, 16h (5);
  - 07/10, 15h (2);
  - 09/10, 14h–15h (13);
  - 09/10, 19h (2);
  - 10/10, 02h (5);
  - os outros 6 fechamentos ficaram sozinhos.

  As liberações de triagem de 30/09 saíram todas às 20h27 (#7, #19, #20, #21, #29 e #31).
- **O tempo até a aprovação:**
  - fechamento depois de "Proposta: fechar": 2 minutos;
  - primeira implantação: cerca de 22 h;
  - deploys seguintes: do mesmo dia (#34 em 11 min, #37 e #38 em cerca de 2,5 h);
  - triagem das issues criadas em 28/09: 29 a 55 h (101 h na #16), com o trabalho andando no meio;
  - texto do guia: de 03/10 a 10/10.

  **Inferência:** a aprovação chega quando o Thiago senta com o agente. Por isso o gargalo é a agenda dele, não o GitHub.
- **Há ok granular para coisas triviais:** apagar ou criar linhas TESTE ("com o ok do Thiago", #16, 05/10), merges de doc ("Merge branch … (ok do Thiago)") e trocar o texto alternativo de imagens.

## 6. #30 e #31: o que houve

**#30 (especificação, 20 comentários, 10,6 mil caracteres).** Pela minha marcação: 60% informação nova, 26% retrabalho ou repetição, 9% rito e 4% espera.
- **No primeiro dia, a base estava errada.** O rascunho 1 tomou o e-mail da Opção 2 como escopo e foi riscado 4 minutos depois ("Estava errado").
- **Houve 10 rascunhos em 7 dias.** Os rascunhos 4, 5 e 6 só repetem decisões tomadas na #31 (9 → 6 e-mails, conteúdo da Bunker).
- **A burocracia interna entrou na issue:** "caso ainda não criado" duas vezes; o caso e a WO criados e depois "voltou ao processo normal", em 06/10.
- **O comentário de fechamento era falso.** Em 09/10 a issue foi fechada como "aceita pela Metax", e em 13/10 veio a correção: "o aceite da Metax ainda NÃO foi dado". O aceite real chegou em 15/10 (Raphael) e 19/10 (Virginia).
- **Houve valor genuíno:** o achado de que a resposta ao e-mail cai no noreply, e a revisão de consistência entre a especificação, o guia e o código.

**#31 (conteúdo dos e-mails, 23 comentários, 23,9 mil caracteres).** É quase toda decisão de produto e medição: 92% classificado como (a). O churn vem de **decisões humanas que mudaram**, não do GitHub:
- conteúdo "é da Metax" (30/09) → "A Bunker escreve e monta" (01/10);
- 9 e-mails → 6 (horas depois) → 7 (02/10);
- layout: a opção C foi recomendada e a B escolhida;
- um diagnóstico errado ("lista vazia") foi corrigido 1,5 h depois.

As decisões que caíram somam cerca de 11% do texto. **A issue também abrigou outro trabalho:** o desenho do sinal "respondeu", com 4 comentários e cerca de 17% do texto, que depois virou a #32 e foi reescrito lá como premissa. Fechou em `e1-medindo`.

## 7. Veredito e proposta para o Farol

**Manter (produtivo):**
- O rito de correção, com premissa medida, vermelho, ataque ao próprio teste, verde e vermelho ao desfazer. Foi o maior gerador de valor.
- O ok explícito antes de mudar a produção, com validação sem gravar e plano de reversão.
- A conferência que confronta o dado contra a fonte (DE × Salesforce).
- O registro de decisão com as alternativas descartadas.
- A revisão de consistência entre o doc e o código antes de mandar ao cliente.

**Cortar ou simplificar:**
- Os rótulos de WSJF (bv-, tc-, rr-, SP-), que foram 56% dos eventos de rótulo, e a repontuação em massa.
- As etapas e1, e2 e e5 como rótulos.
- `in-progress`.
- O e0 como portão nominal.
- O comentário copiado para N issues.
- O status diário que repete o quadro.
- Print como condição quando já existe leitura por API.
- Fechar para caber no fim da sprint. A #42 foi "Fechada … antes da reunião", e a #17 fechou com a jornada ainda em rascunho.

### Rito enxuto proposto

**Rótulos (no máximo 7).**
- Prioridade: `P0`, `P1`, `P2`. O WSJF fica como campo no `passos.json`, calculado uma vez na abertura e recalculado só quando o escopo muda, nunca depois de ir ao ar.
- Estado: `aguarda-humano`, `aguarda-externo`, `no-ar`.
- `fora-do-escopo`.

**Etapas (4), cada uma mudada só com evidência no `passos.json`:**
1. **aberta**;
2. **provada**: o par vermelho e verde, ou a medição, anexado;
3. **no ar**: deploy com id, primeira carga conferida e rollback escrito;
4. **aceita**: o critério de aceite, definido na abertura, cumprido, ou o ok do humano.

**Bloqueio por tolerância.** Só ganha rótulo o que para o caminho crítico além da tolerância do marco (por exemplo, mais de 4 h) e que tem dono e um "destrava quando" claro. "Ver o e-mail chegar" e "print" nunca são bloqueio.

**Quando o comentário é obrigatório, e o que ele leva:**
1. **Decisão:** quem decidiu, a escolha, as alternativas descartadas e o porquê, em uma linha.
2. **Prova de etapa:** link da evidência (id, saída literal ou print, quando não houver leitura por máquina) e o resultado em uma linha.
3. **Bloqueio:** tipo, dono e o que destrava; depois, uma linha quando sair.
4. **Fechamento:** critério cumprido, ou o que ficou e para onde foi (ESTADO.md).

Evidência compartilhada (um deploy ou um reteste que serve a N issues) vai **uma vez**, no issue do marco ou no LOG.md. As outras issues levam um link.

**O que vai para o doc e o que vai para a issue:**
- **SENTENCA.md:** escopo, fora do escopo, regras de negócio e critério de aceite. É a fonte única; a especificação ao cliente sai dela.
- **ESTADO.md:** uma tela, que substitui a issue guarda-chuva, o status diário e a fila de WSJF do README. Mostra o que está no ar, o que aguarda quem e as pendências abertas, inclusive as que hoje somem em issue fechada.
- **LOG.md**, só acrescentado: andamento, conferências diárias e mudanças de rascunho.
- **Issue:** a unidade de trabalho, a discussão, a decisão e o ok humano.
- **Commit:** só o diff e a referência à issue.

**Aprovação.** Um ok por marco ou por mudança na produção, registrado pelo próprio humano (um comentário ou uma revisão de PR). Ações de baixo risco, como linhas de teste e merge de doc, ficam pré-autorizadas pela tolerância. O marco recebe revisão independente, que foi o que pegou #26, #29 e o descompasso entre a especificação e o código. Fechamento falso ("aceita" sem prova) é incidente.
