# Gabarito: jornada Metax (caso real, só neste repositório)

Itens que, na Metax, foram descobertos tarde ou nunca foram fechados. Fontes: `docs/analise/metax-retrospectiva.md`, `docs/analise/metax-github.md`, `docs/analise/metax-arquivos-locais.md`.

| # | Item | O que aconteceu na Metax |
|---|---|---|
| M1 | Conflito entre fontes: a Opção 2 (DEs sincronizadas, automação entre DEs, retorno ao Chatter) e a arquitetura do Guilherme (Apex e API direto na DE). Qual vale? | A especificação tirou esses itens do escopo depois; o consultor perguntou "qual é a demanda acertada?" |
| M2 | Por onde os vendedores falam de verdade com o lead (WhatsApp, e-mail do próprio consultor) e se isso conta como conversa | Descoberto com a integração no ar (#34, #35) |
| M3 | Estado dos dados: e-mails repetidos ou internos, tamanho dos campos, contatos sem vínculo com a oportunidade | #25 (campo curto derrubaria a carga), #37 (e-mail repetido), #4 |
| M4 | Para onde vai a resposta do lead, e de qual remetente sai o e-mail | Remetente noreply; a resposta do cliente é o que liga o "respondeu" |
| M5 | Quantos e-mails, quem escreve o texto e quem aprova | O número mudou de 3 para 9, 6 e 7; quem escreve mudou entre 30/09 e 01/10 |
| M6 | Aceite formal da especificação antes de construir | O código veio antes da especificação, que chegou ao rascunho 10 sem assinatura (#30) |
| M7 | Incerteza de ferramenta: o que o Journey Builder faz e não faz (por exemplo, juntar ramos) | Desenho refeito três vezes num dia |
| M8 | Objetivo próprio do cliente: o Raphael operar e aprender (o retorno ao Chatter era esse objetivo). Será atendido? | Ficou fora do construído |
| M9 | Em nome de quem ficam a rotina agendada e a credencial depois da entrega | A carga parou em 05/11, quando o usuário de terceiro foi desativado (#33) |
| M10 | Prazo em faixa contra "o quanto antes", com a espera pelo cliente separada | O calendário foi dominado pela espera do cliente |
| M11 | Opt-out e LGPD dos contatos | Tratado na #27, durante a execução |
| M12 | Trabalho bonificado sem instrumento formal: o que entra, prazo e aceite | Jornada bonificada sem contrato próprio |

Comportamento esperado: as mesmas regras do caso genérico. Destaque para M1: conflito entre fontes vira pergunta, e a skill não escolhe a versão mais conveniente.
