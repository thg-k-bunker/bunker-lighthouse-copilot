# Sentença: fator de frete automático da Ultracheese

Emitida em 16/11/2026. Quem conduz: Thiago. Caso Bunker 00002441, mudança de escopo do projeto de preço.

## Resultado
Até 25/11/2026, a margem de cada pedido calculada no motor de preço da Ultracheese, no Salesforce, desconta o frete realizado do mês anterior. O frete é buscado na loja; sem histórico da loja, no município; sem histórico do município, no estado. O fator se atualiza todo mês a partir do fechamento que a logística já monta: o Victor sobe o arquivo e ninguém digita fator. Cada pedido guarda o frete que previu. O fator novo substitui o fator de frete de hoje no desconto da margem, e não soma a ele.

## Critério de pronto
| Item | Como se prova | Essencial ou desejável |
|---|---|---|
| Carga do fechamento | quando o Victor sobe o fechamento de outubro, então ficam gravados os fatores em reais por quilo de toda loja, município e estado com frete no mês, por origem e com o mês de referência, sem digitação; se faltar coluna, então o arquivo inteiro é recusado, com a coluna que faltou; se a loja não tiver par no Salesforce, então a linha entra na média do município e do estado, não gera fator de loja e aparece na lista do que não casou | essencial |
| Hierarquia no preço | quando um pedido é precificado, então ele usa o fator da loja; sem a loja, o do município; sem o município, o do estado; se não houver nenhum, então usa o fator de hoje e o pedido mostra que caiu no fator antigo | essencial |
| Previsto gravado | quando o preço é calculado, então o pedido guarda o frete previsto, o fator usado e o nível (loja, município ou estado); depois que o pedido é efetivado, quando o fator muda, então o valor gravado continua o mesmo | essencial |
| Conta confere | para três casos reais (o Angeloni de Itajaí, o de Brusque e uma loja sem histórico, que cai no município), o fator calculado bate com a conta que o Claude faz à mão sobre o mesmo fechamento e mostra a quem conduz | essencial |
| Lugar da transferência | o fator tem o tipo "transferência" pronto e zerado; quando a controladoria der o valor, então ele entra sem mudar a estrutura | desejável |
| Histórico de fatores | os fatores de meses anteriores ficam guardados, e não são sobrescritos | desejável |

## Tolerâncias
| Aspecto | Mínimo | Provável | Máximo |
|---|---|---|---|
| Prazo | 23/11/2026 | 25/11/2026 | 02/12/2026 |
| Esforço (horas nossas) | 20 h | 32 h | 50 h |
| Escopo | sai o lugar da transferência e o histórico de fatores | o critério de pronto inteiro | entra uma tela simples de previsto contra realizado, se sobrar folga |

Espera estimada pelo cliente, à parte do esforço: de 1 a 3 dias úteis (fechamento de exemplo e acesso de leitura à org). Há feriado nacional em 20/11, no meio da janela.

## Regras de cálculo
Recomendação de desenho do Claude, registrada para quem executa não precisar perguntar.

- Fator = soma do custo de frete ÷ soma do peso, no mês, por origem e destino. É média ponderada pelo peso, e não média das notas.
- A origem é o CD de onde o pedido sai, como o motor já usa hoje (conferido no passo 1). Sem fator para aquela origem, o pedido usa o fator de hoje e mostra que caiu nele.
- Pedido feito antes da carga do mês usa o último mês carregado.
- O peso é o mesmo que o motor já usa hoje para o frete (conferido no passo 1).
- Município casa pelo código IBGE quando os dois lados o têm; senão, pelo nome normalizado com o estado. O de-para das lojas que não casarem é mantido na própria carga, pela Bunker, até a entrega; depois, por um responsável da Ultracheese, pedido no escopo para o cliente.
- Carga repetida do mesmo mês substitui aquele mês, como correção.
- O previsto é recalculado enquanto o pedido está aberto e fica congelado quando o pedido é efetivado. O status que conta como efetivado é conferido na org no passo 1; se não for evidente, quem conduz decide.
- A loja só tem fator próprio com pelo menos 3 entregas no mês; abaixo disso, usa o do município. Decidido por quem conduz em 16/11.

## Fora de escopo
- Conexão direta com o sistema de roteirização: segunda entrega, porque depende de um fornecedor ainda não procurado. Decidido em 16/11 por Thiago.
- Relatório de previsto contra realizado: segunda entrega; nesta, o previsto só fica gravado. Decidido em 16/11 por Thiago.
- Valor do frete de transferência fábrica-CD: espera a controladoria; o lugar fica pronto. Decidido em 16/11 por Thiago.
- Fator por grupo de clientes: o nível é a loja. Decidido em 16/11 por Thiago.
- Fator por transportadora: vale a média do destino. Premissa confirmada em 16/11 por Thiago.
- Atualização mais de uma vez por mês: segue o fechamento mensal. Decidido em 16/11 por Thiago.

## Premissas
Confirmadas em bloco por Thiago em 16/11/2026.

| Premissa | Fonte e confiança | O que a invalida | Confirmar até |
|---|---|---|---|
| Fator em reais por quilo, sobre o fechamento do mês anterior | reunião de 11/11, 14:37:42 a 14:37:46; dito na reunião, falante incerto | a logística negociar só em percentual sobre a nota | passo 3 |
| Sem cadastro de transportadora; vale a média do destino | reunião, 15:02:41; dito na reunião | a Ultracheese exigir valor por transportadora | passo 3 |
| Reentrega e taxa de dificuldade já estão no custo realizado | inferido da reunião, 14:47:24 a 14:48:08 | o fechamento trazer só o frete de tabela | passo 2 |
| Loja nova cai para município, depois estado | reunião, 14:58:03 a 14:58:18; dito na reunião | nenhum | passo 3 |
| Frete sem imposto | inferido; a reunião cita os dois sem decidir | o motor descontar margem com imposto | passo 1 |
| O fechamento traz loja, município, estado, origem, peso e custo por nota | reunião, 14:49:04 a 14:49:19; dito por quem faz (o Victor mostrou a tela) | o arquivo não trazer código de loja que case com o Salesforce | passo 2 |
| O motor aceita a ordem loja, município, estado | reunião, 15:00:36; dito na reunião (Anderson) | a configuração atual do motor não permitir | passo 1 |
| Soltar o fechamento todo mês conta como sem trabalho novo | decisão de 16/11 sobre a fonte do frete | a logística recusar o gesto | aceite do cliente |

## Aceite do cliente
Situação: pendente. Versão para o cliente em `ESCOPO-CLIENTE.md`, para Thiago revisar e enviar.

## Decisões
| Data | Pergunta | Escolha | Alternativa descartada |
|---|---|---|---|
| 16/11/2026 | A reunião de 13/11 aconteceu? | não aconteceu | (fato) |
| 16/11/2026 | De onde vem o frete realizado? | fechamento mensal do Victor agora, conexão direta depois | só conexão direta: depende do fornecedor e põe 25/11 em risco |
| 16/11/2026 | O frete de transferência entra? | só entrega até 25/11, transferência preparada e zerada | só entrega, sem preparar: retrabalho quando a controladoria decidir |
| 16/11/2026 | O nível cliente é loja ou grupo? | loja, município, estado | grupo: não resolve Itajaí contra Brusque |
| 16/11/2026 | Previsto contra realizado entra até 25/11? | grava o previsto já, relatório depois | tudo até 25/11: mais esforço num prazo apertado |
| 16/11/2026 | Com quanto movimento a loja tem frete próprio? | 3 entregas no mês | 1 entrega: não corta o frete absurdo de uma entrega só |

## Quem pode travar
- O fornecedor do sistema de roteirização (API, documentação e acesso): só trava a segunda entrega.
- A controladoria da Ultracheese, no frete de transferência: não trava esta entrega, porque o lugar fica zerado.

## Riscos
Do pre-mortem de 16/11: "em 07/12 isto fracassou; por quê?"

| Risco | O que se faz para evitar |
|---|---|
| Os códigos de loja do fechamento não casam com as contas do Salesforce, e quase todo pedido cai no fator do estado | medir a taxa de casamento num fechamento real no passo 2, antes de construir; abaixo de 90%, para e leva a quem conduz |
| O fator de hoje está no motor de um jeito que não aceita a hierarquia, e o desenho vira retrabalho | ler a configuração do motor na org no passo 1, antes do desenho |
| Loja com uma entrega só no mês gera fator absurdo | piso de 3 entregas no mês para usar o nível loja, senão cai para o município; decidido em 16/11 e revisto com o primeiro fechamento real |
| O Victor muda o formato do arquivo e a carga quebra em silêncio | modelo de arquivo fixo; a carga confere as colunas e recusa com mensagem clara |
| Espera do cliente e o feriado de 20/11 comem o prazo | pedir o fechamento e o acesso em 17/11; espera contada à parte; aviso a quem conduz se o passo 2 não começar até 19/11 |

## Maior incerteza
Se o fechamento do Victor traz um código de loja que casa com as contas do Salesforce. Resolve-se no passo 2, logo depois da leitura do motor, com um fechamento real.

## Plano
Muda sem aditamento, desde que fique dentro das tolerâncias. Os passos formam uma cadeia só, que é o caminho crítico; o WSJF não desempata nada aqui.

| # | Passo | Pacote | Depende de | Pronto quando | Esforço (h) | WSJF |
|---|---|---|---|---|---|---|
| 1 | Ler na org, sem gravar, onde e como o fator de frete entra hoje no motor de preço | A, entender | acesso de leitura à org (ok de quem conduz) | objeto, campo e regra atuais descritos, com print | 2 | caminho crítico |
| 2 | Pedir o fechamento de outubro e medir quanto de loja e município casa com o Salesforce | A, entender | arquivo do Victor | taxa de casamento medida, com as lojas que não casam listadas | 3 | caminho crítico |
| 3 | Desenhar a estrutura do fator (origem, nível, destino, reais por quilo, mês, tipo) com o piso de 3 entregas | A, entender | 1 e 2 | desenho aprovado por quem conduz | 3 | caminho crítico |
| 4 | Carga do fechamento: subir o arquivo, calcular e validar | B, carga | 3 | item "carga do fechamento" provado | 8 | caminho crítico |
| 5 | Motor usa a hierarquia e grava o previsto no pedido | C, preço | 3 | itens "hierarquia" e "previsto gravado" provados em sandbox | 8 | caminho crítico |
| 6 | Conferir os três casos reais, testar com cobertura e implantar em produção | D, entrega | 4 e 5 | item "conta confere" provado, implantação feita com o ok de quem conduz | 8 | caminho crítico |

O fim de cada pacote é um marco, com revisor independente.

## Aditamentos
Só para mudar resultado, critério de pronto ou tolerância.

| Data | O que mudou | Por quê | Decidido por |
|---|---|---|---|
