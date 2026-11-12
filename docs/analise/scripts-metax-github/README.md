# Scripts dos números do GitHub da Metax

Reproduzem as medidas de [`../metax-github.md`](../metax-github.md) e de [`../skills-bunker-existentes.md`](../skills-bunker-existentes.md): trocas de rótulo por tipo, horas em cada etapa e bloqueio, e o tempo entre "provado" ou "no ar" e o fechamento. Só referência: o processo no GitHub segue o padrão da Bunker (decisão de 11/11/2026).

Os dados não ficam no repositório; baixe pela API REST (paginar por issue, porque a paginação global não passa pelo proxy das sessões na nuvem):

```bash
R=repos/Bunker-Growth-and-Sales-Intelligence/metax-salesforce; mkdir -p gh
gh api "$R/issues?state=all&per_page=100" > gh/issues.json
for n in $(seq 1 46); do gh api "$R/issues/$n/comments?per_page=100" > gh/c_$n.json; gh api "$R/issues/$n/events?per_page=100" > gh/e_$n.json; done
python3 -c "import json;C=[];E=[]
for n in range(1,47):
  c=json.load(open(f'gh/c_{n}.json'));e=json.load(open(f'gh/e_{n}.json'))
  [x.update(n=n) for x in c+e];C+=c;E+=e
json.dump(C,open('gh/all_comments.json','w'));json.dump(E,open('gh/all_events.json','w'))"
python3 quant.py gh
python3 tail.py gh
```
