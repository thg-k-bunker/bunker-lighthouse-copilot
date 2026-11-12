# Síntese antes da produção da Lighthouse

Escrita em 12/11/2026, para retomar em outro chat. Reúne o que a pesquisa levantou, o que já está decidido e o que falta decidir para começar a escrever o `SKILL.md`. Onde há escolha, cada opção vem com uma recomendação minha, marcada como tal: é proposta, não decisão.

Fontes: [`decisoes.md`](decisoes.md), [`pesquisa/padrao-global-levantamento.md`](pesquisa/padrao-global-levantamento.md), [`pesquisa/boas-praticas-execucao.md`](pesquisa/boas-praticas-execucao.md), [`analise/`](analise/), [`pesquisa/skills-publicas-candidatas.md`](pesquisa/skills-publicas-candidatas.md) e [`pesquisa/prince2-tolerancias.md`](pesquisa/prince2-tolerancias.md).

## 1. O que a skill é

Padrão de processo para executar, sem retrabalho, trabalho que a Bunker ainda não domina. Duas fases, na lógica do processo judicial: **conhecimento** (entender, perguntar o que falta, checar cobertura, emitir a sentença, que é o catch) e **execução** (caminho crítico, depois maior incerteza, WSJF desempata). Natural: nem interrogatório, nem burocracia, nem muitas etapas. Vale para qualquer projeto, sem lista fechada de tipos.

## 2. O que a pesquisa levantou

| Frente | Conclusão que importa para a skill |
|---|---|
| Caso Metax (retrospectiva, GitHub, arquivos locais) | O retrabalho nasceu no mapeamento, não na execução técnica: fala de especialista que não virou requisito, 13 itens "incluídos" com 0 h, dados e ambiente não auditados, data prometida antes do fim da estimativa, especificação escrita depois do código, aceite que nunca veio. O rito de correção (vermelho e verde, revisão independente) pegou defeitos reais |
| Padrão global de levantamento | 11 movimentos, checagem de cobertura em três camadas (universais, lentes pela natureza do trabalho, itens do especialista gerados na hora), perfil do projeto em quatro eixos, regra de parada em 6 condições, 5 métricas. Evidência em níveis A a D |
| Boas práticas de execução | O que a sentença deve fixar (resultado, critério de pronto, tolerâncias), evidência obrigatória por passo, revisor independente nos marcos, pre-mortem, AAR curto, lição só vale se virar regra, estado curto separado do histórico |
| Skills públicas | 12 candidatas lidas com critério mínimo (50 estrelas, licença clara). Uso: referência de ideia, nunca copiar texto. Melhor achado: `process-source-elicitation`, que cobre a entrada (transcrição até fatos com fonte e confiança) |
| PRINCE2 | Mecânica de tolerância e gestão por exceção confirmada em fonte oficial da AXELOS (PRINCE2 Agile). Texto do manual oficial não lido |

## 3. O que já está decidido

| Tema | Decisão |
|---|---|
| Nome e lugar | `bunker-lighthouse-copilot`, entra no plugin `bunker` por PR em `skills/bunker-lighthouse-copilot/` |
| Coerência | Enxuta, cobre só a entrada de trabalho novo (transcrição até escopo fechado), aponta para as skills donas do resto, sem copiar regra |
| Início da fase 1 | Entendimento em 3 ou 4 linhas, o usuário confirma |
| Perguntas | Uma por vez, com recomendação (regra do passo 0 da `bunker-fix-bug-copilot`) |
| Mapa do terreno | Só sob demanda |
| Transcrição nova | Confrontada com a sentença; só a contradição muda a sentença, por aditamento |
| Checagem de cobertura | Antes do catch, interna, o que faltar vira pergunta |
| WSJF | Só na execução: caminho crítico, maior incerteza, WSJF desempata; nota dada uma vez |
| Processo no GitHub | Fora da Lighthouse: segue `bunker-fix-bug-copilot` e `bunker-wsjf-copilot` |
| Portas de aprovação | Ficam as externas e as internas |
| Quem decide | O Thiago é sempre o responsável. A skill não pergunta quem decide, paga ou assina; terceiro que pode travar vem da transcrição ou dele |
| Tolerâncias | Prazo, esforço e escopo, em faixa. Qualidade vai no critério de pronto (essencial tem tolerância zero). Plano de passos revisável dentro delas; aditamento só para mudar resultado, critério de pronto ou tolerância. Escalação pela previsão de estouro |
| Perfil do projeto | O Claude infere novidade, tecnologia, complexidade e ritmo da transcrição e confirma no entendimento de 3 ou 4 linhas, sem pergunta extra |
| Trabalho manual | Fora da skill |

## 4. O que falta decidir

Em ordem de dependência: as primeiras travam as seguintes.

### D1. Tamanho do `SKILL.md` e o que vai para `references/`

A `description` não pode passar de 1.024 caracteres e o `name` tem de ser igual ao da pasta, ou o `scripts/check-plugin.py` reprova (e skill fora do formato é descartada em silêncio). Como referência de tamanho, as maiores skills da casa têm de 583 a 1.253 linhas e a `bunker-fechar-turno-copilot` tem 106.

| Opção | Efeito |
|---|---|
| A. Tudo no `SKILL.md` | Simples de ler, mas pesado para trabalho pequeno e contra "natural, enxuta" |
| B. Fluxo no `SKILL.md`, detalhe em `references/` carregado conforme o perfil inferido | O perfil decide a profundidade; o corpo fica curto |
| C. Só o núcleo, sem `references/` | Mais enxuta, mas perde a checagem de cobertura em camadas |

**Recomendo B.** O `SKILL.md` leva o fluxo (entendimento, perguntas, cobertura, sentença, execução). `references/` leva as perguntas universais, as lentes, os itens do especialista, a regra de parada e o modelo da sentença.

### D2. Quais dos 11 movimentos entram, e como

O movimento 3 (ancorar o resultado e quem decide) já perdeu a parte do decisor. Os demais precisam de corte.

| Opção | Efeito |
|---|---|
| A. Os 11 | Mais completo, mais longo |
| B. Núcleo: 1, 2, 4, 7, 8, 11, mais resultado com métrica (do 3). Os movimentos 5, 6, 9 e 10 entram como itens da checagem de cobertura, ativados pelo perfil e pelas lentes | Mantém o fluxo curto e deixa a profundidade com o perfil |
| C. Só o fluxo mínimo (entender, perguntar, sentenciar) | Perde o que mais pesou na Metax: dados, ambiente e estimativa |

**Recomendo B.** Dados e ambiente (6) e estimativa em faixa (10) eram o que mais faltou na Metax, e isso fica como item obrigatório da checagem, não como etapa à parte.

### D3. Como a entrada é organizada (livro de fatos)

A `process-source-elicitation` propõe um livro de fatos: cada fato com fonte, ator, condição, trecho citado e confiança; conflito entre fontes registrado e nunca resolvido por conveniência.

| Opção | Efeito |
|---|---|
| A. Livro completo em tabela, sempre | Rastreável, mas pesado para transcrição curta |
| B. Leve: só o que vira requisito leva fonte e confiança (observado, dito por quem faz, dito por gestor, só documentado, inferido); conflito vira pergunta | Mantém a regra "inferência cita a fonte ou leva o rótulo premissa" sem tabela |
| C. Sem rastreio | Repete o erro da Metax (fala de especialista sem requisito escrito) |

**Recomendo B.** Opcional, sob demanda: gerar um questionário para quem não é o Thiago responder (ideia do `to-questionnaire`), quando a resposta mora com o cliente.

### D4. Formato e lugar da sentença, do estado e do histórico

A Metax mostrou o custo de misturar tudo: o mapa cresceu 55% em uma semana, o prompt precisava dizer "leia só a seção X, o resto é histórico", havia avisos repetidos de "NÃO refaça", e o arquivo nunca foi commitado. A pesquisa recomenda três coisas separadas.

| Arquivo | Conteúdo | Regra |
|---|---|---|
| Sentença | Resultado, critério de pronto verificável, tolerâncias, fora de escopo, premissas com o gatilho que as invalida, decisões, maior incerteza, passos | Estável e curta; só muda por aditamento |
| Estado | Onde estou, o que falta, próximo passo, o que espero do cliente | Cabe numa tela, reescrito a cada ciclo |
| Histórico | O que já foi feito e decidido | Só acumula, lido sob demanda |

Falta decidir três coisas: onde moram (recomendo no repositório do projeto, commitados), o nome dos arquivos e se o histórico é um arquivo ou o próprio git. A `bunker-fechar-turno-copilot` não cobre estado nem prompt da próxima sessão (confirmado em 12/11/2026: ela só encerra o que roda, limpa dado de teste e passa achados pelo rito da fix-bug), então a Lighthouse pode ser a dona do formato, e o prompt da próxima sessão sai pronto no fim de cada turno.

### D5. O que entra na fase de execução

Fechado: ordem de execução, portas de aprovação, GitHub fora. Aberto, item a item:

| Prática | Origem | Recomendação |
|---|---|---|
| Evidência obrigatória em todo passo ("feito" exige saída, link ou print) | `verification-before-completion`, harness da Anthropic | **Entra.** Ataca o falso "pronto" (Metax: issues de aceite fechadas sem o evento) |
| Pre-mortem antes da sentença | `great_cto`, Klein | **Entra só para perfil alto** em novidade, tecnologia ou complexidade. Pular em trabalho pequeno e fácil de desfazer |
| Revisor independente nos marcos | Claude Code, evaluator-optimizer | **Só perfil alto ou ação irreversível.** Na Metax a revisão independente pegou a #25 antes da produção |
| AAR curto (4 perguntas) | Exército dos EUA | **No encerramento**, não em todo marco. Só vira lição se virar regra, pergunta ou item de checklist (NASA: banco de lições quase não é consultado) |
| Regra de perguntas: ao humano só preferência, valor, restrição e fato que só ele conhece; técnico vira pesquisa ou teste curto | Pesquisa de execução, C2 item 4 | **Entra** como complemento da regra de uma por vez |
| Timebox por passo e parada ao estourar (circuit breaker) | Shape Up | **Entra como consequência das tolerâncias**, sem mecanismo próprio |
| WIP = 1 | Kanban | Opcional; recomendo não escrever, porque a ordem já é um passo por vez |

### D6. Biblioteca de itens do especialista

A camada 3 da checagem gera de 5 a 10 itens do domínio na hora, cada um citando a fonte ou levando "premissa do Claude". No encerramento, os itens que pegaram algo viram biblioteca por domínio.

| Opção | Efeito |
|---|---|
| A. Dentro do plugin, em `references/`, atualizada por PR | Rastreável, passa pelo `check-plugin.py`, mas exige PR a cada item |
| B. No repositório de cada projeto | Rápido, mas não chega às outras pessoas da Bunker |
| C. Só na v2 | A skill sai sem aprender com o uso |

**Recomendo C para a primeira versão, com o desenho de A pronto.** A primeira versão propõe os itens novos no encerramento e você decide se vão por PR. Isso respeita "vai sendo refinada com o uso" sem criar mecanismo antes do uso.

### D7. Métricas

Há 5 métricas no levantamento (pergunta tardia, retrabalho por requisito, cobertura na emissão, mudança de escopo depois da sentença, erro de estimativa e espera) e um painel mínimo de 5 na execução (lead time, falso "pronto", interrupções por hora, taxa de aditamento, lições convertidas). **Recomendo não medir na primeira versão** e registrar no histórico só três fatos baratos: perguntas feitas depois da sentença, aditamentos e passos reabertos. Os alvos numéricos da pesquisa não têm base empírica e devem ser calibrados com uso real.

## 5. Preparo que não depende de decisão

1. **Gatilho e `description`.** Redigir a `description` (até 1.024 caracteres) para disparar com transcrição colada, "projeto novo" ou "não domino isso", sem colidir com `bunker-consultant-copilot` (o que fazer agora), `bunker-fix-bug-copilot` (defeito que já existe) e `bunker-onboarding-copilot`.
2. **Evals de roteamento.** Os `evals/` do plugin testam só qual skill carrega (`tool_used` na ferramenta `Skill`). Escrever casos em que a Lighthouse deve carregar (transcrição colada, projeto novo) e casos em que não deve (defeito já reportado, pergunta sobre a casa). Esse formato não testa o comportamento da skill.
3. **Teste de comportamento com a Metax.** Reproduzir a transcrição de 01/07 e o caso da proposta e conferir se a checagem de cobertura levanta os pontos da retrospectiva (tensor, 13 itens com 0 h, NPX, canais reais de contato, data prometida). Fora do formato dos evals atuais; teria de ser manual.
4. **Estilo.** Passar o texto pela `bunker-copy-copilot` (padrões de cara de IA) e pela `bunker-brand-copilot`.
5. **Checagens do plugin.** `python3 scripts/check-plugin.py --base origin/main`, subir a `version` do plugin e entrar por PR em `skills/bunker-lighthouse-copilot/`, branch `feat/<slug>`, commit conventional em pt-BR.

## 6. Ajustes em outros arquivos

- `pesquisa/padrao-global-levantamento.md` (aba "Boas práticas + case Metax"): o bloco "Pessoas e decisão" tem perguntas obrigatórias que a decisão sobre quem decide torna desnecessárias. Passam a "assumido: Thiago", e a condição 4 da regra de parada vira "o Thiago confirmou o entendimento e o fora de escopo".
- `pesquisa/padrao-farol-resumo.md`: ainda lista o mapa do terreno como primeiro passo e a lista de decisões abertas antiga. Está superado por `decisoes.md`.
- Correções nas skills donas, fora da Lighthouse e dependentes de quem decidiu as regras: a `bunker-wsjf-copilot` refaz todas as notas a cada rodada, o que contradiz "nota dada uma vez"; a esteira e0 a e6 da `bunker-fix-bug-copilot` foi feita para defeito; a `bunker-repo-pulse-copilot` não separa "aguardando o cliente" de "em andamento".

## 7. O que não foi lido ou verificado

- Não li `evidencias.md`, `levantamento-evidencias.md` nem `analise/metax-repositorio-git.md` por inteiro; usei o que os outros arquivos citam deles.
- O manual oficial do PRINCE2 e o PMBOK 8 não foram lidos; o método da Deloitte não tem documento público que eu tenha achado. A estrutura da Lighthouse está alinhada com referências públicas (IBM Garage, ciclos de governo com portões, termo de abertura e linha de base do PMI), mas não há certificação de conformidade.
- Os scripts do `planning-with-files` foram varridos por padrões, não lidos linha a linha. Ele não é adotado.
- Os alvos numéricos de métricas e o corte "50 estrelas" do critério de confiança são escolhas sem base empírica.

## 8. Sugestão de ordem para o próximo chat

1. Decidir D1 e D2 (formato e núcleo); o resto depende delas.
2. Decidir D4 (arquivos de sentença, estado e histórico).
3. Decidir D3, D5, D6 e D7 de uma vez, com as recomendações acima como ponto de partida.
4. Rascunhar o `SKILL.md`, a `description` e os `references/` com as decisões fechadas.
5. Escrever os evals de roteamento e rodar o teste de comportamento com a Metax.
