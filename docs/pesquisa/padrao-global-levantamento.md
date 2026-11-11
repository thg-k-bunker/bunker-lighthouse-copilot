# Padrão global de levantamento

O que um profissional muito eficiente (arquiteto de solução, consultor, dev sênior, projetista) faz toda vez antes de executar, para que a execução rode sem retrabalho. Vale para qualquer tipo de trabalho; a Metax entra só como exemplo do que cada item teria pegado.

**Status:** proposta para a fase de conhecimento da Lighthouse, aguardando decisão do Thiago. Escrita em 11/11/2026 pela aba "Boas práticas + case Metax", respeitando as decisões de [`../decisoes.md`](../decisoes.md): entendimento em 3 ou 4 linhas, uma pergunta por vez com recomendação, mapa do terreno só sob demanda, checagem de cobertura antes do catch.

Evidências completas, com níveis e fontes: [`levantamento-evidencias.md`](levantamento-evidencias.md). Níveis: **A** meta-análise ou experimento controlado; **B** grande estudo observacional ou experimento de campo; **C** caso ou survey; **D** norma ou opinião de especialista.

## Por que o levantamento decide o projeto

- **O problema número 1 de requisitos é o requisito incompleto ou oculto**, seguido de falha de comunicação com o cliente e de alvo que muda no meio. Ele leva a estouro de prazo, retrabalho e baixa qualidade. Uma das causas citadas é a **falta de checagem de completude**. (NaPiRE, 228 empresas em 10 países, B)
- **A completude depende mais de quando o analista decide parar do que da experiência dele.** Quem para por sensação ("já entendi") para cedo demais. (Pitts e Browne, 2004, B)
- **Não usamos o argumento "corrigir depois custa 100 vezes mais".** A origem dessa curva não se sustenta, e um estudo de 171 projetos não achou o efeito. O argumento certo é frequência e tipo de falha, não um multiplicador. (Bossavit; Menzies et al., 2017, B)

## Os 11 movimentos

| # | Movimento | Pergunta que responde | Sai com | Evidência |
|---|---|---|---|---|
| 1 | **Ler tudo antes de perguntar.** Transcrição, e-mails, proposta, material colado. Separar fato, opinião e solução já imaginada | O que já sabemos sem incomodar ninguém? | Lista de fontes, com trechos | Reler a transcrição com outros olhos acha ambiguidades que o entrevistador não viu (Ferrari, C) |
| 2 | **Devolver o entendimento em 3 ou 4 linhas** e pedir confirmação | Entendi o problema, e não só a solução pedida? | Entendimento confirmado | Confirmar o resultado da elicitação (BABOK, D); falha de comunicação é o 2º problema mais citado (NaPiRE, B) |
| 3 | **Ancorar o resultado e quem decide.** Que número muda, para quem, até quando; quem aprova, quem paga, quem usa | Para que serve, e quem diz que ficou pronto? | Objetivo com métrica e mapa de decisão (um decisor) | Quatro riscos de Cagan (D); envolvimento só ajuda com papel claro (Bano e Zowghi, revisão de 87 estudos, A) |
| 4 | **Separar problema de solução.** Para "quero um campo X", perguntar que decisão ou trabalho ele serve | O pedido é a melhor forma de resolver o problema? | Resultado, oportunidade, solução | Não separar requisito de solução está entre as causas de fracasso (NaPiRE, B) |
| 5 | **Mapear o processo real, não o descrito.** Pedir o último caso concreto do começo ao fim; ver a tela ou o log quando der | Como o trabalho acontece de verdade, com as exceções? | Fluxo "como é", com atores, canais, exceções e volumes | Perguntar o comportamento passado, não a opinião (The Mom Test, D); ir ver onde o trabalho acontece (Gemba, contextual inquiry, D) |
| 6 | **Inventariar dados e ambiente.** O que existe, quanto, em que estado, quem é dono; automações, integrações e credenciais com seus donos | Em que terreno vamos construir? | Perfil dos dados e inventário técnico | Perfil de dados antes do escopo (DAMA-DMBOK, D); descoberta da org Salesforce em 4 domínios (Salesforce, 2026, D) |
| 7 | **Rodar a checagem de cobertura** (lista abaixo). Cada lacuna vira pergunta, premissa com dono ou fora de escopo | O que todo trabalho deste tipo precisa ter e ainda não tem? | Checklist marcado | Falta de checagem de completude como causa (NaPiRE, B); um entrevistador LLM sozinho pegou só ~74% dos requisitos (LLMREI 2025, C) |
| 8 | **Perguntar uma coisa por vez,** com opções e recomendação, primeiro o que muda escopo ou arquitetura | Qual decisão falta, e qual recomendamos? | Registro de decisões: pergunta, opções, escolha, quem decidiu, data | Entrevista conversacional rendeu respostas melhores que formulário (Xiao 2020, B); entrevista estruturada entre as técnicas mais eficazes (Davis 2006, A) |
| 9 | **Escrever cada item de forma verificável.** Critério de aceite por item; caminho de erro ("se isto falhar, então…"); não-funcionais pela ISO 25010 | Como vamos testar juntos que está pronto? | Itens com critério de aceite e fora de escopo explícito | ISO 29148, Volere, EARS (D) |
| 10 | **Estimar por referência e expor a incerteza.** Faixa (mínimo, provável, máximo), comparada com trabalho parecido; esforço nosso separado de espera pelo cliente | Quanto leva, e o que pode mudar isso? | Estimativa em faixa, premissas e a maior incerteza com o plano para resolvê-la | Estimativa por especialista melhora com dado histórico e checklist (Jørgensen, A/B); falácia do planejamento (Buehler, B) |
| 11 | **Aplicar a regra de parada e emitir a sentença** (o catch) | Já dá para executar sem nova pergunta de negócio? | A sentença | Regra de parada explícita (Pitts e Browne, B) |

Incerteza de ferramenta ou de técnica que não se resolve perguntando (exemplo: "o Journey Builder junta ramos?") vira um teste curto antes do desenho, e o resultado entra na sentença.

## Duas regras de honestidade para o Claude

- **Toda inferência cita o trecho da fonte ou leva o rótulo "premissa".** Num estudo de 2026, cerca de 1 em cada 4 requisitos "latentes" que o LLM inferiu não foi julgado útil por especialistas (LENS, C).
- **Toda recomendação vem com o motivo e com a alternativa mais forte.** Assistentes tendem a concordar com quem pergunta, inclusive contra a resposta certa (Sharma et al., Anthropic, B). No levantamento, o risco é confirmar a solução que o cliente já trouxe.

## Checagem de cobertura

**O** = obrigatório em todo trabalho. **T** = depende do tipo. Cada item termina **respondido**, **assumido** (premissa com dono e prazo para confirmar) ou **fora de escopo**. Nenhum fica em branco. Entre parênteses, o que o item teria pegado na Metax.

### Objetivo e valor
- **O** Que problema de negócio isso resolve, e o que acontece se nada for feito?
- **O** Que número deve mudar, e quanto?
- **O** Até quando precisa estar funcionando, e por que nessa data? *(go-live prometido para 01/07 contra uma estimativa de 30 a 45 dias)*
- **O** Como vamos saber, um mês depois, que deu certo?
- **O** O cliente declarou algum objetivo próprio (aprender, ganhar autonomia)? Ele será atendido? *(o objetivo de aprendizado do Raphael ficou fora do que foi construído)*

### Usuários e processo real
- **O** Quem vai usar no dia a dia? Quantas pessoas, em que papel?
- **O** Qual foi o último caso real, do começo ao fim? Quem fez o quê?
- **O** O que dá errado hoje, e com que frequência?
- **O** Quais são as exceções, o caso estranho que acontece uma vez por mês?
- **O** Por onde as pessoas realmente falam com o cliente e trabalham fora do sistema (WhatsApp, e-mail pessoal, telefone, planilha)? *(#34, #35 e #38, descobertas com a integração no ar)*
- **O** Alguma fala de especialista ainda não virou item escrito? *(o tensor, explicado em 01/07 e ausente da proposta)*

### Dados
- **O** De onde vêm os dados, quem é o dono e quanto volume tem?
- **O** Em que estado estão: duplicados, campos vazios, formatos diferentes, tamanhos de campo? *(base de clientes suja; #25, campo curto que derrubaria a carga; #37, e-mail repetido)*
- **T** Precisa migrar histórico? De quanto tempo?
- **O** Tem dado pessoal? Qual a base legal na LGPD, quem pode ver, por quanto tempo guardamos?

### Ambiente, integrações e donos
- **O** Que sistemas e ferramentas já existem e serão tocados?
- **O** O que o escopo liga ou desliga, e em que estado isso está hoje? *(NPX dado como desativado, ainda quebrando a sandbox em 29/09)*
- **O** Quem tem acesso e credencial de cada sistema, e quem libera?
- **O** Depois da entrega, em nome de quem ficam jobs, integrações e credenciais? *(#33: a carga parou em 05/11 quando o usuário de terceiro foi desativado)*
- **T** Que automações já rodam e podem conflitar?
- **T** O que acontece se a integração cair: quem é avisado e o que se refaz?

### Restrições
- **O** Qual o orçamento ou limite de horas, e como as horas são consumidas? *(disputa sobre o que o presencial cobria)*
- **O** Há regras legais, contratuais ou de compliance?
- **T** Há padrão de marca, linguagem ou identidade visual?
- **T** Há janela de implantação, congelamento ou dependência de outro projeto?

### Não-funcionais
- **O** Quem não pode ver o quê (segurança e perfis)?
- **T** Quão rápido precisa responder, e com quantos usuários ao mesmo tempo?
- **T** Precisa funcionar no celular, em outro idioma, com acessibilidade?
- **T** Que disponibilidade é aceitável, e quem dá suporte depois?

### Pessoas e decisão
- **O** Quem decide o escopo e quem assina o aceite? Uma pessoa. *(o aceite formal nunca veio)*
- **O** Quem paga, e é a mesma pessoa que decide? *(decisor comercial só mapeado em 20/10)*
- **O** Quem pode travar o projeto se não for ouvido (TI, jurídico, diretoria)?
- **O** Quem responde às dúvidas, e em quanto tempo?

### Aceite e fora de escopo
- **O** Como vamos testar cada item juntos para dizer "está pronto"?
- **O** Todo item listado tem esforço estimado e critério de aceite? *(13 itens "incluídos" com 0 h)*
- **O** O que fica explicitamente fora desta entrega, e o que acontece com pedidos depois do aceite?
- **O** Em que ordem as partes acontecem? *(a proposta não definia a ordem entre Bloco 1, presencial e Bloco 2)*

### Riscos e incertezas
- **O** O que precisa ser verdade para isso funcionar?
- **O** Qual a maior incerteza hoje, e como a resolvemos primeiro? *(Journey Builder não junta ramos; desenho refeito 3 vezes)*
- **O** Do que dependemos do cliente (acesso, dado, aprovação), e até quando?
- **O** Os quatro riscos estão cobertos: vão usar, conseguem usar, dá para construir, faz sentido para o negócio?

### Extras por tipo de trabalho
- **CRM e Salesforce:** edição e licenças; objetos, campos e automações que já existem no objeto e quem mais escreve em cada campo; perfis e permission sets; regra de duplicidade; sandbox disponível; quem é o admin; relatórios e painéis que dependem do que vamos mudar; acessos e permissões prontos 48 h antes de presencial ou demo; adoção e treinamento.
- **Integração:** origem e destino de cada dado; tempo real ou lote; volume e pico; dono da API e da credencial; tratamento de erro e reenvio; limites de chamadas; ambiente de teste do outro lado.
- **Site:** público e ação principal esperada; quem produz o conteúdo; domínio, hospedagem e acessos; conteúdo e SEO a preservar; para onde vão os formulários; cookies e LGPD; métricas.
- **Documento ou relatório:** quem lê e que decisão toma com ele; de onde vem cada número e de que período; formato e frequência; quem valida antes de circular; o que não pode aparecer.

## Regra de parada

O levantamento acabou quando as seis condições valem:

1. **Cobertura fechada:** todo item O e todo T aplicável está respondido, assumido ou fora de escopo.
2. **Quatro riscos tratados:** cada um com uma frase de evidência ou com a premissa a testar.
3. **Saturação:** as duas últimas perguntas ou fontes não trouxeram nada que mude o escopo.
4. **Decisor confirmou** o entendimento e o fora de escopo.
5. **Teste do executor:** alguém que não participou consegue estimar em faixa e começar sem nova pergunta de negócio.
6. **Maior incerteza nomeada,** com o plano para resolvê-la primeiro. É ela que abre o caminho crítico da execução.

**Proporção:** em trabalho pequeno e fácil de desfazer, uma premissa explícita vale mais que mais uma pergunta. Em trabalho caro de desfazer (modelo de dados, integração, migração), pergunta-se até a saturação.

## Antipadrões

| Antipadrão | Por que evitar |
|---|---|
| Aceitar a solução como requisito ("quero um campo") | Causa de fracasso no NaPiRE (B) |
| Perguntar opinião ou futuro ("vocês usariam?") | As pessoas descrevem o trabalho diferente de como o fazem (Mom Test, D) |
| Formulário com 20 perguntas de uma vez | Mais abandono e respostas piores (Couper 2013, Xiao 2020, B) |
| Parar por sensação ("já entendi") | Pitts e Browne (B) |
| Tratar inferência do LLM como fato | ~1 em 4 inferências não foi útil (LENS, C); bajulação (Sharma, B) |
| Ninguém decide, ou decide muita gente | Gera alvo móvel (NaPiRE, B) |
| Escopo sem fora de escopo e sem critério de aceite | O aceite vira opinião no fim (ISO 29148, Volere, D) |
| Estimar sem abrir o ambiente e os dados | Descoberta da org antes de construir (Salesforce, D) |
| Prometer data única e misturar esforço com espera pelo cliente | Jørgensen (A/B); na Metax, o calendário foi dominado pela espera do cliente |
| Começar a construir antes da sentença | Na Metax, o código veio em 28/09 e a especificação em 30/09, sem nunca ser assinada |

## Como medir a qualidade do levantamento

1. **Pergunta tardia:** perguntas de negócio feitas depois da sentença ÷ total de perguntas. Cada uma vira item novo na checagem de cobertura.
2. **Retrabalho por requisito:** horas refeitas por requisito ausente, mal entendido ou mudado ÷ horas de execução, separando "não perguntamos" de "o cliente mudou de ideia".
3. **Cobertura na emissão:** % dos itens respondidos (e não só assumidos) quando a sentença sai, e % das premissas que se confirmaram depois.
4. **Mudança de escopo depois da sentença:** pedidos de mudança ÷ itens da sentença.
5. **Erro de estimativa e espera:** real ÷ estimado, e % do prazo gasto esperando o cliente. Com o tempo, vira a base de referência da Bunker.

## O que a pesquisa não provou

- Não há estudo que compare diretamente "uma pergunta por vez, com opções e recomendação" contra perguntas em lote, no contexto de requisitos. A evidência vizinha (entrevista conversacional melhor que formulário) favorece a decisão já tomada, mas não a prova.
- O tamanho da diferença entre o que se diz e o que se faz no trabalho não foi medido em fonte confiável; o princípio é consenso.
- Não há guia oficial de descoberta no Salesforce Well-Architected; a referência usada é o blog oficial de jul/2026.
