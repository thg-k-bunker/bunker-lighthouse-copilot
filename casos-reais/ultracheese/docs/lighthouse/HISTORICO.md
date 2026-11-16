# Histórico: fator de frete automático da Ultracheese

## 16/11/2026
- **Decidido:** os arquivos do projeto ficam neste repositório, em `casos-reais/ultracheese/`, porque a Ultracheese não tem repositório · por Thiago
- **Perguntado:** o entendimento está certo? · resposta: está certo · antes da sentença
- **Feito:** leitura do material de 12/11 (transcrição da reunião de 11/11, áudio da Gisele, restrições) · evidência: `casos-reais/ultracheese/material-2026-11-12.pdf`
- **Decidido:** a rota é a Lighthouse, e não a fix-bug: o material traz pedido novo, e nenhum defeito reportado · por Claude, mostrado ao Thiago

Entendimento confirmado: o frete que desconta a margem do pedido no Salesforce deixa de ser uma média digitada à mão e passa a se atualizar sozinho, todo mês, com o frete realizado do sistema de roteirização, no nível cliente, depois município, depois estado. A logística não ganha trabalho novo, e dá para comparar o frete previsto com o realizado. Entra como mudança de escopo (caso 00002441), estimativa até 18/11 e resolução até 25/11.

Perfil: novidade alta, tecnologia alta (API do sistema de roteirização desconhecida), complexidade alta (Salesforce, roteirização e BI; preço, logística e controladoria), ritmo urgente.
