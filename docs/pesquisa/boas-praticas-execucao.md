> Pesquisa da aba "Boas práticas + case Metax" (11/11/2026). Referência: o que entra na skill é decidido em [`../decisoes.md`](../decisoes.md). Síntese em [`padrao-farol-resumo.md`](padrao-farol-resumo.md).

# Farol: boas práticas de execução de projetos e de trabalho com agentes de IA

*Pesquisa feita em 11/11/2026. Fontes no texto. Onde só encontrei fontes secundárias, ou não consegui confirmar algo, isso está indicado.*

---

## A. Padrões clássicos de execução de projetos

**PMBOK 7 (PMI, 2021).** O PMBOK 7 deixou de ser um guia de processos e passou a ter 12 princípios e 8 domínios de desempenho: Stakeholders, Equipe, Abordagem de desenvolvimento e ciclo de vida, Planejamento, Trabalho do projeto, Entrega, Medição e Incerteza. Os domínios correm em paralelo, não em fases. A principal lição para o Farol: o planejamento se adapta ao contexto (*tailoring*) e a incerteza é um domínio de primeira classe, não um anexo. Confirmei isso só em fontes secundárias, como https://www.knowledgetrain.co.uk/project-management/pmi/project-management-body-of-knowledge-pmbok. Um site de treinamento diz que o PMBOK 8 (2025) reduziu para 6 princípios e 7 domínios. Não há corroboração: confira em pmi.org.

**PRINCE2.** Três ideias interessam ao Farol:
- **Gestão por exceção:** cada nível recebe *tolerâncias* (tempo, custo, escopo, qualidade, risco e benefício) e só escala quando há previsão de estourá-las.
- **Gestão por estágios:** cada estágio termina com um *gate* de decisão.
- **Lições aprendidas** registradas desde o início, não só no encerramento.

Isso mapeia quase um a um nas regras de parada e na classificação de incidentes do Farol. (PeopleCert/Axelos, manual oficial. Não li o texto primário nesta pesquisa.)

**Scrum.** O Scrum Guide (https://scrumguides.org/scrum-guide.html) torna a *Definition of Done* obrigatória e usa *timeboxes* em todos os eventos. A *Definition of Ready* **não** está no Guia. É prática da comunidade, e há quem a critique por virar um gate burocrático que trava o fluxo.

**Lean.** Mary e Tom Poppendieck traduziram para software as sete perdas da manufatura: trabalho parcialmente feito, funcionalidades extras, reaprendizado, *handoffs*, troca de contexto, esperas e defeitos (*Lean Software Development*, 2003). Para um agente, as perdas mais relevantes são **reaprendizado** (redescobrir contexto a cada sessão), **funcionalidades extras** (gold-plating) e **trabalho parcialmente feito**.

**Kanban.** Puxar trabalho (pull), limitar o trabalho em andamento (WIP) e tornar as políticas explícitas. A Lei de Little dá a relação: lead time = WIP ÷ throughput. Com WIP = 1 a cada momento, o ciclo do Farol já é um Kanban de uma raia só.

**WSJF (SAFe / Reinertsen).**
- **Fórmula:** WSJF = Cost of Delay ÷ duração. No SAFe, o Cost of Delay é a soma de três componentes: valor de negócio/usuário, criticidade temporal e redução de risco/habilitação de oportunidade. "If you only quantify one thing, quantify the Cost of Delay" (Reinertsen).
- **Ressalvas conhecidas:**
  - O SAFe troca a duração por um *tamanho* relativo em escala Fibonacci. Dividir números ordinais é matematicamente frágil, e o próprio *Disciplined Agile* do PMI critica isso (https://www.pmi.org/disciplined-agile/improving-wsjf).
  - Erros de estimativa mudam a ordem final (https://failfastmoveon.blogspot.com/2021/03/why-wsjf-is-nonsense.html, blog de praticante).
  - Estimar Cost of Delay em projetos únicos é difícil.
  - O WSJF ignora dependências e caminho crítico.
- **Defesa:** Joshua Arnold argumenta que, sem o WSJF, o Cost of Delay continua sendo estimado, só que por intuição. Para isso ele propõe o CD3 (Cost of Delay Divided by Duration).

**Shape Up (Basecamp).** Fonte: https://basecamp.com/shapeup.
- ***Appetite*** em vez de estimativa: quanto tempo o problema *merece*.
- **Tempo fixo, escopo variável.**
- ***Hill chart*:** cada escopo tem uma fase "subida" (ainda descobrindo) e uma fase "descida" (só executando). A regra é atacar primeiro os itens mais incertos, para que cheguem cedo ao topo da colina.
- ***Scope hammering*:** cortar escopo para caber no prazo.
- ***Circuit breaker*:** o que não termina no ciclo não é prorrogado automaticamente.

**Cynefin (Snowden & Boone, HBR 2007, https://hbr.org/2007/11/a-leaders-framework-for-decision-making).** O modelo separa os domínios pelo modo de agir:

| Domínio | Como agir | O que funciona |
|---|---|---|
| Claro | sense-categorize-respond | boas práticas |
| Complicado | sense-analyze-respond | análise de especialista |
| Complexo | **probe-sense-respond** | experimentos seguros de falhar, padrões emergentes |
| Caótico | act-sense-respond | agir primeiro |

Ponto central para o Farol: o humano "não domina o domínio" **não** quer dizer que o problema é complexo. Muitas vezes é só *complicado*, e o agente faz o papel de especialista. A fase de conhecimento precisa diagnosticar o domínio de cada incógnita.

**Pre-mortem (Gary Klein, HBR 2007, https://hbr.org/2007/09/performing-a-project-premortem).** Antes de começar, imagina-se que o projeto já fracassou e pergunta-se por quê. Klein cita pesquisa de Mitchell, Russo & Pennington (1989): a "retrospecção prospectiva" aumenta em cerca de 30% a capacidade de identificar razões corretas para resultados futuros.

**Logs de RAID, decisões e premissas.**
- **RAID:** riscos, premissas (*assumptions*), problemas (*issues*) e dependências.
- **ADRs (Michael Nygard, 2011, https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions):** registros curtos com contexto, decisão, status e consequências. São imutáveis: uma decisão nova *substitui* a antiga, nunca a apaga.
- **Log de premissas:** cada premissa com dono e data de validação.

**AAR (After-Action Review, Exército dos EUA, TC 25-20, 1993).** Quatro perguntas:
1. O que deveria acontecer?
2. O que aconteceu?
3. Por que houve diferença?
4. O que manter e o que mudar?

O AAR é curto, feito logo após o evento e sem buscar culpados.

**Lições aprendidas que de fato são reutilizadas.** As evidências são duras:
- A GAO (2001, https://www.gao.gov/products/gao-01-1015r) achou que 27% dos gerentes da NASA nem conheciam o sistema de lições aprendidas da agência (LLIS), e só 17,5% tinham aplicado alguma lição dele.
- A auditoria da OIG da NASA (IG-12-012, 2012, https://www.oversight.gov/sites/default/files/oig-reports/IG-12-012.pdf) concluiu que os gerentes não consultam nem alimentam o LLIS rotineiramente.

Conclusão: lição só gera valor quando é **empurrada para o ponto de uso** (checklist, regra, template), não arquivada.

**Caminho crítico, spikes e rolling-wave.**
- **Caminho crítico:** a sequência de dependências que define o prazo mínimo.
- **Spike:** pesquisa com prazo fixo para reduzir uma incógnita, com resultado definido e descartável.
- **Rolling-wave planning (PMI):** o horizonte próximo é detalhado e o distante fica em pacotes grossos, refinados conforme o conhecimento chega.

---

## B. Boas práticas para trabalho com agentes de IA (2024–2026)

**"Building effective agents" (Anthropic, https://www.anthropic.com/engineering/building-effective-agents).**
- Comece pela solução mais simples e só adicione complexidade se for preciso.
- A cada passo, o agente obtém "ground truth" do ambiente (resultado de ferramenta, execução).
- Pausa em checkpoints ou bloqueios para receber feedback humano.
- Condições de parada explícitas, como um número máximo de iterações.
- Padrão *evaluator-optimizer* quando há critérios claros de avaliação.

**Best practices do Claude Code (https://code.claude.com/docs/en/best-practices).**
- **Entrevista em vez de especificação pronta:** "Interview me until you could write the spec, then write it to SPEC.md." O Claude responde com perguntas de **múltipla escolha**, e depois a construção começa numa sessão nova, a partir do arquivo, com "a written definition of done".
- **Verificação:** sem um check executável, "looks done" é tudo o que o agente tem e "you become the test suite". O doc pede **evidências** (comando + saída, screenshot): "'All tests pass' on its own tells you very little".
- **Revisão:** feita por um revisor que não escreveu o trabalho (subagente novo, sem o raciocínio que o produziu). Ele compara contra a spec e reporta só lacunas de correção, porque "a reviewer that's asked to find problems will always find something".
- **Correção:** após duas correções falhas, use `/clear` e um prompt melhor em vez de uma terceira correção.
- **Antes de um run autônomo, cinco perguntas:**
  1. O agente sabe como é o "pronto"?
  2. Consegue verificar o próprio trabalho?
  3. O que pode tocar?
  4. O que o faz parar (limite de turnos ou gasto)?
  5. Quem aprova o que não tem volta?
- **Ênfase e insistência:** o doc também diz que regras em CAIXA ALTA e "keep going" tendem a causar *sobre-trabalho*. Regra inegociável deve virar mecanismo (hook ou bloqueio), não ênfase textual.

**Context engineering (https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents).**
- O contexto é um recurso finito, com "attention budget".
- Objetivo: o "smallest set of high-signal tokens".
- Técnicas: compactação, **notas estruturadas persistentes** (NOTES.md, to-do), subagentes que devolvem resumos destilados e recuperação just-in-time.

**Context rot (Chroma, jul/2025, https://trychroma.com/research/context-rot).** O desempenho de todos os modelos testados se degrada de forma não uniforme conforme o input cresce. Distratores pioram o efeito. Conclusão para o Farol: a sentença deve ser **curta e de alto sinal**, não um diário crescente.

**Harnesses para agentes de longa duração (https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents).** Este é o paralelo mais direto do Farol:
- **Agente inicializador:** cria arquivo de progresso, script de ambiente e uma **lista de funcionalidades em JSON, todas inicialmente "failing"**. O agente só pode mudar o status. JSON foi escolhido porque o modelo o sobrescreve menos que Markdown, e "It is unacceptable to remove or edit tests".
- **Por sessão:** uma funcionalidade de cada vez, terminando em estado limpo.
- **Início de cada sessão:** ler progresso e git, rodar teste end-to-end básico.
- **Falhas nomeadas:** declarar vitória cedo demais, marcar "pronto" sem verificar, deixar progresso não documentado.

**Spec-driven development.**
- **GitHub Spec Kit:** *constitution* (princípios e gates permanentes) → specify → plan → tasks → implement, com `/clarify` para ambiguidades e `/analyze` para checar consistência entre os artefatos (https://developer.microsoft.com/blog/spec-driven-development-spec-kit/).
- **Kiro:** requirements.md (critérios de aceitação em notação EARS, "WHEN … THE SYSTEM SHALL …") → design.md → tasks.md, com aprovação humana entre as fases (https://kiro.dev/docs/specs/concepts).
- **Crítica de Birgitta Böckeler (martinfowler.com, out/2025, https://www.martinfowler.com/articles/exploring-gen-ai/sdd-3-tools.html):** escrever a spec antes vale a pena, mas as ferramentas são pesadas para mudanças pequenas. Num bugfix, o Kiro gerou 4 user stories com 16 critérios de aceitação. Ela também aponta que o *tamanho* do processo precisa escalar com o problema. Li apenas resumos, não o texto completo.

**Avaliação e verificação ("Demystifying evals for AI agents", Anthropic, https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents).** Combine avaliadores por código, por modelo e humanos, em camadas. A atribuição das métricas pass@k e pass^k a esse post veio de fonte secundária e não foi confirmada.

**Falhas de agentes em tarefas longas.**
- **Taxonomia MAST (Cemri et al., NeurIPS 2025, https://arxiv.org/abs/2503.13657):** 14 modos de falha em 3 grupos: problemas de especificação, desalinhamento entre agentes e **verificação/terminação** (verificação incompleta, término prematuro). Os autores dizem que a maioria das falhas é de *design do sistema*, não do modelo.
- **Sycophancy (Anthropic, https://www.anthropic.com/research/towards-understanding-sycophancy-in-language-models):** modelos treinados com RLHF tendem a concordar com o usuário e a admitir erros que não cometeram. Isso atinge diretamente o "recomendo X" e o "verifiquei, está pronto".
- **Alcance autônomo (METR, https://arxiv.org/abs/2503.14499):** a duração de tarefa que agentes completam com 50% de confiabilidade dobra a cada cerca de 7 meses. O horizonte a 80% é cerca de 5 vezes menor, o que justifica quebrar o trabalho em passos curtos e verificáveis.
- **Percepção x realidade (METR, RCT de jul/2025, https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/):** desenvolvedores experientes ficaram 19% mais lentos com IA, mas **acreditavam** estar 20% mais rápidos. Medir com dados, não com sensação, é obrigatório.

---

## C1. As 15 práticas de maior alavancagem e onde entram no Farol

| # | Prática | Onde entra no Farol | Como aplicar |
|---|---|---|---|
| 1 | **Definição de pronto verificável e com evidência** (Scrum DoD, EARS, Claude Code "evidence") | Sentença + ciclo | Cada passo tem critério testável no formato "QUANDO… ENTÃO…". "Verificado" exige artefato (saída, link, screenshot), nunca só afirmação. |
| 2 | **Lista de passos com status imutável em estrutura rígida** (harness Anthropic) | Sentença | Passos em tabela/JSON com status `pendente/feito/bloqueado`. O agente muda só o status. Remover ou reescrever um critério exige aditamento. |
| 3 | **Tolerâncias + gestão por exceção** (PRINCE2) | Sentença + incidentes | A sentença fixa tolerâncias de prazo, custo, escopo, qualidade e risco. Incidente pequeno = dentro da tolerância. Grande = previsão de estouro. Isso torna a classificação objetiva. |
| 4 | **Diagnóstico Cynefin por incógnita** | Fase de conhecimento | Classificar cada ponto aberto. Complicado: o agente pesquisa e recomenda. Complexo: vira *spike/probe* com prazo fixo, não pergunta ao humano. |
| 5 | **Pre-mortem** (Klein) | Fim da fase de conhecimento | Antes de emitir a sentença: "Daqui a X semanas isto fracassou. Por quê?" Os 3–5 riscos principais entram no registro RAID. |
| 6 | **Log de premissas e decisões no estilo ADR** | Sentença | Todo default ("assume o resto") vira premissa explícita, com o gatilho que a invalidaria. Decisões são imutáveis e substituídas por novas. |
| 7 | **Rolling-wave** (PMI) | Fase de conhecimento | Detalhar só a próxima onda. Passos distantes ficam como pacotes. Refinar em cada marco. |
| 8 | **Riscos incertos primeiro** (hill chart, Shape Up) | Ciclo (seleção) | Antes do WSJF, puxar o que está "na subida" e trava o caminho crítico. |
| 9 | **Appetite / timebox por passo e por projeto** (Shape Up) | Sentença + ciclo | Cada passo declara um orçamento de tempo/tokens. Se estourar, para e reavalia (*circuit breaker*) em vez de insistir. |
| 10 | **WIP = 1 + pull** (Kanban) | Ciclo | Um passo em andamento. Nada novo até verificar e registrar o atual. |
| 11 | **Revisor independente** (Claude Code, evaluator-optimizer) | Verificação + marcos | Nos marcos, um subagente sem histórico compara entregas x sentença e reporta só lacunas de correção. |
| 12 | **Arquivo de progresso curto + leitura obrigatória ao retomar** (context engineering, harness) | Ciclo + retomada | Sentença enxuta + "estado atual" de 5–10 linhas. Toda retomada começa lendo-o e rodando um check rápido de sanidade. |
| 13 | **Anti-sycophancy** | Fase de conhecimento + verificação | Toda recomendação traz a alternativa mais forte e o motivo de rejeição. Quando o humano corrige, o agente checa antes de aceitar. Proibido "concordo" sem evidência. |
| 14 | **AAR curto por marco** (Exército dos EUA) | Marcos + encerramento | As quatro perguntas, em 5 linhas, em cada marco, não só no fim. |
| 15 | **Lições empurradas para o ponto de uso** (NASA LLIS) | Encerramento | Cada lição vira mudança concreta: regra na skill, item de checklist ou default de pergunta. Lição sem destino é descartada. |

Duas práticas de apoio: **condições de parada** (limite de turnos/gasto, ações irreversíveis) já estão no design e devem ser mecanismo (hook ou permissão), não só texto. **Simplicidade proporcional:** um "modo leve" para projetos pequenos (lição Böckeler/Kiro).

---

## C2. Onde as evidências desafiam o design atual

1. **Risco de cascata.** "Listar todos os passos e dependências" antes de executar contraria o rolling-wave, o Cynefin (em domínio complexo o plano completo é ficção) e a própria premissa de que o humano não domina o domínio. A sentença tende a cristalizar ignorância. **Proposta:** a sentença fixa *resultado, DoD, tolerâncias e restrições*. O plano de passos é **revisável** dentro das tolerâncias sem aditamento. Aditamento fica só para mudanças em resultado, DoD ou tolerâncias.

2. **WSJF é a ferramenta errada como critério principal para um projeto individual com dependências.** O WSJF nasceu para portfólios com muitas filas independentes. Aqui há:
   - um único fluxo;
   - dependências fortes;
   - estimativas ruins, porque o humano não domina o domínio;
   - divisão de escalas ordinais, que é frágil.

   Ele também empurra para depois os itens grandes e incertos, o oposto do conselho do Shape Up. **Proposta:** ordem lexicográfica: (a) desbloqueia o caminho crítico → (b) maior incerteza/risco ("subida") → (c) WSJF/CD3 como desempate. Usar Fibonacci grosseiro e não exibir números com falsa precisão.

3. **Uma pergunta por vez tem custo.** Para o humano, cada pergunta é uma interrupção e uma espera, e várias perguntas independentes em série multiplicam o lead time. A própria documentação do Claude Code descreve a entrevista como "multiple-choice questions" até fechar a spec, sem exigir uma por vez. Não encontrei estudo que compare uma-por-vez com perguntas em lote. **Proposta:** uma por vez **apenas quando a resposta muda as perguntas seguintes**. Perguntas independentes e de baixo impacto vão em lote de 2–4, com default pré-marcado. Também vale contar as perguntas e pedir: "responda só as que discordar".

4. **Perguntar o que o agente poderia descobrir.** Num domínio que o humano não domina, perguntar "qual biblioteca/norma/abordagem?" é transferir ao humano uma decisão que ele não sabe tomar, o que alimenta a sycophancy ao contrário. **Proposta:** perguntar ao humano só **preferências, valores, restrições e fatos que só ele conhece**. Questões técnicas viram pesquisa ou spike com recomendação registrada.

5. **"Verificar contra os critérios" pelo mesmo agente que executou é fraco.** O MAST e o harness da Anthropic mostram que as falhas dominantes são vitória prematura e verificação incompleta. A autoverificação sofre do mesmo viés de quem fez. **Proposta:** evidência obrigatória em todo passo e revisor independente nos marcos. Quando não houver check automatizável (domínios não-código), exigir pelo menos um teste de "olho humano" em cada marco.

6. **Sentença como documento único e crescente leva a context rot.** Se tudo ("registra na sentença") vai para o mesmo arquivo, ele incha e perde sinal. **Proposta:** separar (a) sentença (estável, curta), (b) estado/progresso (curto, reescrito) e (c) log histórico (append-only, lido só sob demanda).

7. **Os limiares de incidente precisam de critério objetivo.** Classificar pequeno/médio/grande "a olho" é inconsistente. **Proposta:** ligar a classificação às tolerâncias (item 3 de C1). Grande = atinge resultado/DoD ou estoura tolerância. Médio = muda o plano sem estourar. Pequeno = resolvido dentro do passo.

8. **A analogia jurídica tem um limite.** No processo civil, a sentença transita em julgado. Num domínio desconhecido, o conhecimento chega *durante* a execução. Vale explicitar que a sentença é "título executivo provisório": tem força para guiar, mas é revisável pelo rito do aditamento.

---

## C3. Métricas para saber se o workflow é performante

Para cada projeto, registrar na sentença/log. Agregar entre projetos para calibrar a skill. Lembrete do estudo METR: **medir, não perguntar se "pareceu rápido"**.

**Fluxo (Kanban/DORA adaptados)**
- *Lead time total* (abertura → encerramento) e *tempo até a sentença* (custo da fase de conhecimento como % do total; alvo indicativo de 10–25%, sem fonte, a calibrar).
- *Cycle time por passo* e *aderência ao appetite* (% de passos dentro do orçamento).
- *Flow efficiency*: tempo trabalhando ÷ tempo total. As esperas pelo humano entram como fila.
- *Throughput*: passos verificados por sessão/dia.

**Qualidade da execução**
- *First-pass yield*: % de passos que passam na verificação na primeira tentativa.
- *Taxa de falso "pronto"*: passos marcados como feitos e depois reabertos, ou com defeito achado pelo humano. É a métrica mais importante contra vitória prematura. Alvo: tendência a zero.
- *Cobertura de evidência*: % de passos "feitos" com artefato de verificação anexado (alvo 100%).
- *Change failure rate* (DORA, https://dora.dev): % de entregas que causaram incidente.

**Qualidade do conhecimento/planejamento**
- *Taxa de aditamento*: aditamentos por projeto e % de passos afetados. Alta indica fase de conhecimento rasa. Zero com muitos incidentes médios indica rigidez escondida.
- *Premissas invalidadas*: % dos defaults ("assume o resto") que precisaram ser revertidos.
- *Riscos do pre-mortem que se materializaram* x *incidentes não previstos*.
- *Volatilidade do plano*: passos adicionados ou removidos após a sentença.
- *Precisão da estimativa*: real ÷ estimado por passo, para calibrar o WSJF/appetite.

**Carga sobre o humano**
- *Interrupções por hora de trabalho do agente* e *tempo humano total gasto*.
- *Perguntas na fase de conhecimento* e *% respondidas com o default*. Se mais de 80% aceitam o default, pergunta-se demais.
- *Paradas que se mostraram desnecessárias*: o humano aprova sem mudar nada. Isso calibra os gatilhos de parada.

**Incidentes**
- Contagem por classe, *tempo de recuperação* (MTTR) e % de incidentes grandes detectados pelo agente (versus pelo humano).

**Aprendizado (encerramento)**
- *Lições convertidas em mudança* (regra, checklist, default) ÷ lições registradas.
- *Reuso*: em projetos seguintes, quantas vezes uma lição/regra foi acionada.

**Resultado (qualitativo)**
- O resultado final atende à DoD original ou aditada? Sim/parcial/não, com o motivo.
- Satisfação do humano (1–5) e confiança no resultado: "colocaria isso em produção sem revisar?"
- Clareza percebida: o humano consegue explicar em 3 frases o que foi feito e por quê?

Painel mínimo recomendado (5 indicadores): **lead time**, **taxa de falso "pronto"**, **interrupções por hora**, **taxa de aditamento** e **lições convertidas em mudança**.

---

*Limitações: PMBOK 7, PRINCE2 e o Spec Kit foram checados por fontes secundárias. O número exato de modos no MAST e o caráter "obrigatório" de partes do Shape Up (circuit breaker) devem ser confirmados nos textos originais. Os alvos numéricos das métricas são sugestões a calibrar, sem base empírica.*
