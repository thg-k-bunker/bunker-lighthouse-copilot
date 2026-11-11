# Decisões da bunker-lighthouse-copilot

Atualizado em 11/11/2026. O desenho ainda está aberto: a pesquisa não terminou.

## Fechado

| Tema | Decisão |
|---|---|
| Nome | `bunker-lighthouse-copilot`, no padrão `bunker-<dominio>-copilot`. O `name:` do SKILL.md é igual ao nome da pasta. "Farol" é só apelido |
| Objetivo | Padrão de processo internalizado para ter produtividade em tarefas desconhecidas, sem retrabalho e sem tempo improdutivo. Skill de suporte, no estilo das outras da Bunker. Natural: nem interrogatório, nem burocracia, nem muitas etapas. Vai sendo refinada com o uso |
| Coerência | Vale criar: nenhuma skill da Bunker cuida da entrada de um trabalho novo (transcrição até escopo fechado). Condição: ser enxuta, cuidar só dessa lacuna e apontar para as skills donas do resto, sem copiar regra |
| Entrada | Quase sempre uma transcrição ou explicação colada pelo usuário: sempre existe contexto prévio |
| Início da fase 1 | O Claude devolve o entendimento (serviço, problema, para quem, resultado esperado) em 3 ou 4 linhas, e o usuário confirma |
| Mapa do terreno | Não é obrigatório. Explicação só sob demanda |
| Perguntas | Uma por vez, com recomendação. Exceção: a regra do passo 0 da `bunker-fix-bug-copilot`, que junta até 4 perguntas de assuntos diferentes numa chamada e depois volta ao ritmo normal |
| Transcrição nova | É confrontada com a sentença: confirma, acrescenta ou contradiz. Só a contradição muda a sentença, e só com decisão do usuário (aditamento) |
| Checagem de cobertura | Antes do catch, o Claude confronta a sentença com o que todo trabalho daquele tipo precisa ter (exemplo: o WhatsApp como canal de venda no Brasil). O que faltar vira pergunta. É interna, não é explicação |
| Catch | A emissão da sentença, que fecha a fase de conhecimento |
| WSJF | Sai do conhecimento e vai para a execução. Ordem: caminho crítico, depois a maior incerteza, e o WSJF desempata, com a régua da `bunker-wsjf-copilot`. A nota é dada uma vez e só é refeita com fato novo |
| Trabalho manual | Não entra na skill: se o usuário quiser fazer à mão, faz |

## O que a skill usa sem copiar

| Assunto | Skill dona |
|---|---|
| Como perguntar | `bunker-fix-bug-copilot`, passo 0 |
| Ordem e notas | `bunker-wsjf-copilot`, `references/regua.md` |
| Anatomia da issue e procura de issue parecida | `bunker-fix-bug-copilot` |
| Como terminar o turno | `bunker-confetes-ou-perguntas-copilot` |
| Relatório ao cliente | `bunker-repo-pulse-copilot` |

## Em aberto

- **Fase de execução:** aguardando o fim da pesquisa (análise do GitHub da Metax na aba "Boas práticas + case Metax").
- **Regras de issues para trabalho de projeto:** aguardando a mesma análise. Primeiros indícios em [`analise/metax-arquivos-locais.md`](analise/metax-arquivos-locais.md): issue é entrega verificável, e não evento ou aprovação; P0 escasso; a fila nasce da sentença.
- **Portas de aprovação:** ficam só no irreversível ou no que sai para fora (produção, cliente, dado real), e o trabalho interno anda sem esperar ok? Pergunta para o Thiago.
- **Arquivo de estado e prompt da próxima sessão:** formalizar o que o Thiago fazia à mão na Metax (estado curto no repositório, histórico à parte, prompt gerado no fim do turno), conferindo antes a `bunker-fechar-turno-copilot`.
- **Correções nas skills donas** (fora da Lighthouse, pedem alinhamento com quem decidiu as regras):
  - a `bunker-wsjf-copilot` refaz todas as notas a cada rodada, inclusive as dadas à mão, e isso contradiz "nota dada uma vez";
  - a esteira e0 a e6 da `bunker-fix-bug-copilot` foi feita para defeito e, aplicada a trabalho de projeto, deixou entregas prontas esperando cerca de 7 dias para fechar;
  - a `bunker-repo-pulse-copilot` não separa "aguardando o cliente" de "em andamento".
