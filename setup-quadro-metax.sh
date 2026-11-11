#!/usr/bin/env bash
# Monta o quadro de issues da Jornada de Nutrição da Metax.
# Origem do plano: e-mail aprovado (Opção 2, 24/09/2026) + chamadas com o Guilherme (24/09 e 25/09/2026).
# Rodar uma vez só. Rótulo que já existe é ignorado.
set -euo pipefail
R=Bunker-Growth-and-Sales-Intelligence/metax-salesforce

# ---------- 1. Rótulos ----------
mk(){ gh label create "$1" -R $R --color "$2" --description "$3" >/dev/null 2>&1 && echo "rótulo: $1" || true; }
for v in 1 2 3 5 8 13; do
  mk bv-$v 0E8A16 "Valor de negócio $v"; mk rr-$v 1D76DB "Redução de risco $v"
  mk tc-$v D93F0B "Urgência $v";        mk SP-$v C5DEF5 "Tamanho $v"
done
mk P0 B60205 "WSJF 8 ou mais"; mk P1 D93F0B "WSJF 5 a 7,99"; mk P2 FBCA04 "WSJF 3 a 4,99"; mk P3 C2E0C6 "WSJF abaixo de 3"
mk type-feat A2EEEF "Funcionalidade nova"; mk type-docs 0075CA "Documentação"
mk type-infra 5319E7 "Infraestrutura e ambiente"; mk type-refactor BFD4F2 "Refatoração"
mk e0-nao-lida EDEDED "Chegou e ninguém olhou"; mk e1-medindo FEF2C0 "Premissa em medição"
mk e2-provado BFDADC "Vermelho e verde feitos"; mk e3-aguardando-deploy F9D0C4 "Pronto, não implantado"
mk e4-no-ar C2E0C6 "Implantado, sem prova de tela"; mk e5-reteste D4C5F9 "Em reteste"
mk e6-validado 0E8A16 "Provado, pronto para fechar"
mk bloq-decisao B60205 "Parado esperando decisão de negócio"; mk cliente-facing 006B75 "O cliente enxerga"
mk in-progress 1D76DB "Rito em andamento"; mk discovered FBCA04 "Achado durante o trabalho"

# ---------- 2. Milestones ----------
ms(){ gh api repos/$R/milestones -f title="$1" -f description="$2" >/dev/null && echo "milestone: $1"; }
M1="Descoberta e acessos";                     ms "$M1" "Mapear o Sales Cloud da Metax e obter os acessos necessários."
M2="Ambiente de desenvolvimento";              ms "$M2" "Sandbox, massa de teste e GitHub alinhado com a org."
M3="Integração Sales Cloud → Marketing Cloud"; ms "$M3" "Schedulable + Batch em Apex que higieniza as 4 tabelas e envia ao Marketing Cloud via API."
M4="Marketing Cloud";                          ms "$M4" "DE central de contatos, pacote de API e teste ponta a ponta."
M5="Jornada de nutrição";                      ms "$M5" "Jornada no Journey Builder com entrada pela régua de data."
M6="Documentação e entrega";                   ms "$M6" "Passo a passo para o Raphael, status diário e alinhamento com o cliente."

# ---------- 3. Issues ----------
# uso: issue "<milestone>" "<rótulos separados por vírgula>" "<título>" <<'MD' ... MD
issue(){ local n; n=$(gh issue create -R $R --milestone "$1" --label "$2" --title "$3" --body-file - | grep -o '[0-9]*$'); echo "#$n  $3"; LAST=$n; }

# ===== M1 · Descoberta e acessos =====
issue "$M1" "type-infra,e6-validado,bv-5,rr-8,tc-5,SP-2,P0" "Mapeamento do Sales Cloud da Metax para a jornada" <<'MD'
Levantamento feito em 25/09/2026, só leitura, na produção da Metax (`sf` CLI, alias `metax`, org `00DKj000002YvucMAC`, `IsSandbox=false`).

| Pergunta | Resposta medida |
|---|---|
| Onde está o público? | `Opportunity` → `OpportunityContactRole` → `Contact`, com `Account` para a empresa |
| A Metax usa Contact Roles padrão? | Sim. `OpportunityContactRole` é o objeto nativo, sem customização |
| Existe dado de obra? | Sim. Objeto `Obra` (`DWObra__c`), ligado à oportunidade. Tem endereço completo e `DWTipoObra__c` |
| Volume | 108 oportunidades abertas; 70 com contato vinculado; 64 contatos únicos (uma contagem posterior no mesmo dia deu 109 abertas) |
| Marketing Cloud Connect | Instalado (pacote `et4ae5`), mas a Business Unit "Metax" (MID 546010257) está com `Enabled__c = false`, com 0 envios e 0 jornadas. A arquitetura escolhida não depende dele |
| `CloseDate` serve para medir recência? | Não. 84 das 109 têm data futura: é a data prevista de fechamento |
| Há histórico para calibrar a régua? | Ainda não. Todas as 109 oportunidades foram criadas nos últimos 15 dias. `LastActivityDate` está preenchido em só 30 |
| Sandboxes existentes | `MetaxCP` e `Bunker`, ambas Developer |

A evidência é a saída das consultas (não há tela a fotografar): `describe` de Opportunity, OpportunityContactRole, Contact e `DWObra__c`, e as contagens acima.

Reportado por: Thiago Klock, mapeamento pedido pelo Guilherme na chamada de 24/09/2026.
MD
gh issue close $LAST -R $R --reason completed >/dev/null

issue "$M1" "type-infra,e0-triagem,bloq-ambiente,bv-5,rr-8,tc-3,SP-1,P0" "Acesso de administrador ao Marketing Cloud da Metax" <<'MD'
Sem usuário administrador no Marketing Cloud não dá para criar a DE central nem o pacote de API.

- Pedido feito à Virginia (Projetos, Metax) por e-mail em 25/09/2026.
- Em 25/09 a Metax respondeu que o Rafael vai criar o usuário.
- Em 28/09 o usuário já existia, mas a senha recebida não funcionou. Redefinição pedida ao Rafael por e-mail em 28/09/2026. Aguardando retorno.
- Precisa ser **administrador**. Com usuário comum não se cria pacote instalado nem DE.

Não trava o começo: toda a integração é feita e testada no Sales Cloud com o Marketing Cloud simulado. Trava a milestone "Marketing Cloud".
MD

issue "$M1" "type-infra,e0-triagem,discovered,bv-3,rr-3,tc-2,SP-2,P2" "38 oportunidades abertas sem contato vinculado ficam fora da jornada" <<'MD'
Das 108 oportunidades abertas, 38 não têm `OpportunityContactRole`. A jornada parte do contato da oportunidade, então essas 38 não entram.

Falta saber: é esquecimento de cadastro ou venda que de fato não tem contato? Se for esquecimento, a correção é de processo comercial, no lado da Metax, e não na integração.

Achado no mapeamento de 25/09/2026.
MD

# ===== M2 · Ambiente de desenvolvimento =====
issue "$M2" "type-infra,e0-triagem,bv-5,rr-8,tc-8,SP-1,P0" "Sandbox para desenvolver a integração" <<'MD'
Regra do Guilherme (chamada de 25/09/2026): nada se desenvolve na produção da Metax. A integração nasce numa sandbox.

- A org já tem duas sandboxes Developer: `MetaxCP` e `Bunker`.
- Login de sandbox: `test.salesforce.com`.
- Escolhida a `Bunker` (copiada em 22/06/2026). O usuário `metax@daspeweb.com.br.bunker` existe lá. Vale a senha de antes de 31/08, quando a da produção foi trocada. Em 28/09 aguardando essa senha do Vitor Viana; se não vier, o Guilherme redefine na sandbox.
- Sandbox nasce sem dados (ver a issue da massa de teste).

Pronto quando: a sandbox está ativa e conectada ao `sf` CLI com alias próprio.
MD

issue "$M2" "type-infra,e0-triagem,bv-3,rr-5,tc-5,SP-2,P1" "Massa de teste na sandbox: conta, contato, oportunidade e contato da oportunidade" <<'MD'
A sandbox Developer vem sem registros. Para a integração ter o que ler, criar pelo menos:

- contas com contatos;
- oportunidades abertas **com** `OpportunityContactRole` (o caso principal);
- uma oportunidade aberta **sem** contato vinculado (o caso das 38 da produção);
- um contato em duas oportunidades (tem que virar **um** registro só na DE);
- uma oportunidade fechada (não pode entrar);
- uma oportunidade com `Obra` preenchida.

Os cenários espelham o que o mapeamento achou na produção.

**Regras de validação que a massa precisa respeitar** (lidas em 28/09/2026, as mesmas valem dentro dos testes Apex):
- Conta: as 24 regras de cadastro só disparam quando `StatusCadastro__c` muda para "Em cadastro" ou "Cadastrado". Conta de teste criada sem mexer nesse campo não esbarra em nenhuma.
- Oportunidade nova nasce em "Aberto" (V8) e anda uma fase por vez (V9). Para sair de "Aberto" rumo às fases de venda precisa de produto (V1).
- A oportunidade fechada sai barata: "Aberto" → "Fechado Perdido" direto é permitido (fora de V1, V9 e V10). Só exige `DWMotivoFechamento__c` (V4).
- O nome da oportunidade é gerado automaticamente (V12). O teste não pode depender de um nome escolhido por ele.
MD

issue "$M2" "type-infra,e0-triagem,bv-5,rr-8,tc-5,SP-3,P1" "GitHub 3 meses atrás da org: versionar o código real na main" <<'MD'
Apontado pelo Guilherme em 25/09/2026: o código na `main` está desatualizado há 3 meses em relação à org da Metax. O GitHub precisa mostrar a versão correta.

Como: puxar os metadados da org para uma branch e abrir PR para a `main`. O PR mostra exatamente o que mudou nesses 3 meses.

**Medido em 28/09/2026** (commit local `0ab8c8a`, branch `chore/sincronizar-org-2026-09-25`, ainda sem push):
- último retrieve na `main`: 12/06/2026;
- 394 componentes alterados e 685 novos (818 arquivos de tradução de objeto). O primeiro número bruto, 5.678, era quebra de linha do Windows, e não mudança;
- código novo é pouco: 4 classes Apex e 1 trigger, do fluxo de aprovação e da proposta. O resto é configuração (objetos, flows, perfis);
- `sfdx-project.json` apontava para `src`, pasta que não existe; corrigido para `force-app`. Sem essa correção nenhum retrieve futuro apareceria no Git;
- manifesto novo gerado da org: 4.315 componentes (3.766 em junho). O manifesto antigo listava tudo por nome e deixaria de fora o que foi criado depois;
- conferido antes do commit: nenhuma senha, token ou chave nos arquivos.

Pronto quando: PR mesclado e a `main` batendo com o que está na org.
MD

# ===== M3 · Integração Sales Cloud → Marketing Cloud =====
issue "$M3" "type-docs,e0-triagem,bv-8,rr-8,tc-5,SP-2,P0" "Contrato de dados da DE central: um registro por contato" <<'MD'
Arquitetura definida pelo Guilherme (chamadas de 24 e 25/09/2026): uma tabela central de contatos, no mesmo modelo usado no Grupo Barigui.

- Chave: o contato. Cada pessoa aparece **uma vez só**.
- Campos base: nome, sobrenome, e-mail, **data da última oportunidade** e dados da obra.
- A data da última oportunidade não pode vir de `CloseDate` (é data prevista, quase sempre futura). Candidatos: `CreatedDate` da oportunidade ou `LastModifiedDate`. Decidir aqui.

Esse contrato é o que a Batch monta e o que a DE do Marketing Cloud recebe.
MD

issue "$M3" "type-feat,e0-triagem,bv-8,rr-5,tc-5,SP-3,P1" "Classe Batch: higienizar as 4 tabelas e montar um registro por contato" <<'MD'
Os dados estão em 4 tabelas sem visão central: `Account`, `Contact`, `Opportunity` e `OpportunityContactRole`. A Batch junta tudo e entrega o registro do contrato de dados.

- Apex, sem Flow (orientação do Guilherme).
- Contato em várias oportunidades vira um registro, com a data mais recente.
- Oportunidade fechada não entra.

Teste antes do código (TDD): o teste precisa ficar vermelho antes da classe existir.
MD

issue "$M3" "type-feat,e0-triagem,bv-8,rr-8,tc-5,SP-3,P1" "Envio ao Marketing Cloud via API com Named Credential" <<'MD'
A Batch envia os registros ao Marketing Cloud por chamada de API (integração de saída).

- Credencial numa **Named Credential**. Nunca fixa no código (orientação do Guilherme).
- Nos testes a resposta do Marketing Cloud é simulada (`HttpCalloutMock`): teste Apex não pode chamar outro sistema.
- Por isso essa issue anda sem o acesso ao Marketing Cloud; só o teste real depende dele.
MD

issue "$M3" "type-feat,e0-triagem,bv-5,rr-3,tc-5,SP-1,P0" "Classe Schedulable: rodar a integração uma vez por dia" <<'MD'
A Schedulable dispara a Batch diariamente, para a DE ficar sempre atualizada.

Pronto quando: agendada na sandbox, com execução registrada e sem erro.
MD

# ===== M4 · Marketing Cloud =====
issue "$M4" "type-feat,e0-triagem,bloq-ambiente,bv-8,rr-5,tc-5,SP-2,P0" "Criar a DE central de contatos no Marketing Cloud" <<'MD'
A DE recebe exatamente o contrato de dados definido na milestone de integração. Depende do acesso de administrador.
MD

issue "$M4" "type-infra,e0-triagem,bloq-ambiente,bv-5,rr-8,tc-5,SP-2,P0" "Pacote instalado de API no Marketing Cloud e token na Named Credential" <<'MD'
O Marketing Cloud precisa de um pacote instalado (componente de API) que gera as chaves de acesso. As chaves vão para a Named Credential do Salesforce.

**Endereços já conhecidos** (Remote Site Settings da org, criados depois de junho):
- autenticação: `https://mckkn19vl9cjt6b8p-71zcp0dlz4.auth.marketingcloudapis.com`
- REST: `https://mckkn19vl9cjt6b8p-71zcp0dlz4.rest.marketingcloudapis.com`

**Inconsistência a conferir com o acesso admin:** o registro `TenantSpecificAuth` aponta para outro subdomínio, `mcwkt6hn1th778gfyznptbqmj-2y`. Pode ser uma conta antiga ou de teste. Confirmar qual é a conta Marketing Cloud real da Metax antes de criar a Named Credential.

Depende do acesso de administrador.
MD

issue "$M4" "type-infra,e0-triagem,bloq-ambiente,bv-8,rr-8,tc-5,SP-2,P0" "Teste ponta a ponta: da sandbox para a DE real" <<'MD'
Primeira carga de verdade: a Batch roda na sandbox e os registros aparecem na DE do Marketing Cloud.

Prova: print da DE com os registros e o log da execução, lado a lado.
MD

# ===== M5 · Jornada de nutrição =====
issue "$M5" "type-feat,e0-triagem,cliente-facing,bv-13,rr-3,tc-5,SP-3,P1" "Montar a jornada no Journey Builder com entrada pela régua de data" <<'MD'
Régua do Guilherme (24/09/2026), em cima da data da última oportunidade:

- vazio: nunca teve oportunidade, fora;
- recente (15 ou 30 dias): entra;
- mais de 90 dias: fora.

Objetivo pedido pela Metax: nutrição de fundo de funil, falando com o contato pelo nome, com dados da obra, valor da Metax e cases do produto.
MD

issue "$M5" "type-feat,e0-triagem,bv-5,rr-5,tc-3,SP-2,P1" "Testar entrada e saída dos contatos pela régua" <<'MD'
Cada faixa da régua tem um contato de teste: vazio, recente, entre 30 e 90 dias e acima de 90. Conferir que cada um entra ou sai como deveria.
MD

issue "$M5" "type-feat,e0-triagem,cliente-facing,bv-13,rr-5,tc-8,SP-2,P0" "Implantar em produção e ativar a jornada" <<'MD'
Só depois de tudo validado na sandbox. Implantar em produção pede autorização explícita.
MD

issue "$M5" "type-infra,e0-triagem,bv-3,rr-2,tc-1,SP-2,P2" "Recalibrar a régua de temperatura com histórico real" <<'MD'
Hoje não dá para calibrar os cortes de 15, 30 e 90 dias com dado real: as 109 oportunidades abertas foram criadas nos últimos 15 dias. Revisitar quando houver de 60 a 90 dias de histórico.
MD

# ===== M6 · Documentação e entrega =====
issue "$M6" "type-docs,e0-triagem,cliente-facing,bv-8,rr-5,tc-13,SP-1,P0" "Status diário ao cliente a partir de segunda (28/09)" <<'MD'
Compromisso do Lucas no e-mail de 25/09/2026: o Thiago reporta diariamente a evolução da jornada a partir de segunda-feira.

Prazo acordado: até 15 dias úteis.

Formato definido com o Lucas em 28/09/2026: gerenciamento de projetos, com roadmap das 6 milestones, para o Luiz Rafael e a Virginia. Modelo pronto; o primeiro status sai em 28/09.
MD

issue "$M6" "type-docs,e0-triagem,cliente-facing,bv-8,rr-8,tc-5,SP-1,P0" "Alinhar com o Raphael a arquitetura escolhida" <<'MD'
O e-mail aprovado pela Metax (Opção 2) fala em Synchronized Data Extensions e em devolver aberturas e cliques para a oportunidade, com resumo no Chatter. O Raphael pediu para aprender justamente isso.

A arquitetura definida pelo Guilherme é outra: DE central alimentada por Apex via API. Ela entrega a jornada funcionando, mas não ensina Synchronized DE e não devolve interações ao Chatter.

A diferença precisa ser comunicada antes da entrega, para não virar expectativa quebrada.
MD

issue "$M6" "type-docs,e0-triagem,cliente-facing,bv-8,rr-3,tc-3,SP-3,P2" "Documentação passo a passo para o Raphael" <<'MD'
Parte da entrega da Opção 2: documentação explicativa que o Raphael (Marketing, Metax) consulta no ritmo dele e usa como base para as próximas jornadas.
MD

# ---------- 4. Atualiza a issue #1 (guarda-chuva) ----------
gh issue comment 1 -R $R --body-file - <<'MD'
## Atualização de 25/09/2026

Esta issue passa a ser a **guarda-chuva** da entrega. Ela fecha quando as frentes das 6 milestones fecharem.

**O que foi respondido:**
- **Requisito:** existe. A Metax aprovou a Opção 2 por e-mail em 24/09/2026 (Virginia e Raphael). Então é pedido aprovado e não entregue, e não pedido novo.
- **Sintoma:** a jornada nunca existiu. Não é regressão.
- **Acesso à org:** feito. Mapeamento na issue "Mapeamento do Sales Cloud da Metax para a jornada".

**Correções do texto acima:**
- ~~"nenhum sinal do pacote MC Connect"~~: o pacote **está instalado** na org (`et4ae5`). Não aparece no repositório porque é pacote gerenciado. A Business Unit está desabilitada e nunca foi usada.
- ~~Synchronized DEs e Automation Studio~~: arquitetura trocada pelo Guilherme (chamadas de 24 e 25/09). Agora é uma DE central de contatos alimentada por Apex (Schedulable + Batch) via API, com Named Credential, desenvolvida em sandbox.
MD

echo; echo "Pronto. Confira em https://github.com/$R/issues"
