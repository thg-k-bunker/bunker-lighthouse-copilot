# Testes de comportamento da Lighthouse

Testam o que os evals de roteamento não testam: se a fase de conhecimento levanta o que precisa ser levantado. Cada caso tem a entrada (o que quem conduz colaria) e o gabarito (o que a skill deveria levantar), escritos antes de rodar.

Como rodar: um agente que não viu o gabarito lê `skills/bunker-lighthouse-copilot/` e a entrada, e devolve o entendimento, o perfil, o resultado da checagem de cobertura e a lista de perguntas. A correção compara com o gabarito, item por item.

| Caso | Onde pode ir | Por quê |
|---|---|---|
| `generico-clinica` | Pode ir para o plugin | Caso inventado, sem cliente real |
| `metax-jornada` | **Só neste repositório** | Caso real, o único com gabarito do que de fato faltou. Nada dele vai para o plugin (decisão de 12/11/2026) |
