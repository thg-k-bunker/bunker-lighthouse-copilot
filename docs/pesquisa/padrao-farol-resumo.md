# Padrão Farol: resumo da pesquisa

Resumo da página "Padrão Farol" publicada em 11/11/2026 pela aba "Boas práticas + case Metax": https://claude.ai/artifact/JxPWyRWc87mNqVonL6jcVp (privada). A página completa tem as fontes, os níveis de evidência e a linha do tempo da Metax. Os arquivos completos estão neste repositório: [`boas-praticas-execucao.md`](boas-praticas-execucao.md), [`evidencias.md`](evidencias.md), [`padrao-farol.html`](padrao-farol.html) (a página), [`../analise/metax-retrospectiva.md`](../analise/metax-retrospectiva.md), [`../analise/metax-repositorio-git.md`](../analise/metax-repositorio-git.md) e [`../analise/metax-github.md`](../analise/metax-github.md).

**Atenção:** a página foi escrita antes de algumas decisões desta skill e diverge delas em quatro pontos. Valem as decisões de [`../decisoes.md`](../decisoes.md):
- a página traz o mapa do terreno como primeiro passo, e ele deixou de ser obrigatório;
- a página propõe lotes de 2 a 4 perguntas independentes, e ficou uma por vez com a regra da fix-bug;
- a página propunha regras próprias de issue (arquivo `passos.json`, rito enxuto). Pela decisão de 11/11/2026, o processo no GitHub segue o padrão da Bunker e fica fora da Lighthouse;
- a página tem muitas etapas (visão de fora, pre-mortem, spikes, tolerâncias, quatro arquivos, revisor independente, AAR, métricas). Ainda não foi decidido o que entra na skill e o que fica só como referência.

## Conclusões

1. **O desenho está certo no essencial.** Separar conhecimento de execução e executar contra um documento fechado é o que a Anthropic recomenda para agentes em tarefas longas, e o que Flyvbjerg (Oxford, mais de 16.000 projetos) resume como "pensar devagar, agir rápido".
2. **A maior ameaça é o falso "pronto".** Projetos parecem 90% prontos e levam o dobro (Ford e Sterman, MIT). Agentes declaram vitória cedo (Anthropic). Desenvolvedores com IA ficaram 19% mais lentos achando que estavam 20% mais rápidos (METR). Nada fecha sem evidência.
3. **A sentença fixa o resultado, não todos os passos.** Ela traz o resultado, o critério de pronto e as tolerâncias. Os passos se revisam dentro das tolerâncias.
4. **Na Metax, o retrabalho nasceu no mapeamento, não na execução técnica.**
5. **O maior gargalo foi não ter processo definido.** No GitHub da Metax, o trabalho de controle (rótulos, prints, comentários) foi quase todo do agente e pesou pouco no tempo humano, e o rito de correção pegou defeitos reais. O que faltou foi um caminho padrão do entendimento à entrega.
6. **Lição só vale se mudar o processo.** Na NASA, o banco de lições quase não é consultado. Cada lição precisa virar regra, pergunta ou item de checklist.

## Regras que a Metax deixa

| Onde | Regra | Origem |
|---|---|---|
| Conhecimento | Toda fala de especialista vira requisito escrito, com fonte e data | O tensor, explicado em 01/07 e ausente da proposta |
| Conhecimento | Todo item listado tem horas e critério de aceite | 13 itens "incluídos" com 0 h |
| Conhecimento | Auditar os dados reais: volume, inativos, duplicados, donos de jobs e integrações | Base suja, carga parada em 05/11 |
| Conhecimento | Perguntar por onde as pessoas realmente falam com o cliente | WhatsApp e e-mail do consultor (#34, #35, #38) |
| Conhecimento | Mapear quem decide de fato | Decisor comercial só mapeado em 20/10 |
| Conhecimento | Conferir no ambiente o estado do que o escopo liga ou desliga | NPX |
| Conhecimento | Escrever se o objetivo declarado pelo cliente será atendido ou não | Objetivo de aprendizado fora do que foi construído |
| Conhecimento | Data prometida nunca antes do fim da estimativa | Go-live prometido para 01/07 contra 30 a 45 dias |
| Conhecimento | Incerteza de ferramenta vira teste curto antes do desenho | Journey Builder não junta ramos |
| Execução | Nada em produção antes do aceite da sentença | Carga em produção em 03/10, sem aceite |
| Execução | Seguir um processo definido desde o primeiro dia, com WSJF na execução | Etapas decididas na hora; WSJF aplicado em 08/10 |
| Execução | Checklist de acessos e permissões 48 h antes de presencial ou demo | Usuários sem permissão no presencial |
| Execução | O "onde paramos" mora no repositório e é commitado a cada marco | Arquivo só local, sem histórico |
| Encerramento | Nenhum job, integração ou credencial no nome de terceiro | #33 e a parada de 05/11 |
| Comercial | Trabalho bonificado só com instrumento formal | Jornada bonificada sem contrato próprio |

## O que deu certo e deve virar padrão

- Teste vermelho antes da correção e ficha de evidência por issue (defeito, causa, correção, prova, antes e depois).
- Backup antes de toda mudança em produção.
- Roteiro de implantação com conferência, reversão e ok humano na hora.
- Decisões com nome e data; fronteira de escopo explícita na especificação.
- Revisão independente, que pegou a #25 antes de chegar à produção.
