# Histórico: fator de frete automático da Ultracheese

## 16/11/2026, sentença
- **Feito:** sentença emitida · evidência: `SENTENCA.md`
- **Feito:** escopo para o cliente preparado, para Thiago revisar e enviar · evidência: `ESCOPO-CLIENTE.md`
- **Feito:** teste do executor: a primeira leitura achou 12 pontos; 10 técnicos resolvidos na sentença (regras de cálculo, carga, conferência, esforço subiu de 29 h para 32 h provável) e 1 de negócio perguntado
- **Perguntado:** com quanto movimento a loja tem frete próprio? · resposta: 3 entregas no mês · antes da sentença
- **Decidido:** as 8 premissas confirmadas em bloco · por Thiago
- **Feito:** pre-mortem com 5 riscos, registrados na sentença

## 16/11/2026, perguntas
- **Perguntado:** a reunião de 13/11 aconteceu? · resposta: não aconteceu · antes da sentença
- **Perguntado:** de onde vem o frete realizado? · resposta: do fechamento mensal que o Victor já monta, agora; conexão direta com o sistema de roteirização numa segunda entrega · antes da sentença
- **Perguntado:** o frete de transferência fábrica-CD (T1) entra? · resposta: até 25/11 só o frete de entrega; o lugar da transferência fica pronto e zerado até a controladoria decidir · antes da sentença
- **Perguntado:** o nível cliente é loja ou grupo? · resposta: loja, depois município, depois estado; grupo não entra · antes da sentença
- **Perguntado:** a comparação previsto x realizado entra até 25/11? · resposta: o previsto é gravado em cada pedido desde o primeiro dia; o relatório vem na segunda entrega · antes da sentença

## 16/11/2026
- **Decidido:** os arquivos do projeto ficam neste repositório, em `casos-reais/ultracheese/`, porque a Ultracheese não tem repositório · por Thiago
- **Perguntado:** o entendimento está certo? · resposta: está certo · antes da sentença
- **Feito:** leitura do material de 12/11 (transcrição da reunião de 11/11, áudio da Gisele, restrições) · evidência: `casos-reais/ultracheese/material-2026-11-12.pdf`
- **Decidido:** a rota é a Lighthouse, e não a fix-bug: o material traz pedido novo, e nenhum defeito reportado · por Claude, mostrado ao Thiago

Entendimento confirmado: o frete que desconta a margem do pedido no Salesforce deixa de ser uma média digitada à mão e passa a se atualizar sozinho, todo mês, com o frete realizado do sistema de roteirização, no nível cliente, depois município, depois estado. A logística não ganha trabalho novo, e dá para comparar o frete previsto com o realizado. Entra como mudança de escopo (caso 00002441), estimativa até 18/11 e resolução até 25/11.

Perfil: novidade alta, tecnologia alta (API do sistema de roteirização desconhecida), complexidade alta (Salesforce, roteirização e BI; preço, logística e controladoria), ritmo urgente.
