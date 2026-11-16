# Escopo: frete atualizado na margem do pedido

Ultracheese · caso 00002441 · 16/11/2026

## O resultado
Até 25/11/2026, a margem de cada pedido passa a descontar o frete que de fato saiu no mês anterior, e não mais uma média fixa digitada à mão. O frete segue o destino real: primeiro a loja, depois o município, depois o estado. O Angeloni de Itajaí e o de Brusque, com o mesmo preço, passam a mostrar a margem que cada um realmente deixa.

## O que entra
- **Frete atualizado todo mês, sem digitação.** A logística sobe o mesmo fechamento de frete que já monta hoje, e o fator se recalcula sozinho.
- **Frete pelo destino real.** Loja com pelo menos 3 entregas no mês tem frete próprio, que já inclui reentregas e taxas de dificuldade de entrega. Loja nova ou com pouco movimento usa o frete do município, e na falta dele, o do estado.
- **Frete previsto registrado em cada pedido.** Cada pedido guarda o frete com que foi precificado. É o alicerce da comparação entre previsto e realizado.
- **Estrutura pronta para o frete de transferência.** O frete da fábrica para o CD tem lugar reservado, zerado, até a controladoria definir o critério.

## O que fica para uma segunda etapa
- Conexão direta com o sistema de roteirização, para o frete chegar todo dia sem nenhum envio de arquivo. Essa etapa depende do fornecedor do sistema.
- Relatório de previsto contra realizado, que vai usar os valores registrados desde o primeiro dia.
- Valor do frete de transferência, quando a controladoria definir.

## Como comprovamos que está pronto
- O fechamento de outubro é carregado e gera o frete de cada loja, município e estado, sem digitação.
- Três casos reais conferidos lado a lado com a conta manual: o Angeloni de Itajaí, o de Brusque e uma loja sem histórico.
- Um pedido novo mostra o frete usado e de onde ele veio: loja, município ou estado.

## O que precisamos da Ultracheese
- Um fechamento de frete de outubro, no formato que o Victor já usa, até 18/11.
- Acesso de consulta ao ambiente de preço, para mapearmos a configuração atual antes de qualquer alteração.
- Um responsável na Ultracheese pelo cadastro de lojas novas que o fechamento ainda não reconheça, a partir da entrega.
