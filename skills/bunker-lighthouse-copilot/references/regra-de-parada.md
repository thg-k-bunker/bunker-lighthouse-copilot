# Regra de parada

A completude do levantamento depende mais de quando se decide parar do que da experiência de quem levanta. Quem para por sensação para cedo demais. Por isso a parada tem regra.

## As seis condições

O levantamento acaba quando as seis valem ao mesmo tempo:

1. **Cobertura fechada.** Todo item **O**, todo **T** aplicável, as lentes presentes e os itens do especialista estão respondidos, assumidos, verificados ou fora de escopo. Nenhum está em "pergunta" ou "em verificação".
2. **Quatro riscos tratados.** Vão usar, conseguem usar, dá para construir, faz sentido para o negócio: cada um com uma frase de evidência ou com a premissa a testar.
3. **Saturação.** As duas últimas perguntas ou fontes não trouxeram nada que mude o escopo.
4. **Quem conduz confirmou** o entendimento e o fora de escopo.
5. **Teste do executor.** Um agente que não participou do levantamento, lendo só a sentença, consegue estimar em faixa e começar sem nova pergunta de negócio.
6. **Maior incerteza nomeada,** com o plano para resolvê-la logo depois do que destrava o caminho crítico.

**Proporção.** Em trabalho pequeno e fácil de desfazer, uma premissa explícita vale mais que mais uma pergunta. Em trabalho caro de desfazer (modelo de dados, integração, migração), pergunta-se até a saturação.

## Antes de emitir

- Em perfil alto, ou com ação irreversível no plano: pre-mortem. "Daqui a X semanas isto fracassou; por quê?" Listar as causas concretas e levar as principais para a sentença como risco, com o que se faz para evitar cada uma.
- Conferir que toda inferência usada como requisito cita o trecho da fonte ou leva o rótulo "premissa".
- Conferir que toda recomendação aceita trouxe o motivo e a alternativa mais forte.
- Mostrar as premissas ainda não confirmadas a quem conduz, numa caixinha só.

## Antipadrões

| Antipadrão | Por que evitar |
|---|---|
| Aceitar a solução como requisito ("quero um campo") | Esconde o problema e trava a melhor solução |
| Perguntar opinião ou futuro ("vocês usariam?") | As pessoas descrevem o trabalho de um jeito e fazem de outro. Pergunta-se o último caso real |
| Formulário com vinte perguntas de uma vez | Mais abandono e respostas piores |
| Parar por sensação ("já entendi") | Para cedo demais |
| Tratar inferência do Claude como fato | Boa parte das inferências não se confirma |
| Escopo sem fora de escopo e sem critério de aceite | No fim, o aceite depende de opinião |
| Estimar sem abrir o ambiente e os dados | A estimativa nasce errada |
| Prometer data única e misturar esforço com espera pelo cliente | O calendário passa a ser dominado pela espera, e ninguém vê |
| Começar a construir antes da sentença | O código passa a definir o escopo, e a sentença só descreve o que já foi feito |
