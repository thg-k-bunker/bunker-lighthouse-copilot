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
| Processo no GitHub | Fica fora da Lighthouse e segue o padrão da Bunker: rito da `bunker-fix-bug-copilot` e régua da `bunker-wsjf-copilot`. A Lighthouse não cria rótulos, etapas nem regras de issue. Motivo: na Metax, o trabalho de controle no GitHub foi quase todo do agente e pesou pouco no tempo humano; o gargalo foi a falta de processo definido (decisão do Thiago, 11/11/2026). Análise em [`analise/metax-github.md`](analise/metax-github.md) |
| Alcance | A skill cobre qualquer projeto, de qualquer tipo ou domínio, sem lista fechada de tipos. A checagem de cobertura combina perguntas universais, lentes pela natureza do trabalho e itens do especialista gerados na hora, que viram biblioteca com o uso (Thiago, 11/11/2026) |
| Foco da pesquisa | Um padrão global de levantamento e mapeamento: o que um profissional muito eficiente faz toda vez antes de executar. A Metax é exemplo, não a lista completa dos problemas (Thiago, 11/11/2026) |
| Portas de aprovação | Ficam as duas: o ok humano no que é irreversível ou sai para fora (produção, cliente, dado real) e também no trabalho interno (merge, saída da triagem, fechamento de issue). Motivo: a skill vai para outras pessoas da Bunker que também não dominam o que estão fazendo, e as portas não foram a causa do retrabalho na Metax (decisão do Thiago, 11/11/2026) |
| Quem decide | O Thiago é sempre o responsável: decide o escopo e dá os oks das portas de aprovação. A skill não pergunta quem decide, quem paga nem quem assina. Se existir alguém que possa travar o projeto (TI, jurídico, diretoria, o cliente), isso vem na transcrição ou é informado por ele. Terceiro citado na transcrição é registrado na sentença; ausente, não vira pergunta (Thiago, 11/11/2026) |
| Tolerâncias | A sentença fixa o resultado, o critério de pronto e três tolerâncias, em faixa (mínimo, provável, máximo): **prazo, esforço e escopo**. A qualidade é coberta pelo critério de pronto, em que o essencial tem tolerância zero e o desejável pode flexionar. O plano de passos é revisável dentro das tolerâncias, sem aditamento. Só vira aditamento a mudança de resultado, de critério de pronto ou de tolerância. A escalação é pela **previsão** de estouro, não depois dele. Incidente pequeno: resolvido dentro do passo. Médio: muda o plano sem estourar tolerância. Grande: atinge resultado ou critério de pronto, ou estoura tolerância. Método verificado em [`pesquisa/prince2-tolerancias.md`](pesquisa/prince2-tolerancias.md) (Thiago, 12/11/2026) |
| Perfil do projeto | O Claude **infere** o perfil (novidade, tecnologia, complexidade e ritmo, Camada 0 do [`padrao-global-levantamento.md`](pesquisa/padrao-global-levantamento.md)) a partir da transcrição e o confirma dentro do entendimento de 3 ou 4 linhas, sem pergunta extra. O perfil define a profundidade do levantamento (Thiago, 12/11/2026) |

## O que a skill usa sem copiar

| Assunto | Skill dona |
|---|---|
| Como perguntar | `bunker-fix-bug-copilot`, passo 0 |
| Ordem e notas | `bunker-wsjf-copilot`, `references/regua.md` |
| Anatomia da issue e procura de issue parecida | `bunker-fix-bug-copilot` |
| Como terminar o turno | `bunker-confetes-ou-perguntas-copilot` |
| Relatório ao cliente | `bunker-repo-pulse-copilot` |

## Em aberto

- **Fase de execução:** a análise do GitHub da Metax terminou ([`analise/metax-github.md`](analise/metax-github.md)). Falta decidir o que da pesquisa entra na skill.
- **Padrão global de levantamento:** proposta em [`pesquisa/padrao-global-levantamento.md`](pesquisa/padrao-global-levantamento.md): 11 movimentos, a checagem de cobertura em perguntas de negócio (obrigatórias e por tipo), a regra de parada em 6 condições e 5 métricas. Falta o Thiago decidir o que entra na skill.
- **Regras de issues para trabalho de projeto:** saem da Lighthouse pela decisão de 11/11/2026 (padrão da Bunker). Os indícios de [`analise/metax-arquivos-locais.md`](analise/metax-arquivos-locais.md), seção 3, ficam como sugestão para a skill dona, se o Thiago quiser levar adiante.
- **Arquivo de estado e prompt da próxima sessão:** formalizar o que o Thiago fazia à mão na Metax (estado curto no repositório, histórico à parte, prompt gerado no fim do turno), conferindo antes a `bunker-fechar-turno-copilot`.
- **Correções nas skills donas** (fora da Lighthouse, pedem alinhamento com quem decidiu as regras):
  - a `bunker-wsjf-copilot` refaz todas as notas a cada rodada, inclusive as dadas à mão, e isso contradiz "nota dada uma vez";
  - a esteira e0 a e6 da `bunker-fix-bug-copilot` foi feita para defeito e, aplicada a trabalho de projeto, deixou entregas prontas esperando cerca de 7 dias para fechar;
  - a `bunker-repo-pulse-copilot` não separa "aguardando o cliente" de "em andamento".
