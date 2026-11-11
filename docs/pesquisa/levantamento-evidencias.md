> Pesquisa da aba "Boas práticas + case Metax" (11/11/2026) que sustenta [`padrao-global-levantamento.md`](padrao-global-levantamento.md). Referência: o que entra na skill é decidido em [`../decisoes.md`](../decisoes.md).

# Padrão Global de Levantamento — pesquisa para a skill Lighthouse

Data: 11/11/2026. Níveis de evidência: **[A]** meta-análise, revisão sistemática ou experimento controlado; **[B]** estudo observacional grande ou experimento de campo; **[C]** caso, survey de fornecedor, estudo pequeno; **[D]** opinião de especialista ou norma. "Não verificado" quer dizer que não consegui confirmar a fonte primária nesta rodada.

---

## 1. O que a evidência diz

### 1.1 Requisitos como fonte de retrabalho, e o mito do "100x"

- **NaPiRE** (Méndez Fernández et al., *Empirical Software Engineering* 22(5), 2017; 228 empresas, 10 países) **[B]**. Os problemas mais citados: (1) requisitos incompletos ou ocultos, (2) falhas de comunicação entre o time e o cliente, (3) alvos móveis (objetivo, processo ou requisito que muda), (4) requisitos vagos demais, (5) falta de tempo. Na lista dos que mais levam a fracasso também aparecem "stakeholder que não separa requisito de solução já imaginada", "pouco apoio do cliente" e "acesso fraco à necessidade de negócio". Requisito incompleto é o único problema que fica no top 3 em todos os grupos. Ele leva sobretudo a estouro de prazo (~10% das citações de efeito), retrabalho depois da implementação (~9%) e baixa qualidade do produto (~9%). Entre as causas citadas estão pouca qualificação ou experiência de quem levanta, pressão de prazo, técnica de elicitação fraca, requisito escrito de forma abstrata demais e **falta de checagem de completude** (~4% cada). Isso sustenta a "checagem de cobertura" da Lighthouse. Os autores concluem que as causas principais são organizacionais e sociais, não falta de template.
- **A curva de Boehm ("corrigir em produção custa 100x")** não tem boa sustentação. Bossavit (*The Leprechauns of Software Engineering*, Leanpub) refaz o caminho das citações até notas de curso internas da IBM citadas por Pressman (1987), com dados que no máximo vão até 1981; um dos estudos citados aponta até na direção oposta **[D, análise bibliográfica]**. Menzies, Nichols, Shull e Layman ("Are delayed issues harder to resolve?", *EMSE* 22(4), 2017; 171 projetos, 2006–2014) **não encontraram efeito de atraso**: resolver um problema numa fase posterior não custou de forma consistente nem substancial mais esforço **[B]**. **Use assim:** o argumento a favor do levantamento é *frequência e tipo* de falha (NaPiRE), e não um multiplicador mágico de custo. Não cite "100x".
- **Afirmações a evitar.** CHAOS/Standish ("só X% dos projetos dão certo"): definições e amostra opacas, criticadas por Eveleens & Verhoef (IEEE Software, 2010) **[C]**. "70% dos projetos de CRM fracassam" e números parecidos atribuídos ao Gartner: **não verificado**, sem fonte primária localizada.
- **Hofmann & Lehner** (IEEE Software 18(4), 2001) **[C]**: o resumo diz que requisito inadequado é a maior causa isolada de fracasso. Os detalhes da amostra e o esforço relativo em levantamento nos projetos de sucesso ficam **não verificados** (não li o texto completo).
- **Bano & Zowghi** (*IST*, 2015; revisão de 87 estudos, 1980–2012) **[A]**: em 52 estudos o envolvimento do usuário contribuiu positivamente, em 12 negativamente e em 23 o resultado foi incerto. A relação não é direta e depende de como o envolvimento é conduzido: envolver não basta, é preciso envolver com papel claro.

### 1.2 Técnica, experiência e quando parar

- **Davis, Dieste, Hickey, Juristo & Moreno** (IEEE RE 2006, revisão sistemática) **[A, com ressalva]**: a **entrevista, de preferência estruturada**, está entre as técnicas mais eficazes. Card sorting, ranking e thinking aloud renderam menos. A experiência do analista **pareceu pesar pouco**, e as representações intermediárias não mostraram efeito. Os próprios autores avisam que os estudos de base não foram replicados.
- **Pitts & Browne** (*JMIS* 21(1), 2004; 54 analistas) e **Browne & Pitts** (*OBHDP* 95, 2004) **[B, laboratório]**: o que explica a quantidade e a completude dos requisitos é a **regra de parada** que o analista usa, mais do que a experiência dele. Analistas param cedo demais por limite cognitivo. **Use assim:** parar o levantamento é decisão de método, explícita, e não sensação de "já entendi". (A taxonomia exata das regras, como lista mental ou limiar de magnitude, ficou **não verificada** no texto primário.)
- **Ferrari, Spoletini & Gnesi** (*Requirements Engineering* 21(3), 2016; 34 entrevistas) **[C]**: a ambiguidade na entrevista também serve para revelar conhecimento tácito. No estudo de revisão de entrevistas (RE 2017), um revisor que ouviu a gravação achou ambiguidades que o analista não viu: só ~26% coincidiram. **Use assim:** reler a transcrição depois, com outros olhos (Claude), acha coisas que quem conduziu deixou passar.
- **Saturação**: Hennink et al. (2017) observaram saturação de códigos em ~9 entrevistas e de significado entre 16 e 24 **[C]**. Griffin & Hauser (*Marketing Science*, 1993) são citados como "cerca de 20–30 entrevistas captam ~90% das necessidades" num mercado; o número exato fica **não verificado** na fonte primária. Para um projeto com um cliente, a analogia útil é parar quando novas perguntas ou novas fontes param de trazer itens novos.

### 1.3 Normas e corpos de conhecimento [D]

- **ISO/IEC/IEEE 29148:2018**: características de um requisito individual (necessário, apropriado, sem ambiguidade, completo, singular, viável, verificável, correto, conforme) e de um conjunto (completo, consistente, viável, compreensível, validável). Separa requisitos de stakeholder, de sistema e de software. (Lista conferida no sumário da norma; as definições literais não foram lidas.)
- **IIBA BABOK v3, cap. 4 (Elicitação e Colaboração)**: preparar a elicitação, conduzir, **confirmar os resultados**, comunicar e gerir a colaboração com os stakeholders. Confirmar é uma etapa formal, que bate com o "resumo em 3–4 linhas" da Lighthouse. O **PMI Guide to Business Analysis (2017)** cobre o mesmo ciclo e acrescenta a definição do problema ou oportunidade antes da elicitação.
- **Volere (Robertson & Robertson)**: o "snow card" registra, para cada requisito, a justificativa, a origem e um **critério de ajuste** (fit criterion), isto é, a medida que mostra que o requisito foi atendido. Inclui também satisfação ou insatisfação do cliente, conflitos e prioridade. O template tem seções explícitas de restrições, fatos e premissas, e problemas em aberto.
- **EARS** (Mavin et al., Rolls-Royce, IEEE RE 2009): cinco padrões de frase. Ubíquo ("O sistema deve…"), por evento ("Quando…"), por estado ("Enquanto…"), comportamento indesejado ("Se… então…") e opcional ("Onde houver…"). O padrão de comportamento indesejado obriga a perguntar pelo caminho de erro.
- **ISO/IEC 25010:2023**: nove características de qualidade (adequação funcional, eficiência de desempenho, compatibilidade, capacidade de interação, confiabilidade, segurança da informação, manutenibilidade, flexibilidade e *safety*). A própria norma indica o uso para elicitar requisitos e **checar completude**. É a lista natural de não-funcionais.
- **No que todas concordam (mínimo universal):** (1) objetivo e problema de negócio; (2) quem são os stakeholders e quem decide; (3) processo e contexto de uso reais; (4) requisitos funcionais com critério verificável; (5) não-funcionais por checklist; (6) restrições, premissas e questões em aberto registradas; (7) fora de escopo explícito; (8) confirmação formal com o cliente antes de construir.

### 1.4 Descoberta de produto e serviço [D, salvo indicação]

- **Cagan, quatro riscos** (SVPG; INSPIRED, 2ª ed., 2018): valor (vão usar ou comprar?), usabilidade (conseguem usar?), viabilidade técnica (dá para construir?) e viabilidade de negócio (funciona para o negócio: jurídico, financeiro, marca, operação?).
- **Teresa Torres** (*Continuous Discovery Habits*, 2021): árvore de oportunidade e solução, que liga resultado → oportunidade → solução → teste de premissa. Premissas são listadas e testadas, nunca tratadas como fato.
- **Jobs-to-be-Done** (Christensen; Moesta, entrevista de troca; Ulwick, ODI): pergunte pelo "progresso" que a pessoa quer e pelo último momento em que ela trocou de solução.
- **The Mom Test** (Fitzpatrick, 2013): pergunte sobre **comportamento passado e concreto** ("da última vez que isso aconteceu, o que vocês fizeram?"), nunca opinião ou intenção ("vocês usariam?").
- **Double Diamond** (Design Council, 2005): divergir e depois convergir, primeiro no problema e só então na solução.
- **Event Storming** (Brandolini): mapear eventos de domínio em ordem do tempo com quem faz o trabalho, para expor o processo real e os pontos quentes.
- **Gemba / "ir ver"** (Toyota) e **contextual inquiry** (Beyer & Holtzblatt, 1998): observar o trabalho onde ele acontece. Sobre a diferença entre o que se diz e o que se faz, a evidência quantitativa que achei é fraca ou de fornecedor (DISQO: 28–53% das respostas autodeclaradas contradizem o comportamento observado, conforme a categoria) **[C]**. O princípio é consenso; o tamanho do efeito em contexto de trabalho fica **não verificado**. Process mining (van der Aalst) parte do mesmo princípio: o log mostra o processo como ele roda, e não como foi desenhado **[D]**.

### 1.5 Dados e ambiente (sistemas/CRM)

- **Qualidade de dados**: o Gartner estima que dado ruim custa às organizações pelo menos US$ 12,9 milhões por ano em média (pesquisa de 2020) e que 59% delas não medem a qualidade dos seus dados **[C, survey do fornecedor]**. Fazer o perfil dos dados (volume, campos vazios, duplicados, formatos, origem) antes de fechar o escopo é prática padrão do DAMA-DMBOK **[D]**.
- **Salesforce**: o blog oficial "A Practitioner's Guide to AI-Assisted Org Discovery" (Nava & Ratliff, jul/2026) **[D]** propõe quatro domínios de descoberta numa org madura. (1) Objetos customizados: volume, atividade, campos sem uso, dependências. (2) Automações por objeto: sinalizar objeto com mais de um tipo de automação, ordem de execução, quem escreve em cada campo. (3) Pontos de integração: named credentials, connected apps, Platform Events, CDC, endpoints Apex REST, com volume e frequência. (4) Antipadrões: campo sobrecarregado, código que não aguenta lote, gambiarra entre objetos, excesso de permission sets. O Well-Architected (architect.salesforce.com) serve de referência de qualidade; não achei um guia oficial de *descoberta* dentro dele.

### 1.6 Stakeholders e decisão [D, salvo indicação]

- Mapa de poder × interesse (Mendelow) e RACI/DACI: um único decisor ("A"/"Approver") por decisão. Em venda complexa (MEDDIC), identificar o **comprador econômico**, quem libera o dinheiro, separado de quem usa e de quem influencia.
- Registro de decisões (ADR/decision log): o que foi decidido, por quem, quando e qual alternativa ficou de fora. Ataca diretamente os "alvos móveis" do NaPiRE.
- Critério de aceite combinado e assinado antes de construir (fit criterion da Volere; Given/When/Then do BDD). Fora de escopo escrito (Volere, PMBOK). O NaPiRE aponta "pouco apoio do cliente" e "não separar requisito de solução" entre as causas de fracasso **[B]**.

### 1.7 Estimativa no levantamento

- **Jørgensen** (revisões de estimativa por especialista, 2004/2007; coluna na IEEE Software, 2014) **[A/B]**: a estimativa por especialista domina e a precisão quase não melhorou em décadas. Usar dado histórico (analogia ou **classe de referência**) e checklists melhora a estimativa, e combinar estimativas independentes é robusto.
- **Cone da incerteza**: Little (IEEE Software 23(3), 2006, dados da Landmark Graphics) **[B]** mostrou erro com distribuição lognormal e faixa de erro que **não estreitava** ao longo do projeto. Bossavit critica as origens do cone **[D]**. McConnell responde que o cone é o melhor caso possível, e que projeto mal conduzido vira "nuvem". **Use assim:** a incerteza só cai quando alguém toma uma decisão ou faz uma descoberta, não com a passagem do tempo.
- **Três pontos (PERT)** **[D]**: dar mínimo, provável e máximo. A estimativa deve separar **esforço nosso** de **espera pelo cliente** (acesso, dado, aprovação). Espera é fila e não esforço; tratá-la à parte vem do pensamento de fluxo (Reinertsen) **[D]**.

### 1.8 IA no levantamento

- **LLMREI** (Korn et al., IEEE RE 2025; 33 entrevistas com stakeholder simulado) **[C]**: um entrevistador LLM eliciou ~61% dos requisitos por completo e mais ~13% em parte (recall ~74%). A versão mais metódica às vezes perdia requisito de nicho. Conclusão: o LLM ajuda, mas não substitui a checagem de cobertura.
- **LENS** (Sivakumar et al., AIRE@RE 2026; 12 transcrições industriais) **[C]**: o LLM extraiu requisitos explícitos de transcrições com F1 ~84%. Dos requisitos *latentes* que ele inferiu, ~75% foram julgados úteis por especialistas, ou seja, **~1 em 4 não era**. Cada inferência deve ser **ligada a um trecho da fonte**, como o LENS faz.
- **Revisão sistemática LLM4RE** (arXiv 2509.11446, 74 estudos de 2023–2024) **[A, mapeamento]**: elicitação e validação são os usos mais estudados; a avaliação em dado real ainda é limitada.
- **Bajulação (sycophancy)**: Sharma et al. (arXiv 2310.13548, Anthropic) **[B]** mostraram que cinco assistentes concordavam com o usuário de forma consistente, inclusive contra a resposta correta. **Risco no levantamento:** o modelo confirma a solução que o cliente já trouxe e não contesta premissas. **Mitigação:** a recomendação de Claude precisa vir com o motivo e a alternativa, e toda premissa ganha o rótulo "premissa", não o de fato.
- **Uma pergunta por vez × formulário**: Xiao et al. (ACM TOCHI 27(3), 2020; ~600 participantes, >5.200 respostas) **[B, experimento de campo]**: a pesquisa feita por chatbot conversacional gerou mais engajamento e respostas melhores (mais informativas, relevantes, específicas e claras) do que o formulário Qualtrics. Em pesquisa web, perguntas em **grade** se associam a mais abandono, mais resposta em branco e mais "respostas em linha reta" do que um item por vez (Couper, Tourangeau, Conrad & Zhang, 2013), mas a literatura é **mista** e o item por vez demora mais **[B]**. Não achei estudo que teste diretamente "uma pergunta com opções e recomendação" contra lote em contexto de requisitos (**lacuna**). A inferência é razoável, não comprovada.

---

## 2. (a) O Padrão Global de Levantamento — 10 movimentos

Cada movimento traz: **o que fazer**, a **pergunta que responde**, o **artefato** que gera e a **evidência**.

1. **Ler tudo antes de perguntar.** Ler transcrição, e-mails e material colado; separar fato, opinião e solução já proposta, e anotar ambiguidades. *Pergunta:* o que já sabemos sem incomodar ninguém? *Artefato:* inventário de fontes com trechos citados. *Evidência:* revisão de transcrição acha ambiguidades que o entrevistador não viu (Ferrari 2017) [C]; extração por LLM com rastreio à fonte (LENS) [C].
2. **Devolver o entendimento em 3–4 linhas e pedir confirmação.** *Pergunta:* entendi o problema, e não só a solução pedida? *Artefato:* resumo confirmado. *Evidência:* "confirmar resultados da elicitação" (BABOK) [D]; falha de comunicação com o cliente é o 2º problema mais citado (NaPiRE) [B].
3. **Ancorar o resultado de negócio e quem decide.** Qual número muda, para quem, até quando; quem aprova, quem paga e quem usa. *Artefato:* frase de objetivo com métrica + mapa de decisão (decisor único, influenciadores, usuários). *Evidência:* quatro riscos, com valor e viabilidade de negócio (Cagan) [D]; envolvimento com papel claro (Bano & Zowghi) [A].
4. **Separar problema de solução.** Quando o cliente chega com "quero um campo X", perguntar que decisão ou que trabalho esse campo serve. *Artefato:* árvore curta resultado → oportunidade → solução. *Evidência:* "dificuldade de separar requisito de solução conhecida" está entre as causas de fracasso (NaPiRE) [B]; Torres, JTBD [D].
5. **Mapear o processo real, não o descrito.** Pedir o último caso concreto do começo ao fim, e se possível ver a tela ou o log. *Artefato:* fluxo "como é" com eventos, atores, exceções e volumes. *Evidência:* Mom Test, contextual inquiry, Gemba, Event Storming [D]; diferença entre o que se diz e o que se faz [C].
6. **Inventariar dados e ambiente.** O que existe, quem é dono, quanto volume, qual a qualidade; automações, integrações e credenciais com seus donos. *Artefato:* perfil de dados + inventário técnico (na Salesforce, os 4 domínios). *Evidência:* Gartner [C]; Salesforce Org Discovery [D].
7. **Rodar a checagem de cobertura.** Comparar o rascunho com a lista universal mais a lista do tipo de trabalho (seção 3); cada lacuna vira pergunta, premissa ou fora de escopo. *Artefato:* checklist marcado. *Evidência:* "falta de checagem de completude" como causa de requisito incompleto (NaPiRE) [B]; ISO 25010 indicada para checar completude [D]; recall de ~74% de um LLM sozinho (LLMREI) [C].
8. **Perguntar uma coisa por vez, com opções e recomendação, sobre comportamento passado.** Priorizar as perguntas que mudam o escopo ou a arquitetura. *Artefato:* registro de decisões (pergunta, opções, escolha, quem decidiu, data). *Evidência:* chatbot conversacional melhor que formulário (Xiao 2020) [B]; grade pior que item por vez, com evidência mista (Couper 2013) [B]; entrevista estruturada (Davis 2006) [A]; alvos móveis (NaPiRE) [B].
9. **Escrever requisito verificável e critério de aceite.** Cada item com critério de ajuste; caminho de erro em EARS ("Se… então…"); não-funcionais pela ISO 25010. *Artefato:* lista de requisitos + critérios de aceite + fora de escopo explícito. *Evidência:* ISO 29148, Volere, EARS [D].
10. **Estimar por referência e expor incertezas.** Três pontos, comparação com trabalho parecido já feito, separando esforço nosso de espera pelo cliente; listar a maior incerteza e como resolvê-la. *Artefato:* estimativa em faixa + registro de riscos e premissas. *Evidência:* Jørgensen [A/B]; Little 2006 [B].
11. **Aplicar a regra de parada e emitir a sentença.** *Artefato:* a sentença, com escopo fechado, aceite, fora de escopo, premissas, decisor e data. *Evidência:* regras de parada explícitas (Pitts & Browne) [B].

---

## 3. (b) Checagem de cobertura

**[O]** = obrigatório em todo trabalho. **[T]** = depende do tipo. A resposta a cada item precisa ser **respondida**, **assumida (premissa com dono)** ou **fora de escopo**.

**Objetivo e valor**
- [O] Que problema de negócio isso resolve, e o que acontece se nada for feito?
- [O] Qual número deve mudar, e quanto? (vendas, tempo, erro, retrabalho)
- [O] Até quando precisa estar funcionando, e por quê nessa data?
- [O] Como vamos saber, um mês depois, que deu certo?

**Usuários e processo real**
- [O] Quem vai usar no dia a dia? Quantas pessoas, em que papel?
- [O] Me conta o último caso real, do começo ao fim: quem fez o quê?
- [O] O que dá errado hoje, e com que frequência?
- [O] Quais são as exceções: o caso estranho que acontece uma vez por mês?
- [T] Existe trabalho feito fora do sistema (planilha, WhatsApp, papel)?

**Dados**
- [O] De onde vêm os dados, quem é o dono e quanto volume tem?
- [O] Qual o estado dos dados hoje: duplicados, campos vazios, formatos diferentes?
- [T] Precisa migrar histórico? De quanto tempo?
- [O] Tem dado pessoal? Qual a base legal na LGPD, quem pode ver e por quanto tempo guardamos?

**Ambiente, integrações e donos**
- [O] Que sistemas e ferramentas já existem e serão tocados?
- [O] Quem tem acesso, senha ou credencial de cada um, e quem libera?
- [T] Que automações já rodam e podem conflitar?
- [T] O que acontece se a integração cair: quem é avisado e o que se refaz?

**Restrições**
- [O] Qual o orçamento ou limite de horas?
- [O] Há regras legais, contratuais ou de compliance (LGPD, setor regulado)?
- [T] Há padrão de marca, linguagem ou identidade visual a seguir?
- [T] Há janela de implantação, congelamento ou dependência de outro projeto?

**Não-funcionais (ISO 25010)**
- [O] Quão rápido precisa responder, e com quantos usuários ao mesmo tempo?
- [O] Quem não pode ver o quê (segurança e perfis)?
- [T] Precisa funcionar no celular? Em outro idioma? Com acessibilidade?
- [T] Que nível de disponibilidade é aceitável, e quem dá suporte depois?

**Stakeholders e decisão**
- [O] Quem decide o escopo e quem assina o aceite? (uma pessoa)
- [O] Quem paga, e é a mesma pessoa que decide?
- [O] Quem pode travar o projeto se não for ouvido (TI, jurídico, diretoria)?
- [O] Quem responde às dúvidas, e em quanto tempo?

**Aceite e fora de escopo**
- [O] Como vamos testar cada item juntos para dizer "está pronto"?
- [O] O que fica explicitamente fora desta entrega?
- [O] O que é "bom o suficiente" agora e o que fica para depois?

**Riscos e incertezas**
- [O] O que precisa ser verdade para isso funcionar? (premissas)
- [O] Qual a maior incerteza hoje, e como a resolvemos primeiro?
- [O] Do que dependemos do cliente (acesso, dado, aprovação), e até quando?
- [O] Os quatro riscos foram cobertos: vão usar, conseguem usar, dá para construir, faz sentido para o negócio?

**Extras por tipo**
- *CRM/Salesforce:* qual edição e quais licenças; que objetos, campos e automações já existem neste objeto (e quem mais escreve neste campo); quais perfis e permission sets; regra de duplicidade; ambiente de teste (sandbox) disponível; quem é o admin; relatórios e painéis que dependem do que vamos mudar; adoção e treinamento.
- *Integração:* qual o sistema de origem e qual o de destino, para cada dado; tempo real ou em lote; volume e pico; quem é dono da API e da credencial; o que fazer com erro e reenvio; limites de chamadas; ambiente de homologação do outro lado.
- *Site:* público-alvo e ação principal esperada; quem produz o conteúdo; domínio, hospedagem e acessos; SEO e conteúdo atual a preservar; formulários e para onde vão os leads; cookies e LGPD; métricas (analytics).
- *Documento/relatório:* quem lê e que decisão toma com ele; de onde vem cada número e qual o período; formato e frequência; quem valida os números antes de circular; o que não pode aparecer (dado sensível, preço).

---

## 4. (c) Regra de parada

O levantamento está suficiente quando **todas** as condições abaixo valem:

1. **Cobertura fechada:** todo item [O] e todo [T] aplicável está respondido, assumido (premissa com dono e prazo de confirmação) ou fora de escopo. Não sobra item em branco. *(Pitts & Browne: regra explícita no lugar de sensação [B]; NaPiRE: falta de checagem de completude [B])*
2. **Quatro riscos tratados:** valor, usabilidade, viabilidade técnica e de negócio, cada um com uma frase de evidência ou com a premissa a testar. *(Cagan [D])*
3. **Saturação:** as duas últimas perguntas ou fontes não trouxeram nenhum requisito, exceção ou restrição nova que mude o escopo. *(Hennink 2017; Griffin & Hauser [C])*
4. **Decisor confirmou:** o resumo e o fora de escopo foram aceitos pela pessoa que assina. *(BABOK, confirmar resultados [D])*
5. **Teste do executor:** alguém que não participou consegue estimar em faixa e começar a executar sem nova pergunta de negócio. As dúvidas que sobram são só técnicas e internas.
6. **Maior incerteza nomeada** junto com o plano para resolvê-la primeiro, o que liga ao caminho crítico.

Regra de proporcionalidade: em trabalho pequeno e reversível, uma premissa explícita vale mais que mais uma pergunta. Em trabalho caro de desfazer (modelo de dados, integração, migração), pergunte até ter saturação.

---

## 5. (d) Antipadrões

- **Aceitar a solução como requisito** ("quero um campo"), sem perguntar a que decisão ela serve. NaPiRE: a dificuldade de separar requisito de solução leva a fracasso [B].
- **Perguntar opinião ou futuro** ("vocês usariam?") em vez do último caso real. Mom Test [D]; diferença entre o que se diz e o que se faz [C].
- **Formulário-lote** com 20 perguntas de uma vez. Grade e lote rendem mais abandono e menos qualidade (Couper 2013 [B]; Xiao 2020 [B]).
- **Parar por sensação** ("já entendi"). Pitts & Browne [B].
- **Confiar no LLM como fonte**: requisito "latente" inventado e bajulação. ~25% das inferências latentes não foram úteis (LENS [C]); Sharma 2023 [B]. Toda inferência precisa de trecho da fonte ou do rótulo "premissa".
- **Ninguém decide ou decide muita gente**, gerando alvos móveis. NaPiRE [B].
- **Escopo sem fora de escopo e sem critério de aceite**: o aceite vira opinião no fim. Volere, ISO 29148 [D].
- **Não abrir o ambiente** (org, dados, integrações) antes de estimar. Salesforce Org Discovery [D]; Gartner [C].
- **Vender o levantamento com "100x" ou CHAOS**: argumento frágil, que um cliente técnico derruba. Menzies 2017 [B]; Bossavit [D].
- **Estimar um número só** e misturar esforço com espera pelo cliente. Jørgensen [A/B]; Little 2006 [B].

---

## 6. (e) Cinco métricas de qualidade do levantamento

1. **Taxa de pergunta tardia:** perguntas de negócio feitas *depois* da sentença ÷ total de perguntas. Meta: perto de zero; cada uma vira lição para a checagem de cobertura.
2. **Retrabalho por requisito:** horas refeitas por requisito ausente, mal entendido ou mudado ÷ horas totais de execução, classificadas por causa no formato NaPiRE (incompleto, comunicação, alvo móvel).
3. **Cobertura na emissão:** % de itens [O]+[T] respondidos (e não assumidos) quando a sentença é emitida. Acompanhar também o % de premissas que se confirmaram depois.
4. **Mudança de escopo pós-sentença:** número de pedidos de mudança ÷ itens da sentença, separando "o cliente mudou de ideia" de "nós não perguntamos".
5. **Erro de estimativa e espera:** estimativa real ÷ estimada (na faixa de três pontos) e % do prazo gasto esperando o cliente. Com o tempo, isso alimenta a base de classe de referência da Bunker.

---

## Fontes principais

- Méndez Fernández et al., NaPiRE, EMSE 2017 — https://arxiv.org/abs/1611.10288
- Menzies, Nichols, Shull, Layman, EMSE 2017 — https://arxiv.org/abs/1609.04886
- Bossavit, *The Leprechauns of Software Engineering* — https://leanpub.com/leprechauns ; The Register, 2021 — https://www.theregister.com/2021/07/22/bugs_expense_bs/
- Davis et al., RE 2006 — DOI 10.1109/RE.2006.17
- Pitts & Browne, JMIS 2004 — https://jmis-web.org/articles/775 ; Browne & Pitts, OBHDP 2004, DOI 10.1016/j.obhdp.2004.05.001
- Hofmann & Lehner, IEEE Software 2001 — DOI 10.1109/MS.2001.936219
- Bano & Zowghi, IST 2015 — https://opus.lib.uts.edu.au/bitstream/10453/32295/1/Accepted%20IST%20manuscript.pdf
- Ferrari, Spoletini, Gnesi, REJ 2016 — DOI 10.1007/s00766-016-0249-3
- Hennink & Kaiser 2022 — https://pubmed.ncbi.nlm.nih.gov/34785096/ ; Griffin & Hauser 1993 — DOI 10.1287/mksc.12.1.1
- ISO/IEC/IEEE 29148:2018 (sumário) — https://cdn.standards.iteh.ai/samples/72089/62bb2ea1ef8b4f33a80d984f826267c1/ISO-IEC-IEEE-29148-2018.pdf ; ISO/IEC 25010:2023 — https://www.iso.org/standard/78176.html
- EARS — https://en.wikipedia.org/wiki/Easy_Approach_to_Requirements_Syntax
- Cagan, riscos — https://svpg.com/product-risk-taxonomies
- Salesforce, Org Discovery (2026) — https://www.salesforce.com/blog/ai-assisted-salesforce-org-discovery-map-before-you-build/
- Gartner, qualidade de dados — https://www.gartner.com/en/data-analytics/topics/data-quality
- Little, IEEE Software 2006 — DOI 10.1109/MS.2006.82 ; Jørgensen — https://www.simula.no/research/review-studies-expert-estimation-software-development-effort
- LLMREI, RE 2025 — https://arxiv.org/abs/2507.02564 ; LENS, AIRE 2026 — https://arxiv.org/abs/2606.25867 ; SLR LLM4RE — https://arxiv.org/abs/2509.11446
- Sharma et al., sycophancy — https://arxiv.org/abs/2310.13548
- Xiao et al., TOCHI 2020 — https://arxiv.org/abs/1905.10700 ; Couper et al., SSCR 2013 — DOI 10.1177/0894439312469865
- DISQO, diferença entre o que se diz e o que se faz — https://newsroom.disqo.com/news/study-consumers-misreport-journey
