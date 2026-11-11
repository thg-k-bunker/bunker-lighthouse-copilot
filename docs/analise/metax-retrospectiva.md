> Retrospectiva reconstruída de SharePoint, e-mail, Teams e do repositório metax-salesforce (11/11/2026). Complementa [`metax-arquivos-locais.md`](metax-arquivos-locais.md).

# Retrospectiva Metax (Bunker): mapeamento → execução

Escopo: reestruturação Salesforce/Sales Cloud (Blocos 1 e 2) e jornada de nutrição de fundo de funil no Marketing Cloud (MC). Reconstruído só a partir de artefatos; "inferência" marca o que não está escrito em nenhuma fonte.

## 1. Linha do tempo resumida

| Data | Marco | Fonte |
|---|---|---|
| 09/04 | Alinhamento do fluxo de propostas com Daniel N., Fábio V. e Ronaldo L. (trechos, unidade única por item, locação/venda/serviço) | FLUXO PARA PROPOSTAS NO CRM - DESC.pdf |
| 15/04 | Metax envia o fluxo macro (Bizagi v1.0) | Fluxo macro Processo CRM Salesforce_Vs01.pdf |
| 09/06 | Documento Funcional (4 evoluções: modelos, camada de engenharia, visita prévia, DocuSign) | Documento Funcional – Ajustes e Evoluções Salesforce.docx |
| 12/06 | Retrieve inicial do org (único commit até 28/09) | repo metax-salesforce, git log |
| 16/06 | Proposta Rev 02: Bloco 1 = 52 h; meta de go-live em 01/07; Bloco 1 em "30 a 45 dias" após o aceite | Metax 1.pdf, p. 10 e 23 |
| 01/07 | Reunião de alinhamento (Vitor, Virginia, Daniel): modelagem de produto e de preço | Alinhamento Metax (1).docx |
| 07/07 | Contrato guarda-chuva 00000124 (B1 52 h + B2 31 h) | caderno 2026-10-20-metax.md |
| 14/07 | Guias entregues (Importação, Sandboxes, Relatórios, Produtos de Oportunidade) | pasta 3 - Documentos entrega Bunker |
| 13/08 | Planilha de validação da Metax, com a classificação de escopo feita pela Bunker | VALIDAÇÃO CRM SALESCLOUD SALESFORCE1.xlsx |
| 26/08 | Alinhamento com o Vitor: 15 itens concluídos e 8 pendentes; prazo até 11/09 | Projeto Salesforce - alinhamento Vitor 26-08-26.xlsx (aba plan1) |
| 14/09 | Go-live do Sales Cloud | caderno 20/10 |
| 23 e 24/09 | Jornada MC bonificada oferecida; a Metax escolhe a "Opção 2" | e-mail "Jornada Marketing Cloud Bonificada", 23 a 25/09 |
| 28/09 a 09/10 | Execução da jornada: issues #2 a #42, PRs #22 a #46; carga diária em produção desde 03/10 | Jornada Metax - 30.09.pdf; Deck Jornada Metax.pdf |
| 10/10 | Issues fechadas para zerar o quadro, antes do aceite | nota Teams 48:notes, 13/10 |
| 14/10 | E-mail pedindo o aceite: Raphael responde "de acordo"; Virginia não | e-mail "…aceite da entrega", 14 e 19/10 |
| 19/10 | Ordem de segurar as entregas até haver contrato novo; a conversa passa ao Lucas | Teams, Guilherme, 19/10 |
| 21/10 | Reunião de entrega e envio do guia | e-mails de 19 e 21/10 |
| 05/11 | A carga diária para: o usuário da DaspeWeb, dono do job, foi desativado | e-mail "a carga diária parou?", 05/11 |

Desvio de prazo: a Rev 02 previa o go-live em 01/07, mas o go-live real foi em 14/09, cerca de 10 semanas depois do contrato, contra os 30 a 45 dias estimados.

## 2. Fase de mapeamento (abril a julho)

**O que foi levantado e com quem.**
- Fluxo comercial ponta a ponta, com raias Comercial, Engenharia e Contratos/Protheus. Autora: Virginia (Projetos), em 15/04.
- Regras de proposta, com a engenharia e o comercial (09/04): trecho obrigatório, item com uma só unidade (kg, m², m, m³ ou PC), separação entre locação, venda e serviço, logística por viagem e consolidação por trecho.
- Planilhas de cálculo da engenharia (fôrma, escoramento, fachadeiro e speed), no SharePoint entre 25 e 29/06.
- Em 01/07, a Virginia trouxe a decisão de "vender a solução num primeiro momento" e de tirar a precificação: "vamos colocar o básico… depois… a integração" com o Protheus. O Daniel explicou que a forma é a única solução com locação e venda juntas, e que o tensor é venda (Alinhamento Metax, 9:07 a 11:46 e 24:42 a 29:35).

**O que ficou de fora ou foi assumido sem validar.**
- *Camada de engenharia, crédito, DocuSign e Protheus "incluídos" sem horas.* Os itens 4 a 16 do Bloco 1 entraram na proposta com 0 h; as 52 h ficaram só em limpeza, NPX e modelos (Metax 1.pdf, p. 10).
- *Modelo "por trecho".* As regras de 09/04 não aparecem na Rev 02. **Inferência:** o modelo foi abandonado sem registro de decisão.
- *Requisito do tensor na proposta de Formas.* Foi dito em 01/07, mas a Bunker o classificou em 13/08 como "requisito específico não formalizado" (VALIDAÇÃO CRM, aba Bunker).
- *Qualidade da carteira de clientes.* Só foi avaliada no presencial: "quantidade relevante de registros que não deveriam ser levados". A base final foi pedida ao TI em 04/09, com entrega até 08/09, a seis dias do go-live (alinhamento 26/08).
- *Hierarquia e decisores.* A aprovação de crédito ia para a backoffice em vez do gerente (26/08, B1-10, item 6). O Diretor Comercial "nunca falou com a Bunker", e isso só apareceu em 20/10 (caderno, P6).
- *Sequência entre Bloco 1, presencial e Bloco 2.* A proposta não define a ordem, e foi preciso escrever uma análise de interpretação depois (Analise_Proposta_Metax_Presencial.docx: "obrigatório não significa automaticamente 'antes do presencial'").

## 3. O que deu certo

1. **O processo do cliente virou especificação com critério de aceite.** A Rev 02 reproduz o fluxo macro e traz EF-1 a EF-11, cada uma com "critério de aceite" (Metax 1.pdf, p. 4 e 18 a 22).
2. **O especialista certo entrou na reunião na hora.** Em 01/07, a Virginia chamou o Daniel ao vivo e as dúvidas de forma e tensor foram resolvidas na mesma reunião (transcrição, 13:51 a 32:54).
3. **O MVP foi simplificado com o cliente,** sem integração com o Protheus e sem SKU fino ("tem 20 mil itens… não vamos ter todo aquele monte de gravata", 01/07, 10:33).
4. **Rastreabilidade de escopo.** Cada pedido da Metax foi casado com o item da proposta e classificado como Bloco 1, Bloco 2 ou fora de escopo (VALIDAÇÃO CRM, 13/08, aba Bunker).
5. **Pendências com dono e data:** "Solicitado para TI em 04/09 para entregar até 08/09/26"; 15 concluídos e 8 pendentes (alinhamento 26/08).
6. **Jornada MC com verificação forte.**
   - Sandbox antes da produção.
   - Revisão independente medida na produção: a #25 derrubaria a primeira carga (8 de 74 contatos) e foi corrigida antes de subir (Document.docx, 29/09).
   - Semana de aceite com 7 de 7 cargas e 7 de 7 e-mails testados (Deck Jornada Metax.pdf, slide 9).
   - Guia de operação entregue (Guia Jornada Metax.pdf, 09/10).
7. **Riscos registrados por escrito:** a #33 (rotina com o usuário da DaspeWeb) e o fim do EWS (nota de 13/10, itens 4 e "Passagem").

## 4. O que deu errado ou custou retrabalho

| # | Problema | Evidência | Causa-raiz provável | Classe |
|---|---|---|---|---|
| E1 | Treze itens de processo (crédito, engenharia, DocuSign, Protheus) entraram "sem cobrança". A camada de engenharia acabou reinterpretada como "cálculos permanecem nas ferramentas… anexados" e recebeu 8 correções da Metax | Metax 1.pdf p. 10; alinhamento 26/08, B1-10 | Escopo cedido para fechar a venda, sem estimar o esforço real | Priorização |
| E2 | O tensor não aparece na proposta de Formas. Os 8 modelos voltaram com ajustes de imposto (9,75% para 9,25%), data, cidade, número, vendedor, filial e campos obrigatórios | VALIDAÇÃO CRM 13/08; alinhamento 26/08, B1-03 | A informação dita em 01/07 não virou requisito escrito; os modelos não foram validados campo a campo antes do build | Mapeamento |
| E3 | NPX: a proposta manda desativar e trata a reativação como fora de escopo; a Metax pede "deixar o NPX… será utilizado depois"; a Bunker responde "desativação já ocorrida". Mesmo assim, o trigger do NPX quebrava a criação de oportunidades na sandbox em 29/09 | Metax 1.pdf p. 8 e 24; VALIDAÇÃO 13/08; docs/jornada-mc/implantacao.md §3 | Expectativa divergente desde 01/07 ("NPX… guardadinho") e estado do org não verificado | Comunicação/expectativa + verificação |
| E4 | Carteira de clientes suja, critérios de distribuição de leads e base final só resolvidos às vésperas do go-live | alinhamento 26/08 (B2-02, B2-07) | Dados e regras não foram auditados na descoberta | Mapeamento |
| E5 | Usuários sem permissão no presencial (DocuSign) e engenharia sem acesso | VALIDAÇÃO 13/08 ("permissionamento… não estava habilitado"); aba RP de 26/08 | Faltou checklist de prontidão antes da agenda | Verificação |
| E6 | Disputa sobre o que o presencial cobria e cobrança contestada; casos travados em aceite cerca de 40 dias | Analise_Proposta_Metax_Presencial.docx; furos-taxonomia.md F14 ("4 Metax presos ~40 dias desde 19/05… cobrança contestada") | A proposta não definia a sequência nem a regra de consumo de horas | Comunicação/expectativa |
| E7 | Go-live prometido para 01/07 numa proposta de 16/06 que estima 30 a 45 dias; o real foi 14/09 | Metax 1.pdf p. 23; caderno | Data-meta incompatível com a própria estimativa | Priorização/expectativa |
| E8 | Jornada MC: a "Opção 2" vendida previa Synchronized DEs, automação entre DEs e retorno ao Chatter, que era o objetivo de aprendizado do Raphael. O construído usou Apex e API direto na DE, e a especificação passou esses itens para "fora do escopo". O próprio consultor perguntou "qual é a demanda acertada?" | e-mails de 23 e 24/09; Teams de 25/09; especificacao.md §4; Document.docx ("precisa ser alinhado com o Raphael (#20)") | Prazo de "até 15 dias úteis" e arquitetura definidos antes de mapear o objetivo do cliente | Mapeamento + comunicação |
| E9 | Especificação escrita depois do build (rascunhos 1 a 10, até 07/10, com a carga em produção desde 03/10). Issues #30 (aceite) e #42 (reunião) fechadas em 10/10 sem aceite; o aceite formal da Virginia nunca chegou | especificacao.md; nota de 13/10 | Pressa para "zerar o quadro" (e-mail de 09/10: "meta… zero issues abertas") | Verificação |
| E10 | A carga parou em 05/11 porque o job pertencia ao usuário da DaspeWeb, que foi desativado. O risco já constava na #33 (P2, "revisar no fim") e na nota de 13/10 | e-mail de 05/11; README WSJF (#33) | Risco conhecido mas despriorizado (urgência 1), e sem troca de dono do job no handoff | Técnica/priorização |
| E11 | Contrato de dados com 40 caracteres sem conferir a picklist (#25) | Document.docx: "A causa da #25 foi nossa" | Faltou perfilar os dados reais | Técnica |
| E12 | A mesma pergunta apareceu em várias conversas; a reunião de entrega foi marcada depois da ordem de segurar; a jornada foi "bonificada" sem contrato próprio, e o guia prometido em 14/10 foi retido em 19/10 | caderno P2; Teams 19/10; etapas-ia.md ("contrato guarda-chuva antigo") | Dono da conta indefinido e bonificação sem instrumento formal | Comunicação |

## 5. Lições acionáveis (regras para a skill de workflow)

**Na fase de conhecimento:**
1. Sempre transformar cada fala de especialista numa linha de requisito com fonte (reunião, minuto, data) e pedir confirmação escrita antes de orçar (E2).
2. Sempre registrar as decisões de "não fazer" (ex.: modelo por trecho, precificação, integração com o Protheus) num log de decisões assinado (E2, E3).
3. Sempre estimar horas para todo item listado. Nunca escrever "incluído, sem cobrança" num item de processo sem horas e sem critério de aceite mensurável (E1).
4. Sempre auditar os dados reais antes de fechar o escopo: volume, inativos, duplicados, tamanho de picklists e quem é dono de jobs e integrações (E4, E10, E11).
5. Sempre mapear a hierarquia no org (User, UserRole, Manager) e o decisor econômico antes da proposta, e não só o usuário-chave (seção 2, "Hierarquia e decisores"; caderno P6).
6. Sempre ler o objetivo declarado pelo cliente (ex.: "entender Synchronized DEs") e escrever na proposta se ele será atendido ou não (E8).
7. Sempre conferir no org o estado de pacotes e automações que o escopo liga ou desliga (NPX) e documentar a divergência com o cliente (E3).
8. Sempre amarrar a data-meta à estimativa e aos insumos do cliente; nunca prometer go-live anterior ao fim da estimativa (E7).
9. Sempre definir na proposta a sequência entre os blocos e o presencial e a regra de consumo de horas (E6).

**Na execução:**
10. Nunca construir antes do aceite da especificação; a especificação vem antes do código (E9).
11. Nunca fechar uma issue de aceite, reunião ou ativação sem a evidência do evento (E9).
12. Sempre rodar um checklist de prontidão (acessos, permissões, licenças) 48 h antes de presencial ou demo (E5).
13. Nunca deixar job, integração ou credencial no nome de terceiro ou de consultor no handoff; um risco P2 com impacto 5 bloqueia o fechamento (E10).
14. Sempre manter o repositório igual ao org durante toda a obra, e não só na fase final (inferência: o Sales Cloud não foi versionado entre 12/06 e 25/09; o PR #22 de "drift" veio em 28/09).
15. Sempre manter um único dono de conversa por conta e um único caderno; nunca repetir uma pergunta já feita em outra thread (E12).
16. Nunca entregar trabalho bonificado sem instrumento (caso ou contrato) que diga o que é, o prazo e o aceite (E12).

## 6. Lacunas

- **GitHub:** a API recusou o acesso (403). Não li corpos, comentários nem a #20 (descartada); usei o README WSJF, os docs e o git log do clone local, além de resumos em PDF e e-mail.
- **Conversas diretas no Claude:** inacessíveis. O caderno de 20/10 é o único registro de uma delas.
- **Outlook e Teams:** a caixa é do Thiago Klock, e nenhum e-mail sobre a Metax anterior a 15/08 apareceu; o Teams não traz nada de antes de 21/09. A troca de e-mails de abril a julho (Rev 01, de 28/05, e as considerações da Virginia) não foi encontrada.
- **WhatsApp:** usado para definições (23/09; "explicado… via whats app" em 13/08), sem acesso.
- **Não localizados:** notas do presencial de julho, transcrição read.ai de 21/10 e o contrato 00000124 (visto só pelo caderno).
- **Não lidos na íntegra:** Guia Jornada Metax.pdf, textos-e-logica-emails.docx e os guias de 14/07.
- **Implementação no Sales Cloud:** não verifiquei o que foi de fato implementado (por exemplo, trechos ou tensores no PDF atual). As afirmações vêm das planilhas da Metax e da Bunker.
