> Pesquisa da aba "Boas práticas + case Metax" (11/11/2026): só o que foi medido, com nível de evidência. Referência: o que entra na skill é decidido em [`../decisoes.md`](../decisoes.md).

# Camada de evidências: execução de projetos (humano + agente de IA) em domínios pouco dominados

*Pesquisa feita em 11/11/2026. O documento não descreve frameworks: trata só do que foi medido. Níveis de evidência: **[A]** meta-análise ou RCT; **[B]** grande base observacional; **[C]** estudo de caso, survey ou autorrelato; **[D]** opinião ou prática sem teste. Quando não consegui conferir um número na fonte, ele vem marcado como "não verificado".*

---

## 1. Por que projetos falham ou dão certo: evidência de grande amostra

- **Flyvbjerg & Gardner, *How Big Things Get Done* (2023), Oxford** [B]. O livro usa uma base de mais de 16.000 projetos, de mais de 20 setores, em 136 países. Só **8,5%** dos projetos cumpriram custo e prazo, e só **0,5%** cumpriram custo, prazo e benefício. Essa é a "lei de ferro": acima do orçamento, acima do prazo, abaixo do benefício, de novo e de novo. Em TI, segundo resumos do livro, **18%** dos projetos estouraram o custo em mais de 50%, e nesse grupo o estouro médio foi de **447%**. Esse número de TI foi conferido só em fonte secundária. As receitas do livro são "pensar devagar, agir rápido" (planejar e testar enquanto é barato; executar curto), previsão por classe de referência e modularidade.
- **Flyvbjerg & Budzier, HBR, set/2011, "Why Your IT Project May Be Riskier Than You Think"** [B]. São 1.471 projetos de TI, com estouro médio de **27%**, mas com cauda gorda: segundo citação secundária, cerca de 1 em 6 estourou 200%. https://papers.ssrn.com/abstract=2229735
- **McKinsey e BT Centre da Universidade de Oxford, 2012** [B]. A base tem mais de 5.400 projetos de TI. Os grandes (acima de US$ 15 mi) ficaram em média **45% acima do orçamento** e **7% acima do prazo**, e entregaram **56% menos valor** que o previsto. Cerca de **17%** foram tão mal que ameaçaram a existência da empresa. **Cada ano a mais de cronograma se associou a +15% de estouro.** https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/delivering-large-scale-it-projects-on-time-on-budget-and-on-value
- **Standish CHAOS** [D como estatística]. Eveleens & Verhoef (Vrije Universiteit, *IEEE Software* 27(1), 2010) mostraram que as definições de "sucesso" e "desafiado" são "enganosas, unilaterais, pervertem a prática de estimativa e geram números sem sentido". Glass (*CACM* 49(8), 2006) e Jørgensen & Moløkken-Østvold (2006) fizeram críticas parecidas. https://ieeexplore.ieee.org/document/5232804
- **PMI, *Pulse of the Profession* 2025** [C, correlacional]. Profissionais com alta "business acumen" (só 18% da amostra) atingem 83% dos objetivos de negócio, contra 78% dos demais, e têm 8% de falha, contra 11%. O efeito é pequeno e vem de survey. https://www.pmi.org/learning/pulse
- **Falácia do planejamento.** Kahneman & Tversky (1979) cunharam o termo. Buehler, Griffin & Ross (*JPSP* 67(3), 1994) mediram teses: previsão média de **33,9 dias**, realizado de **55,5 dias**, e cerca de 30% terminaram no prazo previsto. Os números foram conferidos em fontes secundárias; não consegui acessar o PDF. O mecanismo é que as pessoas pensam no plano do caso atual e quase não lembram de casos passados [A/B]. Lovallo & Kahneman, "Delusions of Success" (*HBR*, jul/2003), prescrevem a "visão de fora" (classe de referência). O Reino Unido institucionalizou isso como *optimism bias uplift* (DfT/HM Treasury). Revisões de 2025 pedem mais teste empírico do método, mas ele é a melhor alternativa disponível.

## 2. Pesquisa de Harvard, MIT, Stanford e afins sobre execução

- **Segurança psicológica.** Edmondson (*ASQ*, 1999) é o estudo original. A meta-análise de **Frazier et al. (*Personnel Psychology* 70(1), 2017)** reúne **136 amostras, mais de 22.000 pessoas e cerca de 5.000 grupos** e liga segurança psicológica a compartilhamento de informação, comportamento de aprendizagem e desempenho [A]. O conceito de "falha inteligente" (Edmondson, *Right Kind of Wrong*, 2023) é conceitual [D]: território novo, a serviço de um objetivo, com hipótese, do menor tamanho possível.
- **Princípio do progresso (Amabile & Kramer, HBS, 2011)** [B/C]. Foram ~12.000 diários de 238 pessoas em 26 equipes de projeto, em 7 empresas. Progresso em trabalho significativo, mesmo pequeno, foi o maior motor da motivação diária. **Contratempos pesaram mais que avanços.**
- **Pre-mortem.** O "+30%" atribuído a Mitchell, Russo & Pennington (*J. Behav. Decis. Making* 2(1), 1989) mede a **quantidade de razões geradas** com "retrospectiva prospectiva", não a qualidade delas nem o sucesso do projeto. Foi Klein (*HBR*, 2007) quem popularizou a leitura ampliada. A base experimental é fina; o principal estudo é Veinott et al. (2010), com 178 estudantes [C]. É uma técnica barata e plausível, mas com evidência modesta.
- **Checklists.** Haynes et al. (*NEJM*, 2009; 8 hospitais, pré e pós, sem grupo controle) encontraram mortalidade caindo de **1,5% para 0,8%** e complicações de **11% para 7%** [B]. Urbach et al. (*NEJM*, 2014; Ontário, cerca de 200 mil cirurgias) **não encontraram redução significativa**: mortalidade de 0,71% para 0,65% [B]. O editorial de Leape atribuiu isso à adesão ruim. **A lição é que o checklist só funciona se for de fato usado e incorporado à cultura.**
- **Dinâmica de sistemas (MIT Sloan).**
  - Ford & Sterman, "Overcoming the 90% Syndrome" (*CERA* 11(3), 2003): o retrabalho descoberto tarde faz o projeto "parecer 90% pronto" e levar cerca de 2x o previsto. Mais concorrência entre etapas e as respostas gerenciais usuais à pressão de prazo **pioram** o quadro.
  - "The Liar's Club" (mesma edição): **esconder retrabalho conhecido** degrada prazo e qualidade de forma desproporcional.
  - Repenning & Sterman, "Nobody Ever Gets Credit for Fixing Problems that Never Happened" (*CMR* 43(4), 2001): a **armadilha de capacidade**. Sob pressão, cortam-se melhorias e manutenção, o que funciona no curto prazo e corrói a capacidade no longo [B, modelos e casos].
- **Reinertsen (custo do atraso, filas).** A teoria de filas é sólida: utilização alta leva a filas longas, e lotes grandes atrasam o feedback. Para o WSJF especificamente, **não encontrei avaliação empírica**. O WSJF do SAFe (pontuação relativa tipo Fibonacci) difere do CD3 de Reinertsen (custo do atraso ÷ duração, em dinheiro), e há críticas publicadas a essa adaptação (PMI/Disciplined Agile, "Improving WSJF") [D].
- **DORA / Accelerate (Forsgren, Humble & Kim, 2018)** [B, surveys anuais com milhares de respondentes]. Lead time, frequência de deploy, taxa de falha de mudança e tempo de recuperação se correlacionam com desempenho organizacional. **DORA 2025** (cerca de 5.000 profissionais) descreve a IA como **"amplificador"**: a adoção passou a se associar a *mais* throughput, mas também a **mais instabilidade** quando a base técnica é fraca. https://dora.dev/insights/dora-2025-year-in-review/
- **After Action Review e debriefs.** A meta-análise de **Tannenbaum & Cerasoli (*Human Factors* 55(1), 2013)** reúne **46 amostras (N=2.136)**. Debriefs melhoram o desempenho em cerca de **25% (d = 0,67)**, de forma parecida em equipes e indivíduos, em ambiente real e simulado. Alinhamento, facilitação e estrutura reforçam o efeito [A].
- **Lições aprendidas da NASA.**
  - **GAO-02-195 (2002):** só **23%** dos gerentes pesquisados já tinham registrado algo no LLIS. A fonte principal de lições eram **revisões de engenharia e conversas informais**, não o banco de dados.
  - **NASA OIG IG-12-012 (2012):** os gerentes "não usam rotineiramente" o LLIS; só 12 de 28 (43%) contribuíram; o sistema foi descrito como de "valor decrescente e questionável" [B].
  - **O que faz a lição ser reusada:** ela precisa entrar onde o trabalho já passa (revisões, requisitos, padrões, checklists), não num arquivo à parte.

## 3. Colaboração humano + IA

- **Dell'Acqua et al. (HBS/BCG, WP 24-013, 2023; versão publicada em *Organization Science*, 2025)** [A, RCT pré-registrado com 758 consultores].
  - Dentro da "fronteira": **+12,2% de tarefas, 25,1% mais rápido, mais de 40% de qualidade**. Os de baixo desempenho ganharam 43%, os de alto, 17%.
  - Numa tarefa **fora da fronteira**, quem usou IA teve **19 pontos percentuais a menos de acerto** (controle 84,5%, contra 60% a 70% com IA).
  - O estudo identificou dois padrões: "centauros", que dividem a tarefa, e "ciborgues", que integram humano e IA em cada subtarefa. O conceito de "falling asleep at the wheel" vem de Dell'Acqua (2022).
  - (Números conferidos no PDF do working paper.)
- **Brynjolfsson, Li & Raymond, "Generative AI at Work" (*QJE* 140(2), 2025)** [A/B, adoção escalonada, 5.172 agentes de suporte]. Ganho de **+14% a 15%** em resoluções por hora: **+34% para novatos**, efeito mínimo para os experientes. A IA difundiu as práticas dos melhores para os demais.
- **Cui, Demirer, Jaffe, Musolff, Peng & Salz (*Management Science*, 2025)** [A, 3 RCTs de campo em Microsoft, Accenture e Fortune 100, 4.867 devs]. **+26% de tarefas concluídas**, com +27% a 39% para juniores e +8% a 13% para seniores. A qualidade do código não foi medida.
- **METR (jul/2025, arXiv 2507.09089)** [A, RCT]. 16 devs experientes em repositórios próprios, 246 tarefas. Com IA, ficaram **19% mais lentos** (IC +2% a +39%). **Antes, previam 24% de ganho; depois, ainda acreditavam ter ganhado cerca de 20%.** Essa é a *lacuna de percepção*. Em **fev/2026** o METR refez o estudo: 57 devs e mais de 800 tarefas. Estimativas: −18% de tempo para os devs que voltaram (IC −38% a +9%) e −4% para os novos (IC −15% a +9%). O próprio METR declarou os dados **pouco confiáveis** por viés de seleção: devs se recusaram a trabalhar sem IA e esconderam tarefas. Conclusão honesta: **o efeito real em especialistas é incerto, e a autopercepção não serve como medida.** https://metr.org/blog/2026-02-24-uplift-update/
- **Vaccaro, Almaatouq & Malone (MIT), *Nature Human Behaviour* 8, 2024** [A, meta-análise de 106 experimentos e 370 efeitos].
  - Humano + IA ficou **abaixo do melhor dos dois sozinho** (g = −0,23), mas **acima do humano sozinho** (g = 0,64).
  - Perdas em **tarefas de decisão** (g = −0,27); tendência de ganho em **tarefas de criação**.
  - **Quando o humano era melhor que a IA, a dupla ganhou (g = +0,46). Quando a IA era melhor, a dupla perdeu (g = −0,54).**
  - https://pmc.ncbi.nlm.nih.gov/articles/PMC11659167/
- **Lee et al. (Microsoft Research/CMU, CHI 2025)** [C, survey com 319 profissionais e 936 casos]. Mais confiança na IA se associa a **menos** pensamento crítico; mais autoconfiança no próprio domínio se associa a **mais**. O pensamento crítico migra para verificar, integrar e "administrar" a tarefa.
- **Viés de automação.** Parasuraman & Manzey (*Human Factors* 52(3), 2010) mostram que complacência e viés aparecem **em novatos e especialistas** e **não somem com simples prática** [A, revisão]. Goddard et al. (*JAMIA*, 2012) fazem a revisão sistemática em saúde.
- **Bastani et al. (*PNAS* 122(26), 2025)** [A, RCT com cerca de 1.000 alunos]. Com GPT sem salvaguardas, a prática melhorou 48%, mas a prova **sem IA foi 17% pior** que a do controle. A versão "Tutor", com salvaguardas, neutralizou o dano. Usar a IA como muleta prejudica o aprendizado.
- **Anthropic Economic Index (jan/2026)** [B, telemetria].
  - No Claude.ai: 52% de aumento (augmentation) contra 45% de automação. Na API, cerca de 3/4 é automação.
  - **O sucesso cai com a duração:** na API, de ~60% (tarefas de menos de 1h) para ~45% (tarefas de 5h ou mais), com o ponto de 50% em cerca de 3,5h. **No Claude.ai, com feedback em múltiplos turnos, o ponto de 50% extrapola para cerca de 19h.** Isso indica que checkpoints humanos ampliam o horizonte confiável.
  - https://anthropic.com/research/anthropic-economic-index-january-2026-report
- **Horizonte temporal do METR (TH 1.1, jan/2026)** [B]. O horizonte de 50% dobra a cada cerca de 196 dias no longo prazo e a cada **cerca de 89 dias desde 2024**. Topo da tabela: Claude Opus 4.5 com 320 min (IC 170 a 729). Segundo fontes secundárias (não verificado na fonte), o relatório de maio/2026 dá cerca de 16 a 20h a 50% e **3 a 4h a 80%**. **Exigir mais confiabilidade encolhe o horizonte em várias vezes.**
- **τ-bench (Yao et al., ICLR 2025)** [B]. A confiabilidade em k tentativas cai rápido: pass^8 de cerca de 25% no varejo (GPT-4o). Acertar uma vez não garante acertar sempre.
- **MIT NANDA, "The GenAI Divide" (2025)** [C/D]. "95% sem retorno" é uma manchete com metodologia pouco divulgada e criticada. A tese interessante é a da **lacuna de aprendizagem**: sistemas que não retêm contexto nem aprendem com feedback não se integram ao fluxo. Vale como hipótese, não como dado.
- **Pesquisa interna da Anthropic (dez/2025)** [C, autorrelato com 132 engenheiros]. Claude responde por 59% do trabalho, com cerca de +50% de produtividade *percebida*, e 27% do trabalho "não teria sido feito". Há preocupação com perda de habilidade e menos colaboração entre colegas. Pela lacuna de percepção do METR, não deve ser tratado como medida.
- **Stack Overflow Survey 2025** [C]. 46% desconfiam da precisão da IA e 33% confiam. A frustração número 1 é a solução "quase certa".

## 4. Práticas emergentes (2025 a 2026), com o grau de adoção

- **Arquivos de progresso e feature lists como contrato**, segundo a Anthropic ("Effective harnesses for long-running agents", 26/11/2025). As falhas observadas foram: tentar fazer tudo de uma vez, **declarar vitória cedo**, deixar estado quebrado sem nota e marcar como pronto sem teste ponta a ponta. As contramedidas: lista JSON de funcionalidades com flag `passes`, que o agente só pode mudar de valor, nunca apagar ou reescrever; uma funcionalidade por sessão; log de progresso; commits; teste E2E; e uma rotina de início de sessão [C, relato de engenharia].
- **Thoughtworks Technology Radar** [D, sinal de adoção]. Na vol. 33 (nov/2025), *spec-driven development* aparece como **Assess**, com alerta de risco de "voltar à especificação pesada antecipada", e **AGENTS.md** como **Trial**. Na vol. 34 (abr/2026), segundo resumos, **context engineering** vai para **Adopt**.
- **Desenvolvimento guiado por evals e testes de aceitação definidos antes da execução.** É coerente com τ-bench e com o METR. Não há RCT sobre a prática em si [D].
- **Estudo de caso de empresa rodando projetos com agentes:** os relatos públicos são **autorrelatos de fornecedores**, como o da própria Anthropic. Não encontrei avaliação independente rigorosa.

## 5. Aprender em domínios desconhecidos

- **Prática deliberada.** Ericsson et al. (1993) é a origem. A meta-análise de Macnamara, Hambrick & Oswald (*Psych. Science*, 2014; 88 estudos, mais de 11.000 pessoas) dá r = 0,35, ou seja, **cerca de 12% da variância** explicada em geral, com efeito muito menor em profissões [A]. Os percentuais por domínio que circulam (26%, 21%, 18%, 4%, <1%) não foram verificados nesta pesquisa. A prática importa, mas bem menos do que a regra das "10.000 horas" sugere.
- **Carga cognitiva.** Kirschner, Sweller & Clark (*Educ. Psychologist* 41(2), 2006) mostram que orientação mínima não funciona para novatos; **exemplos trabalhados** funcionam. O **efeito de reversão de expertise** (Kalyuga, Ayres, Chandler & Sweller, 2003) diz que a orientação que ajuda o novato atrapalha o experiente, então é preciso retirar o andaime aos poucos (*fading*) [A].
- **Recuperação ativa.** Roediger & Karpicke (*Psych. Science*, 2006) e Dunlosky et al. (*PSPI*, 2013) classificam teste prático e prática espaçada como de "alta utilidade". As "dificuldades desejáveis" de Bjork vão na mesma linha [A].
- **Aprendizagem cognitiva (cognitive apprenticeship).** Collins, Brown & Newman (1989) propõem modelar, dar coaching, montar andaime, retirar o andaime, pedir articulação e reflexão e só depois deixar o aprendiz explorar. É um modelo influente, com validação por componentes, não como pacote [B/D].
- **Cynefin (probe-sense-respond).** Não há validação controlada. A base é ação-pesquisa e anedota; serve como heurística de diagnóstico [D].

---

## 6. Síntese

### (a) Os 12 princípios mais robustos

1. **Visão de fora antes da de dentro.** *Evidência:* falácia do planejamento (Buehler 1994); Lovallo & Kahneman 2003; só 8,5% dos projetos cumprem prazo e custo (Flyvbjerg). *Implicação para a skill:* na fase de conhecimento, perguntar qual é a classe de referência ("projetos parecidos levaram quanto?") e registrar na **sentença** uma faixa P50/P80, não uma data única. Quando faltar classe de referência, declarar a incerteza.
2. **Pensar devagar, agir rápido: duração é risco.** *Evidência:* +15% de estouro por ano a mais de cronograma (McKinsey/Oxford 2012); Flyvbjerg 2023. *Implicação:* investir na fase de conhecimento, onde errar é barato, e manter o ciclo de execução curto. Marcos devem caber em dias, não em meses.
3. **Proteger contra a cauda, não contra a média.** *Evidência:* caudas gordas em TI (Flyvbjerg & Budzier 2011); 17% de "cisnes negros" (McKinsey). *Implicação:* a sentença traz **critérios de parada e de re-sentença**. Um incidente grande suspende o ciclo e reabre a fase de conhecimento.
4. **Lotes pequenos e modularidade.** *Evidência:* progresso pequeno motiva e contratempo pesa mais (Amabile, 12.000 diários); DORA; falha de "tentar tudo de uma vez" (Anthropic 2025); queda de sucesso com a duração (Economic Index, τ-bench). *Implicação:* o ciclo escolher→declarar→executar→verificar→registrar opera em **uma unidade pequena e verificável por vez**, com WIP = 1 por agente.
5. **"Pronto" exige evidência objetiva, nunca percepção.** *Evidência:* síndrome dos 90% e retrabalho escondido (Ford & Sterman 2003); "declarar vitória cedo" (Anthropic); lacuna de percepção de cerca de 40 p.p. (METR 2025). *Implicação:* em **declarar**, escrever o critério de aceite verificável; em **verificar**, anexar a prova (teste, saída, revisão humana). Sem prova, a tarefa não fecha.
6. **Reservar capacidade para melhoria e incidentes.** *Evidência:* armadilha de capacidade (Repenning & Sterman 2001). *Implicação:* o WSJF inclui sempre itens de dívida e prevenção. Incidentes pequenos e médios geram tarefa de correção de causa, não só de sintoma.
7. **Debrief estruturado e curto.** *Evidência:* cerca de 25% de melhora, d = 0,67 (Tannenbaum & Cerasoli 2013). *Implicação:* micro-AAR em cada marco (o que se esperava, o que aconteceu, por quê, o que muda) e AAR completo no fechamento.
8. **Lição só vale se mudar o processo.** *Evidência:* NASA LLIS subutilizado (GAO 2002: 23% contribuíram; OIG 2012: 43%); a fonte real de lições eram as revisões. *Implicação:* cada lição do fechamento vira uma **alteração concreta** (item de checklist, pergunta da fase de conhecimento, regra da sentença ou da skill), com dono. Uma lição sem alteração é marcada como "não incorporada".
9. **Franqueza obrigatória e pre-mortem.** *Evidência:* meta-análise de segurança psicológica (Frazier 2017); efeito do retrabalho escondido ("Liar's Club"); pre-mortem gera mais riscos (Mitchell 1989, efeito sobre quantidade). *Implicação:* o agente **tem o dever de reportar má notícia na hora** e de dizer "não sei". A sentença inclui um pre-mortem curto: "imagine que falhou, por quê?".
10. **Checklists curtos, nos gates, de uso real.** *Evidência:* Haynes 2009 com efeito forte; Urbach 2014 com efeito nulo, provavelmente por adesão. *Implicação:* poucos itens, executados em transições (fim da fase de conhecimento, verificação, marco, fechamento) e com registro de que foram executados.
11. **Alocar humano e IA por vantagem comparativa e pela fronteira.** *Evidência:* −19 p.p. fora da fronteira (Dell'Acqua 2023); a dupla perde quando a IA é melhor e ganha quando o humano é melhor, e perde em tarefas de decisão (Vaccaro 2024); o sucesso cai com a duração e o horizonte de 80% é muito menor que o de 50% (METR, Anthropic). *Implicação:* em **declarar**, classificar a tarefa como dentro, na borda ou fora da fronteira, o que define o nível de verificação. **Decisões irreversíveis e julgamentos de valor ficam com o humano.** Tarefas longas são quebradas em blocos com checkpoints.
12. **Novato em domínio precisa de orientação explícita e recuperação ativa, retiradas aos poucos.** *Evidência:* Kirschner, Sweller & Clark 2006; reversão de expertise; teste prático (Roediger & Karpicke 2006); IA sem salvaguardas reduz o aprendizado (−17%, Bastani 2025); ganho maior da IA para novatos (Brynjolfsson 2025). *Implicação:* na fase de conhecimento, uma pergunta por vez **com exemplo trabalhado e recomendação**, e de vez em quando pedir ao humano que **explique de volta** a decisão. Reduzir o andaime à medida que ele domina o assunto.

### (b) Mitos e práticas populares com evidência fraca, nos quais não devemos nos apoiar

- **Percentuais do Standish CHAOS** como taxa de sucesso: metodologia criticada (Eveleens & Verhoef 2010).
- **"95% dos pilotos de IA falham"** (MIT NANDA): metodologia opaca.
- **Produtividade autorrelatada com IA**, inclusive a interna da Anthropic: o METR mostrou que a percepção diverge da medida.
- **"Pre-mortem aumenta em 30% a precisão":** o estudo original mediu quantidade de razões.
- **WSJF com pontuação Fibonacci como cálculo econômico preciso:** não há validação empírica. Use como ordenação relativa transparente, não como verdade.
- **Cynefin como diagnóstico validado:** é heurística útil, sem teste controlado.
- **Regra das 10.000 horas, ou prática deliberada como fator dominante:** cerca de 12% da variância (Macnamara 2014).
- **Banco de lições aprendidas como solução:** a experiência da NASA mostra o contrário.
- **"Humano no loop sempre melhora":** a meta-análise do MIT mostra perdas em tarefas de decisão quando a IA é superior. O humano precisa agregar onde é melhor, e não só carimbar.
- **Checklist como bala de prata:** sem adesão, efeito nulo (Urbach 2014).
- **"Estilos de aprendizagem":** sem evidência adequada (Pashler, McDaniel, Rohrer & Bjork, *PSPI*, 2008).

### (c) Riscos do trabalho humano + IA e contramedidas

| Risco (evidência) | Contramedida na skill |
|---|---|
| **Lacuna de percepção** (METR: achavam +20%, mediram −19%) | Registrar tempo real por tarefa; comparar com a estimativa; nunca usar "parece mais rápido" como métrica. |
| **Fronteira irregular** (−19 p.p. fora dela) | Classificar a fronteira em *declarar*. Tarefas na borda ou fora dela exigem verificação independente: teste, fonte primária ou especialista. |
| **Viés de automação e complacência** (Parasuraman & Manzey; não some com prática) | Verificação ativa e não passiva. O humano confere **contra o critério escrito antes**, e não "lê e aprova". Amostrar e reexecutar verificações. |
| **"Dormir ao volante" e queda de pensamento crítico** (Lee 2025; Bastani 2025) | O humano explica de volta as decisões-chave; o agente apresenta alternativas e contra-argumentos, não só a recomendação. |
| **Vitória prematura ou estado quebrado** (Anthropic 2025; síndrome dos 90%) | Lista de critérios imutável; o agente só muda o status com prova; log de progresso e checkpoint a cada ciclo. |
| **Queda de confiabilidade em tarefas longas e inconsistência** (Economic Index; τ-bench) | Blocos menores que o horizonte confiável; checkpoints humanos nos marcos; repetir verificações críticas. |
| **Erosão de habilidade e de colaboração** (pesquisa interna da Anthropic) | O fechamento registra o que o humano aprendeu, e decisões relevantes são compartilhadas com o time. |

### (d) Métricas com respaldo na literatura

1. **Precisão de estimativa** (real ÷ estimado, em distribuição): alimenta a classe de referência futura (Flyvbjerg; Lovallo & Kahneman).
2. **Lead time ou cycle time por tarefa e por marco** (DORA).
3. **Taxa de falha na verificação ou de retrabalho**, isto é, tarefas que voltam depois de "prontas" (DORA "change failure rate"; Ford & Sterman). Que o DORA tenha uma métrica formal de "rework rate" não foi verificado.
4. **Tempo de recuperação de incidentes** por severidade: pequeno, médio, grande (DORA, tempo de restauração).
5. **WIP e tempo bloqueado** (filas, Reinertsen).
6. **Benefício realizado contra o prometido na sentença**: a terceira dimensão da lei de ferro, a mais esquecida (Flyvbjerg).
7. **Taxa de lições incorporadas**: lições que viraram mudança, sobre lições registradas (GAO/NASA).
8. **Cobertura de verificação humana** em tarefas na borda ou fora da fronteira (Dell'Acqua; Vaccaro).
9. **Tempo medido contra tempo percebido**, por amostragem (METR).

---

### Fontes principais (URLs)
- Flyvbjerg & Budzier 2011: https://papers.ssrn.com/abstract=2229735
- McKinsey/Oxford 2012: https://www.mckinsey.com/capabilities/tech-and-ai/our-insights/delivering-large-scale-it-projects-on-time-on-budget-and-on-value
- Eveleens & Verhoef 2010: https://ieeexplore.ieee.org/document/5232804
- Tannenbaum & Cerasoli 2013: https://pubmed.ncbi.nlm.nih.gov/23516804/
- Haynes 2009: https://pubmed.ncbi.nlm.nih.gov/19144931/ · Urbach 2014: https://pubmed.ncbi.nlm.nih.gov/24620866/
- GAO-02-195: https://www.gao.gov/products/gao-02-195 · NASA OIG IG-12-012: https://www.oversight.gov/sites/default/files/oig-reports/IG-12-012.pdf
- Ford & Sterman 2003: https://www.mit.edu/~jsterman/90_Syndrom_CERA2003_1.pdf · Repenning & Sterman 2001: https://cmr.berkeley.edu/2001/08/43-4-nobody-ever-gets-credit-for-fixing-problems-that-never-happened-creating-and-sustaining-process-improvement
- Frazier et al. 2017: https://digitalcommons.odu.edu/management_fac_pubs/13/
- Dell'Acqua et al. 2023: https://mitsloan.mit.edu/sites/default/files/2023-10/SSRN-id4573321.pdf
- Brynjolfsson et al. 2025: https://www.nber.org/papers/w31161 · Cui et al. 2025: https://papers.ssrn.com/abstract=4945566
- METR 2025: https://arxiv.org/abs/2507.09089 · METR 2026: https://metr.org/blog/2026-02-24-uplift-update/ · TH 1.1: https://metr.org/blog/2026-01-29-time-horizon-1-1/
- Vaccaro et al. 2024: https://pmc.ncbi.nlm.nih.gov/articles/PMC11659167/
- Lee et al. 2025: https://advait.org/files/lee_2025_ai_critical_thinking_survey.pdf
- Bastani et al. 2025: https://papers.ssrn.com/abstract=4895486
- Anthropic Economic Index jan/2026: https://anthropic.com/research/anthropic-economic-index-january-2026-report
- Anthropic harnesses: https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents
- τ-bench: https://arxiv.org/abs/2406.12045
- DORA 2025: https://dora.dev/insights/dora-2025-year-in-review/
- Thoughtworks Radar vol. 33: https://www.thoughtworks.com/content/dam/thoughtworks/documents/radar/2025/11/tr_technology_radar_vol_33_en.pdf
- Parasuraman & Manzey 2010: https://pubmed.ncbi.nlm.nih.gov/21077562/
- Kirschner, Sweller & Clark 2006 / Macnamara et al. 2014 (DOI 10.1177/0956797614535810) / Roediger & Karpicke 2006: https://psychology.ecu.edu/wp-content/pv-uploads/sites/216/2019/03/Roediger-Karpicke-2006.pdf
