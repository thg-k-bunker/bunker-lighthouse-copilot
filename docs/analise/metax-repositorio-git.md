> Leitura do histórico git do metax-salesforce (11/11/2026). Duas correções posteriores: o "onde paramos" não estava no repositório porque era arquivo local, hoje em [`../origem/metax/onde-paramos.md`](../origem/metax/onde-paramos.md); e os commits de status report deixaram de contar como desperdício pela decisão de 11/11 sobre o GitHub (ver [`../decisoes.md`](../decisoes.md)).

# Análise do repositório metax-salesforce (git, 123 commits)

Fonte: clone de Bunker-Growth-and-Sales-Intelligence/metax-salesforce, HEAD 86901a0 (09/10/2026).
O arquivo "onde paramos" NÃO está no repositório, nem no histórico: é arquivo local, nunca commitado.

## Linha do tempo pelo git
- 12/06: retrieve inicial dos metadados (Leo). Depois, **nada até 28/09**. A fase de mapeamento/reestruturação (jun–set) não deixou rastro no repo.
- 28/09: início da frente "Jornada MC". Sincroniza main com produção, testes vermelhos primeiro, Batch + Named Credential.
- 29–30/09: correções de integração (#25, #26), evidências, saída da jornada (#24, #27), alerta de falha (#28). **30/09: 28 commits num dia.** No mesmo dia nasce o rascunho da especificação (#30) e a cadência muda 4 vezes (3 por faixa → 9 e-mails → 6 e-mails), com uma skill criada e removida no mesmo dia.
- 01/10: conteúdo dos e-mails passa a ser entrega da Bunker (mudança de escopo no meio da execução).
- 02/10: desenho da jornada real refeito 3 vezes no dia (limitação do Journey Builder descoberta na hora: "não junta ramos"). Despedida no dia 90: 6 → 7 e-mails.
- 03/10: carga diária em produção (início da semana de aceite 03–09/10).
- 05–06/10: novos defeitos de regra de negócio descobertos em execução: WhatsApp não contava (#34), e-mail do consultor (#35), pessoa duplicada/e-mail interno (#37), resposta caindo no noreply (#38).
- 06–07/10: especificação nos rascunhos 8, 9 e 10. Ainda "RASCUNHO INTERNO", não enviada à Metax.
- 08–09/10: WSJF aplicado ao repo; sincronização com produção; guia 1.0 e deck de entrega.
- 09/10: na entrega, a issue #30 "Especificação da entrega **assinada pela Metax**" segue aberta e é a P0 de maior WSJF (10,5).

## Distribuição do esforço (por commit)
- ~21 commits de código (10 feat, 6 fix, 5 test) contra ~70 de documentação.
- 18 commits só de status report (#19), vários puramente cosméticos (logos, opacidade, co-marca, alinhamento).
- 16 commits do guia (#21), 15 dos e-mails (#31), 7 da especificação (#30). A especificação foi do rascunho 1 ao 10 em 8 dias.
- 13 commits registram decisão humana explícita ("decisão do Thiago", "ok do Thiago", "direcionamento do Guilherme").

## O que deu certo (padrões a manter)
1. **Teste vermelho antes da correção** (ex.: 46d7447, f8e0f34 → 75c27ee): prova de que o defeito existia e de que foi corrigido.
2. **Ficha de evidência por issue** (evidencias/iNN/ficha.md): defeito, quem sofria, causa, correção, prova com IDs de execução, antes/depois. É exatamente o "verificar + registrar" do ciclo do Farol.
3. **Backup antes de mexer em produção** (jornada-real-backup-*.json antes de cada troca).
4. **Roteiro de implantação com conferência e reversão** (roteiro-producao.md): estado esperado medido antes, cada passo que toca produção só com ok humano na hora, plano B por passo. Modelo de "ação irreversível".
5. **Sincronizar main com a produção** antes de começar e antes de entregar (detecção de drift).
6. **Decisões nomeadas e datadas** no commit e no documento ("decisão do Thiago em 06/10").
7. **Fronteira de escopo explícita** na especificação: "fica com a Metax", "fora do escopo", "mudança depois do aceite é demanda nova", critérios de aceite objetivos.
8. **Cadência embasada em pesquisa** (Stanford GSB, HBS, NYU Stern, JMR).

## O que deu errado (com a causa)
1. **Especificação escrita depois de começar a executar, e nunca assinada.** O código começou em 28/09; o rascunho da especificação nasceu em 30/09 e chegou ao rascunho 10 em 07/10 sem ir para a Metax. A carga foi para produção em 03/10 sem aceite. → *Falha de fase*: a "sentença" não existia quando a execução começou.
2. **Escopo do conteúdo mudou de dono no meio** (01/10: e-mails passam a ser da Bunker) e o número de e-mails mudou 4 vezes (3/9/6/7). → *Falha de mapeamento*: quantos e-mails e quem escreve eram perguntas da fase de conhecimento.
3. **Regras de negócio descobertas tarde** (#34 WhatsApp, #35 e-mail do consultor, #37 duplicados/e-mail interno, #38 noreply). Todas sobre "como o time comercial da Metax realmente conversa com o cliente". → *Falha de mapeamento do processo real* (como o trabalho é feito, não como o sistema está configurado).
4. **Limitação da ferramenta descoberta na execução** (Journey Builder não junta ramos; desenho refeito 3x em 02/10). → faltou *spike* (prova curta) da incerteza técnica antes de desenhar.
5. **Desperdício em polimento de status report** (logos, opacidade, co-marca, ~6 commits) enquanto a especificação não estava aceita. → *Falha de priorização*: o WSJF só foi aplicado em 08/10, no fim.
6. **Lote grande no mesmo dia** (28 commits em 30/09; merge de várias frentes juntas). Aumenta risco de regressão e dificulta revisão.
7. **A fase de mapeamento (jun–set) não deixou rastro versionado**: decisões, premissas e o "onde paramos" ficaram fora do repo. → *Falha de registro*: impossível reconstruir o porquê sem a memória das pessoas.

## Lições como regras para o Farol
- Na fase de conhecimento, **nada é executado em ambiente real antes de a sentença estar emitida**. Se o cliente precisa aceitar, o aceite do cliente faz parte do catch.
- Mapear o **processo real de quem usa** (canais de conversa, exceções, duplicidades), não só o sistema. Pergunta obrigatória: "por onde as pessoas realmente falam com o cliente?"
- Toda incerteza técnica de ferramenta vira **spike com prazo** antes do desenho final.
- Decidir na fase de conhecimento: **quantidade, dono do conteúdo, critério de aceite**, e quem assina.
- O **WSJF entra no primeiro dia de execução**, não no fim. Polimento visual só depois de P0 fechadas.
- O arquivo de estado ("onde paramos") **mora no repositório** e é commitado a cada marco.
- Manter: teste vermelho → verde, ficha de evidência, backup antes de produção, roteiro com reversão, decisão nomeada e datada.
