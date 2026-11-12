# Checagem de cobertura

Roda antes do catch. Responde a uma pergunta: o que todo trabalho deste tipo precisa ter e ainda não tem?

Funciona para qualquer projeto em três camadas: **(1)** as perguntas universais, que valem para todo trabalho; **(2)** as lentes pela natureza do trabalho, que todo projeto combina; **(3)** os itens do especialista do domínio, gerados na hora. A profundidade de cada camada segue o perfil do projeto (`perfil-do-projeto.md`).

## Rastreio da origem

Tudo o que vai ser requisito leva a fonte e o grau de confiança:

| Confiança | Quando |
|---|---|
| visto | conferido no ambiente, no dado ou na tela |
| dito por quem faz | quem executa o trabalho no dia a dia disse |
| dito por gestor | quem gerencia disse, sem ver na prática |
| só documentado | está num documento, e ninguém confirmou |
| inferido | conclusão do Claude, marcada como premissa |

Decisão que alguém de fora já tomou, como uma arquitetura ou um prazo, entra como restrição, com a fonte, e quem conduz a confirma no entendimento. Quando duas fontes discordam, o conflito é levado a quem conduz como pergunta, e a versão mais conveniente nunca é escolhida por conta própria.

## Regras da checagem

- **O** é obrigatório em todo trabalho. **T** depende do tipo.
- Primeiro procurar a resposta no material que já existe. O padrão é responder pelo material ou assumir. Só vai para a fila de perguntas o que muda escopo, custo ou risco.
- Item técnico que quem conduz não domina é verificado pelo Claude, no ambiente ou na documentação, com a recomendação registrada.

Situação de cada item:

| Situação | Quando |
|---|---|
| respondido | o material responde, com o trecho |
| respondido em parte | o material responde uma parte; o resto segue em outra situação |
| assumido | premissa, confirmada em bloco no catch. Inclui a recomendação de desenho que o Claude propõe |
| verificado | o Claude conferiu no ambiente ou na documentação |
| em verificação | o Claude ainda vai conferir |
| pergunta | está na fila para quem conduz |
| fora de escopo | decidido que não entra |
| não se aplica | item **T**, ou lente, que não vale para este trabalho |
| condicional | lente ou item que só entra se uma resposta pedir |

Na emissão da sentença, nenhum item fica em "pergunta" ou "em verificação".

## Camada 1: perguntas universais

### Objetivo e valor
- **O** Que problema de negócio isso resolve, e o que acontece se nada for feito?
- **O** Que número ou situação deve mudar, e quanto?
- **O** Até quando precisa estar funcionando, e por que nessa data? Regra: a data prometida nunca vem antes do fim da estimativa.
- **O** Como vamos saber, um mês depois, que deu certo?
- **O** O cliente declarou algum objetivo próprio (aprender, ganhar autonomia, reduzir custo)? Ele será atendido? Se não for, a sentença diz.

### Usuários e processo real
- **O** Quem vai usar no dia a dia? Quantas pessoas, em que papel?
- **O** Qual foi o último caso real, do começo ao fim? Quem fez o quê? Pedir o caso concreto, e não a descrição de como deveria ser. Se o material não descreve nenhum caso real, este item conta como risco e vai para a fila, ou para o questionário ao cliente.
- **O** O que dá errado hoje, e com que frequência?
- **O** Quais são as exceções, o caso estranho que acontece uma vez por mês?
- **O** Por onde as pessoas realmente falam com o cliente e trabalham fora do sistema (WhatsApp, e-mail pessoal, telefone, planilha)? No Brasil, o WhatsApp costuma ser o principal canal de venda e de atendimento, e é o que mais se esquece.
- **O** Alguma fala de especialista, numa reunião ou transcrição, ainda não foi escrita como item?

### Dados
- **O** De onde vêm os dados, quem é o dono e quanto volume tem?
- **O** Em que estado estão: duplicados, campos vazios, formatos diferentes, tamanhos de campo? Abrir e medir antes de estimar.
- **T** Precisa levar histórico? De quanto tempo?
- **O** Tem dado pessoal? Qual a base legal na LGPD, quem pode ver, por quanto tempo se guarda?

### Ambiente, integrações e donos
- **O** Que sistemas e ferramentas já existem e serão tocados?
- **O** O que o escopo liga ou desliga, e em que estado isso está hoje? Conferir no ambiente, e não pelo que alguém lembra.
- **O** Que acessos e credenciais o trabalho precisa, e como se obtém cada um?
- **O** Depois da entrega, em nome de quem ficam rotinas, integrações e credenciais?
- **T** Que automações já rodam e podem conflitar?
- **T** O que acontece se uma integração cair: quem é avisado e o que se refaz?

### Restrições
- **O** Qual o orçamento ou o limite de horas, e como as horas são consumidas?
- **O** Há regras legais, contratuais ou de compliance?
- **T** Há padrão de marca, linguagem ou identidade visual?
- **T** Há janela de implantação, congelamento ou dependência de outro projeto?

### Não-funcionais
- **O** Quem não pode ver o quê (segurança e perfis)?
- **T** Quão rápido precisa responder, e com quantos usuários ao mesmo tempo?
- **T** Precisa funcionar no celular, em outro idioma, com acessibilidade?
- **T** Que disponibilidade é aceitável, e quem dá suporte depois?

### Pessoas
- **O** O material cita alguém de fora que pode travar o trabalho (TI, jurídico, diretoria, o cliente)? O que o material cita entra na sentença, e a falta de citação dispensa a pergunta.

### Aceite e fora de escopo
- **O** Como vamos testar cada item para dizer "está pronto"? Escrever como "quando isto acontecer, então aquilo", com o caminho de erro ("se isto falhar, então...").
- **O** Todo item listado tem esforço estimado e critério de aceite? Item "incluído" sem horas é escopo sem dono.
- **O** O que fica explicitamente fora desta entrega, e o que acontece com pedidos depois do aceite?
- **O** Em que ordem as partes acontecem?

### Estimativa
- **O** Quanto leva, em faixa (mínimo, provável e máximo), comparado com trabalho parecido?
- **O** Quanto do prazo é esforço nosso e quanto é espera pelo cliente (acessos, dados, respostas, aprovações)? As duas coisas são estimadas separadas.

### Riscos e incertezas
- **O** O que precisa ser verdade para isso funcionar?
- **O** Qual a maior incerteza hoje, e como ela se resolve primeiro?
- **O** Do que dependemos do cliente ou de terceiros (acesso, dado, aprovação, fornecedor, outro sistema), e até quando? Dependência de terceiro entra nos riscos da sentença.

## Camada 2: lentes pela natureza do trabalho

Todo projeto combina poucas naturezas de trabalho, normalmente de uma a quatro. Identificar quais estão presentes e aplicar as perguntas de cada uma. Uma lente pode ficar condicional, ativada depois por uma resposta (por exemplo, a de comprar, se a solução exigir um fornecedor). Uma integração entre sistemas, por exemplo, combina as lentes 1, 2 e 3; um site institucional, 1 e 4; um estudo de viabilidade, 5.

1. **Construir algo novo** (sistema, site, app, automação, espaço)
   - O que já existe que isto substitui, toca ou pode quebrar?
   - Onde é testado antes de valer, e quem testa?
   - Que normas, padrões técnicos ou guias oficiais se aplicam?
   - Quem mantém depois da entrega, e com que conhecimento?
2. **Mover ou integrar dados e sistemas**
   - De onde vem e para onde vai cada dado? Em que frequência e volume?
   - Quem é dono de cada ponta e de cada credencial?
   - O que acontece quando falha: quem é avisado e o que se refaz?
3. **Mudar como as pessoas trabalham** (processo, adoção, treinamento)
   - Quem muda o quê no dia a dia?
   - Quem perde ou ganha com a mudança, e quem pode resistir?
   - Como as pessoas aprendem, e quem dá suporte nas primeiras semanas?
   - Como vamos saber que as pessoas adotaram de fato?
4. **Produzir conteúdo ou comunicação** (documento, relatório, campanha, apresentação, e-mail, página)
   - Quem lê, e que decisão ou ação deve tomar depois de ler?
   - Quem escreve, que aprovação o texto precisa e em quanto tempo?
   - De onde vem cada número e cada afirmação?
   - Que tom, marca e canal? O que não pode aparecer?
5. **Analisar, pesquisar ou recomendar**
   - Que decisão a análise vai apoiar?
   - Que fontes são aceitas como prova?
   - Quanto de profundidade cabe no prazo, e qual nível de certeza basta?
   - Como a incerteza deve aparecer no resultado?
6. **Comprar ou contratar** (fornecedor, licença, serviço)
   - Qual o critério de escolha, e que aprovação a compra precisa?
   - O que o contrato garante: prazo, suporte, multa, saída?
   - O que acontece se o fornecedor falhar, e quem cuida da relação?
7. **Entregar em data fixa** (lançamento, entrada em produção, evento, treinamento presencial)
   - O que precisa estar pronto, testado e com acesso 48 h antes?
   - Qual o plano B se algo falhar no dia?
   - O que acontece se a data escorregar?
8. **Trabalhar em ambiente regulado ou com dado sensível** (saúde, financeiro, jurídico, setor público, ou dado sensível no sentido da LGPD, art. 5º, II)
   - Que norma ou lei se aplica? A resposta vem de pesquisa do Claude, com a fonte, e quem conduz confirma.
   - Que registro ou evidência uma auditoria vai pedir?
   - O que precisa de aprovação jurídica ou de segurança antes de seguir?
9. **Substituir ou desligar algo que existe** (migração, troca de sistema, descontinuação)
   - Quem ainda usa o que vai sair, e o que depende dele?
   - Os dois vão conviver por quanto tempo? Como se volta atrás?
   - Quando o antigo é desligado?

Parte do projeto que não cabe em nenhuma lente indica uma natureza nova: o Claude a nomeia, escreve as perguntas dela pela camada 3 e a propõe como lente nova no encerramento.

## Camada 3: itens do especialista, gerados na hora

Para o domínio do projeto, o Claude se pergunta: **o que um especialista sênior neste domínio sempre confere antes de começar?** E gera de 5 a 10 itens, com três regras:

- **Cada item cita de onde vem:** documentação oficial, norma, guia do fornecedor ou boa prática publicada. Fonte citada de memória, sem conferir, leva "premissa do Claude, a conferir" e fica em verificação. O que não tiver fonte leva "premissa do Claude" e não é tratado como fato.
- **Quem conduz só responde o que é de negócio.** O resto o Claude verifica e recomenda.
- **No encerramento, os itens que pegaram algo são propostos** para entrar nesta skill por PR, junto com as perguntas que chegaram tarde. Quem conduz decide.

Formato de cada item:

> **Domínio: evento presencial.** Capacidade do local contra o número de inscritos, com a margem de quem aparece sem inscrição. Fonte: norma de segurança do local, a conferir. Situação: em verificação; quem conduz pede o número ao local.
