# Estado: fator de frete automático da Ultracheese

Fase: conhecimento. Atualizado em 16/11/2026.

**Onde estamos:** entendimento confirmado pelo Thiago; começa a fila de perguntas.
**Próximo passo:** saber se a reunião de 13/11 aconteceu e se tem material, porque ela pode responder metade da fila.
**Falta:** as perguntas abaixo, a checagem de cobertura fechada, o pre-mortem e a sentença.

**Esperando o cliente**
| O quê | De quem | Desde |
|---|---|---|
| API, documentação e acesso ao sistema de roteirização | fornecedor do sistema, via Ultracheese (ainda não pedido) | 11/11/2026 |
| Posição sobre o frete de transferência (T1) | controladoria da Ultracheese | 11/11/2026 |

**Esperando quem conduz:** resposta da pergunta 1.
**Não refazer:** leitura do material de 12/11 (`casos-reais/ultracheese/material-2026-11-12.pdf`) e confirmação do entendimento, em 16/11.

**Perguntas abertas**
1. A reunião de 13/11 aconteceu? Tem transcrição ou anotação? (fato)
2. De onde vem o frete realizado: API diária do sistema de roteirização ou o arquivo do fechamento mensal que o Victor já monta? (arquitetura e prazo)
3. O frete de transferência da fábrica para o CD (T1) entra no fator? As falas da reunião se contradizem. (escopo)
4. "Cliente" no fator é o código do cliente ou o grupo (por exemplo, o grupo Angeloni)? (fato do cliente)
5. A comparação entre previsto e realizado entra até 25/11 ou numa segunda entrega? (escopo e prazo)

**Premissas a confirmar na emissão da sentença**
- O fator é em reais por quilo, com base no fechamento do mês anterior.
- Não se cadastra transportadora: vale a média realizada do destino, como dito na reunião (15:02:41).
- Custos extras (reentrega, taxa de dificuldade de entrega) entram porque já estão no custo realizado.
- Cliente sem histórico cai para município, depois para estado.
- Frete sem imposto (a reunião cita "com imposto, sem imposto" sem decidir).

**Em verificação pelo Claude**
- Nome certo do sistema de roteirização (a transcrição diz Linkrus, Linclus, Lincolns, Linux) e se ele tem API documentada.
- Como o fator de frete está cadastrado hoje no motor de preço do Salesforce (precisa de acesso de leitura à org).
