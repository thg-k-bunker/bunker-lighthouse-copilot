Começando um projeto novo. Nunca mexi com Marketing Cloud. Segue o que eu tenho até agora (25/09):

E-mail de 24/09, a Metax escolheu a Opção 2 da Jornada Marketing Cloud bonificada: Data Extensions sincronizadas com o Sales Cloud, automação entre as DEs, uma jornada de nutrição de fundo de funil para quem tem oportunidade aberta, com régua pela data da última oportunidade, e retorno das interações ao Chatter.

Ligação com o Guilherme, 24 e 25/09, arquitetura: uma Schedulable diária chama uma Batch que monta um registro por contato (Account, Contact, Opportunity e OpportunityContactRole) e manda para uma DE central no Marketing Cloud pela API, com Named Credential. Sem Flow. TDD com HttpCalloutMock. Tudo em sandbox; produção só com autorização explícita.

Do lado da Metax: a Virginia é a gestora comercial, e o Luiz Raphael é o usuário-chave que vai operar depois. O Lucas, do comercial da Bunker, combinou com eles um status diário a partir de segunda. A ideia é entregar o quanto antes.
