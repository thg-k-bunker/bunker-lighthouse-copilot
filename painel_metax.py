"""Painel da Jornada Marketing Cloud · Metax, a partir do quadro de issues do GitHub.

Dado: issues.json exportado por `gh issue list --json` em 29/09/2026. A #1 (guarda-chuva) fica
fora das contas: ela agrupa as outras e não tem tamanho próprio.
"""
import json
import os
import sys
from datetime import date, datetime, timezone

PULSO = os.environ['PULSO_SCRIPTS']
sys.path.insert(0, PULSO)
from pulso import paleta  # noqa: E402

# vermelho do tema da Metax (brandingSet LEXTHEMINGDWMetaxCosmos); o tema não traz segunda
# cor, então o alerta fica no preto da Bunker
paleta.definir_marca('#E61A10', '#0a0a0a')

from pulso import deck, formas, pagina, saida  # noqa: E402
from pulso.paleta import CHEIA, MEIA  # noqa: E402

AQUI = os.path.dirname(os.path.abspath(__file__))
AGORA = datetime(2026, 9, 29, 22, 30, tzinfo=timezone.utc)
ORIGEM = 'quadro de issues do GitHub, metax-salesforce'

ETAPAS = [('e0-triagem', 'Triagem'), ('e1-medindo', 'Medindo'), ('e2-provado', 'Provado'),
          ('e3-aguardando-deploy', 'Pronto')]
FRENTES = ['Descoberta e acessos', 'Ambiente de desenvolvimento',
           'Integração Sales Cloud → Marketing Cloud', 'Marketing Cloud',
           'Jornada de nutrição', 'Documentação e entrega']
CURTO = {'Integração Sales Cloud → Marketing Cloud': 'Integração SC → MC',
         'Ambiente de desenvolvimento': 'Ambiente de dev'}


def rotulos(i):
    return [l['name'] for l in i['labels']]


def sp(i):
    return next((int(l[3:]) for l in rotulos(i) if l.startswith('SP-')), 0)


def feita(i):
    """Fechada, ou provada e só esperando a produção (a #25)."""
    return i['state'] == 'CLOSED' or 'e3-aguardando-deploy' in rotulos(i)


def carregar():
    issues = json.load(open(os.path.join(AQUI, 'issues.json'), encoding='utf-8'))
    return [i for i in issues if i['number'] != 1]


def montar(iss):
    fonte = lambda recorte: pagina.linha_fonte(ORIGEM, recorte, AGORA)
    blocos = []
    abertas = [i for i in iss if i['state'] == 'OPEN']
    tot, fei = sum(sp(i) for i in iss), sum(sp(i) for i in iss if feita(i))
    fechadas = [i for i in iss if i['state'] == 'CLOSED']
    decisao = [i for i in abertas if 'bloq-decisao' in rotulos(i)]
    p0 = [i for i in abertas if 'P0' in rotulos(i)]
    pct = round(100 * fei / tot)

    blocos.append(pagina.secao(
        'Quanto da Jornada Marketing Cloud já está feito, e o que segura o próximo passo?',
        f'{pct}% do trabalho medido está feito, e {len(decisao)} issues esperam decisão do Guilherme.',
        formas.kpis([
            {'rotulo': 'Feito, em pontos de tamanho', 'valor': f'{pct}%', 'regua': f'{fei} de {tot} pontos'},
            {'rotulo': 'Issues fechadas', 'valor': str(len(fechadas)), 'regua': f'de {len(iss)} no quadro'},
            {'rotulo': 'Esperando decisão', 'valor': str(len(decisao)), 'regua': 'issues ' + ', '.join(f'#{i["number"]}' for i in decisao), 'cor': paleta.ALERTA},
            {'rotulo': 'Prioridade máxima em aberto', 'valor': str(len(p0)), 'regua': f'P0, de {len(abertas)} abertas'},
        ], MEIA, cols=2),
        fonte('26 issues, sem a guarda-chuva #1; a #25 conta como feita (provada na sandbox)')))

    prog = []
    for f in FRENTES:
        da = [i for i in iss if (i['milestone'] or {}).get('title') == f]
        prog.append((CURTO.get(f, f), sum(sp(i) for i in da if feita(i)), sum(sp(i) for i in da)))
    prontas = [n for n, d, t in prog if d == t]
    zeradas = [(n, t) for n, d, t in prog if d == 0]
    blocos.append(pagina.secao(
        'Qual frente está mais perto de concluir?',
        f'{prontas[0]} está pronto; Jornada e Documentação estão em 0.',
        formas.progresso(prog, MEIA),
        fonte('pontos feitos sobre o total da frente')))

    por_etapa = [(nome, sum(1 for i in abertas if chave in rotulos(i))) for chave, nome in ETAPAS]
    tri = por_etapa[0][1]
    blocos.append(pagina.secao(
        'O aberto está perto de virar entrega?',
        f'Ainda não: {tri} das {len(abertas)} abertas estão na triagem.',
        formas.barras_deitadas(por_etapa, MEIA, unidade='issues', destaque='Triagem'),
        fonte('issues abertas, por etapa')))

    por_p = [(f'P{k}', sum(1 for i in abertas if f'P{k}' in rotulos(i))) for k in range(4)]
    blocos.append(pagina.secao(
        'Sobrou coisa urgente em aberto?',
        f'Sim: {por_p[0][1]} das {len(abertas)} abertas são P0.',
        formas.barras_deitadas(por_p, MEIA, unidade='issues', destaque='P0'),
        fonte('prioridade pela régua do WSJF')))

    # o quadro nasceu em 28/09: o trabalho de 24 a 27/09 foi registrado nesse dia
    dias = [date(2026, 9, 28), date(2026, 9, 29)]
    ent = [sum(1 for i in iss if date.fromisoformat(i['createdAt'][:10]) <= d and
               (k == 0 or date.fromisoformat(i['createdAt'][:10]) > dias[k - 1]))
           for k, d in enumerate(dias)]
    sai = [sum(1 for i in iss if i['closedAt'] and date.fromisoformat(i['closedAt'][:10]) <= d and
               (k == 0 or date.fromisoformat(i['closedAt'][:10]) > dias[k - 1]))
           for k, d in enumerate(dias)]
    fim = sum(ent) - sum(sai)
    blocos.append(pagina.secao(
        'A fila de issues abertas cresceu ou diminuiu?',
        f'Cresceu para {fim}: entraram {sum(ent)} issues em dois dias, e {sum(sai)} saíram.',
        formas.cascata(0, ent, sai, [f'{d:%d/%m}' for d in dias], 'dia', MEIA, textos={
            'aria': 'Cascata da fila: partiu de {inicio}, entraram {ent}, saíram {sai}, e parou em {fim}',
            'partida': 'o quadro nasceu vazio em 28/09',
            'melhor': 'maior saída num {uni}: {maior} issues'}),
        fonte('o quadro nasceu em 28/09; o trabalho de 24 a 27/09 entrou nele nesse dia')))
    return blocos


def main():
    iss = carregar()
    blocos = montar(iss)
    painel = os.path.join(AQUI, 'painel.html')
    open(painel, 'w', encoding='utf-8').write(pagina.documento(
        'Jornada MC Metax · Painel do projeto', blocos,
        rodape='Bunker · Jornada Marketing Cloud da Metax · dados do quadro de issues do GitHub'))
    print(f'{painel}: {len(blocos)} blocos')

    slides = [deck.capa(f'JORNADA MARKETING CLOUD · METAX · {AGORA:%d/%m/%Y}',
                        'Onde o projeto está',
                        'O que já está feito, o que está aberto e o que depende de decisão.',
                        'Quadro de issues do GitHub · bunkerconsultancy.com')]
    for k, b in enumerate(blocos, start=2):
        perg, manch, desenho, fonte, ler = deck.partes(b)
        slides.append(deck.slide('Projeto', perg, manch, desenho, fonte, k, ler))
    slides.append(deck.fecho(f'quadro de issues · {AGORA:%d/%m/%Y}'))
    html = os.path.join(AQUI, 'deck.html')
    open(html, 'w', encoding='utf-8').write(deck.render('Jornada MC Metax · Painel', slides))
    pdf = saida.para_pdf(html, os.path.join(AQUI, 'deck.pdf'))
    pptx, n = saida.para_pptx(pdf, os.path.join(AQUI, 'deck.pptx'))
    print(f'{html}, {pdf}, {pptx}: {n} slides')


if __name__ == '__main__':
    main()
