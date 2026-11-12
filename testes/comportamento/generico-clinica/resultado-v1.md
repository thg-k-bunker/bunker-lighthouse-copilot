# Resultado v1: Clínica Sorriso Pleno

Rodado em 12/11/2026 sobre o rascunho `0574b8a`, por um agente que leu só a skill e a entrada.

## Cobertura contra o gabarito: 10 de 10

| # | Item | Levantou? | Onde |
|---|---|---|---|
| C1 | Duas fontes da agenda, API ou exportação | Sim | P1, P2, O15, E10 |
| C2 | LGPD de dado de saúde e consentimento | Sim | O14, E3 (opt-in), E8 |
| C3 | Canal do lembrete e em nome de quem fica a conta | Sim | P7, P9, E4 |
| C4 | Paciente que cancela ou remarca pela resposta | Sim, em parte | P8 (desmarcou), caso de P7 |
| C5 | Como medir: faltas e horas da recepção | Sim | O2, E1 |
| C6 | Exceções: sem celular, menor, consulta no mesmo dia | Sim | O9, E6, E7 |
| C7 | "Mês que vem" contra estimativa em faixa | Sim | P4, O28 |
| C8 | Custo das mensagens e orçamento | Sim | P6 |
| C9 | Quem mantém depois | Sim | P9 |
| C10 | Problema separado da solução pedida | Sim | passo 4 explícito |

Comportamento: entendimento em 4 linhas e perfil em uma, recomendação com motivo, caso concreto e alternativa mais forte em cada pergunta, nenhuma pergunta sobre quem decide ou quem paga.

## O que o teste mostrou de errado na skill

- **Peso:** 9 perguntas na fila e um questionário de 9 itens. Contraria "natural, sem interrogatório".
- **Status intermediários faltando:** não existem "vira pergunta", "em verificação" nem "não se aplica".
- **Confirmação do entendimento sem formato:** não diz que vai em caixinha nem se a checagem pode rodar antes dela.
- **Conflito entre "ninguém citado" e a lente 8,** que pergunta o responsável legal.
- **Recomendação forçada em pergunta de fato** ("qual é o sistema?").
- **Fonte citada de memória** na camada 3 sem marca de "não conferido".
- **Projeto sem repositório** sem regra.
- **Data dada pelo cliente antes de haver estimativa** sem regra.
- **"Algo simples" do cliente confundido com modo leve.**
