# Notas do teste real: o que ajustar na Lighthouse

Caso Ultracheese, começado em 16/11/2026. Cada nota vira proposta de mudança no encerramento.

1. **Transcrição sem separação de falante.** A tabela de confiança ("dito por quem faz", "dito por gestor") depende de saber quem falou. A skill não diz o que fazer quando não se sabe. Proposta: nível "dito na reunião, falante incerto".
2. **Nome incerto dentro da mesma fonte.** O sistema de roteirização aparece com quatro grafias. A skill trata conflito entre fontes, não nome incerto numa fonte só. Proposta: item de checagem "nomes próprios e sistemas conferidos".
3. **Duas skills chamadas juntas.** O operador chamou a Lighthouse e a fix-bug ao mesmo tempo. A skill diz de quem é cada caso, mas não diz o que fazer quando as duas vêm juntas. Funcionou anunciar a rota antes de começar.
4. **Confirmação sem resposta.** A primeira caixinha voltou sem resposta (reinício da sessão). A skill não diz como retomar a confirmação; refazer a caixinha mais curta funcionou.
5. **Operador pediu a explicação da skill em duas linhas, e duas linhas de verdade.** Vale ter, na skill, uma frase pronta de duas linhas curtas para quando perguntarem "para que serve".
6. **Material com data velha.** O material é de 12/11, a sessão é de 16/11, e a reunião de 13/11 já passou. A skill não manda perguntar se houve conversa depois do material antes de usá-lo.
7. **O teste do executor pegou de verdade.** A primeira leitura da sentença por um agente de fora achou 12 furos, entre eles duas contradições internas. Só 1 era de negócio; os outros eram regras de cálculo que ninguém tinha escrito. Proposta: o modelo da sentença ganha a seção "Regras de cálculo" (ou "Regras do desenho"), para não depender do teste para aparecer.
8. **A pergunta de piso nasceu no pre-mortem, não na checagem.** A checagem de cobertura não tem item sobre "amostra pequena gera número absurdo". Proposta: item O em Dados: "algum cálculo usa média? Com quanto dado ela vale?".
9. **O operador pediu foco nas perguntas.** Ele cortou a parte de registro no meio. Funcionou gravar estado e histórico em silêncio e só mostrar as perguntas. Proposta: a skill diz que o registro dos arquivos não se narra.
