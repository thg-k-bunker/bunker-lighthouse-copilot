# Estado: fator de frete automático da Ultracheese

Fase: conhecimento. Atualizado em 16/11/2026.

**Onde estamos:** fila de perguntas fechada, cinco decisões no histórico.
**Próximo passo:** confirmar as premissas em bloco, fazer o pre-mortem e emitir a sentença. A estimativa vence em 18/11.
**Falta:** confirmação das premissas, pre-mortem, sentença e escopo para o cliente.

**Esperando o cliente**
| O quê | De quem | Desde |
|---|---|---|
| API, documentação e acesso ao sistema de roteirização (só para a segunda entrega) | fornecedor do sistema, via Ultracheese (ainda não pedido) | 11/11/2026 |
| Posição sobre o frete de transferência (T1) | controladoria da Ultracheese | 11/11/2026 |
| Um fechamento mensal de exemplo | Victor (Ultracheese) | 16/11/2026 |

**Esperando quem conduz:** confirmação das premissas.
**Não refazer:** leitura do material de 12/11, confirmação do entendimento e as cinco perguntas, todas em 16/11 (ver HISTORICO.md).

**Premissas a confirmar na emissão da sentença**
1. Fator em reais por quilo, sobre o fechamento do mês anterior.
2. Sem cadastro de transportadora: vale a média realizada do destino (reunião, 15:02:41).
3. Reentrega e taxa de dificuldade entram, porque já estão no custo realizado.
4. Loja nova cai para município, depois estado.
5. Frete sem imposto.
6. O fechamento do Victor já traz loja, município, estado, peso e custo por nota (reunião, 14:49:04 a 14:49:19).
7. O motor de preço aceita a ordem loja, município, estado (Anderson, 15:00:36: "é possível").
8. Soltar o arquivo do fechamento todo mês conta como "sem trabalho novo", porque o Victor já monta esse fechamento.

**Em verificação pelo Claude**
- Nome certo do sistema de roteirização e se ele tem API documentada (só pesa na segunda entrega).
- Como o fator de frete está cadastrado hoje no motor de preço (precisa de acesso de leitura à org).
