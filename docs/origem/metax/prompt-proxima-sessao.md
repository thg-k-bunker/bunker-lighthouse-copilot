Continuar a Jornada Marketing Cloud da Metax (Bunker). Esta é a CONTINUAÇÃO da sessão de 09/10/2026 (até as 22h40). NÃO refaça nada que o mapa registra como feito.

Leia C:\Users\User\Documents\Bunker\Metax\onde-paramos.md, só a seção "09/10/2026: ESTADO ATUAL" (o resto é histórico); a lista de trabalho está em "O que fazer AGORA". Para confirmar, compare as issues abertas de Bunker-Growth-and-Sales-Intelligence/metax-salesforce com o mapa (um `gh issue list`; são 5 abertas: #17, #21, #31, #41, #42). Não rode consultas na org nem no MC para "revalidar". O clone é C:\Users\User\code\metax-salesforce, branch docs/i31-emails-e-fechamento (PR #46 aberta para a main, esperando o meu ok).

Onde estamos:
- Produção com #34, #35, #37 e #38; a main está igual à produção (#45 mergeada; #40 fechada). Semana de aceite fechada (7 de 7, de 03 a 09/10). Agendamento das 05:00: 08ebL00000YRfoHQAT.
- A Metax aceitou a especificação (rascunho 10). A reunião de entrega da #42 (eu, Lucas e Virginia Santos, gravada) ainda não aconteceu; vai até 16/10. A prova do aceite vem pelo Guilherme.
- Os 7 e-mails definitivos estão no Content Builder e nas 7 atividades do RASCUNHO da jornada, testados na caixa. Nada ativado. Texto e lógica em docs/jornada-mc/textos-e-logica-emails.docx.
- Deck da #41 pronto em docs/entrega (PDF e PPTX, 14 slides com o print de cada ação). Falta o Guilherme ver.

O que fazer AGORA:
1. Conferência da manhã (só leitura), se a data for posterior à "Última conferência registrada" (09/10), e registro na #32.
2. #21: atualizar o guia do Raphael (rascunho 5 → final: os 7 e-mails definitivos, o botão para o consultor, o print 3.3 da Divisão 1 com ForaDaJornada, tirar o aviso de rascunho interno, a tarefa de retorno do consultor no e-mail 6) e gerar o PDF no padrão Bunker (bunker-doc-copilot). Mostre antes de fechar a issue.
3. PR #46: merge só com o meu ok.
4. #41: fecha quando o Guilherme vir. Se eu mandar o print do e-mail de teste no celular, acrescente ao deck (docs/entrega/montar_deck.py, roteiro deck-entrega.json).
5. #42 e #17: reunião até 16/10 e ativação na data combinada (trocar a data de início do agendamento da entrada, que diz 03/10). A ativação só com o meu ok na hora.

Respeite as memórias: eu decido tudo; nada vai para o Guilherme nem para o cliente sem o meu ok; não mexer na configuração da org; produção (Marketing Cloud incluído) só com o meu ok na hora; segredos nunca no chat; antes de recomendar uma opção, simular um caso concreto. O `sf` só funciona pelo PowerShell; os scripts do MC estão em C:\Users\User\Documents\Bunker\Metax\scripts-mc\ (LEIA-ME.md; gravar .apex sem BOM). Testar e-mail na caixa só pelo teste da jornada. No PowerShell 5.1, comentários do `gh` com aspas vão por --body-file.
