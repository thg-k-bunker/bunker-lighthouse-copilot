import json,sys
from datetime import datetime as D
G=sys.argv[1]
I={i['number']:i for i in json.load(open(G+'/issues.json'))}
E=json.load(open(G+'/all_events.json'))
t=lambda s:D.fromisoformat(s.replace('Z','+00:00'))
rows=[]
for n,i in I.items():
    if 'pull_request' in i: continue
    ev=sorted([e for e in E if e['n']==n and e['event']=='labeled'],key=lambda e:e['created_at'])
    first={}
    for e in ev: first.setdefault(e['label']['name'],t(e['created_at']))
    c=t(i['closed_at']); o=t(i['created_at'])
    p=first.get('e2-provado'); a=first.get('e4-no-ar')
    rows.append((n,round((c-o).total_seconds()/3600),round((c-p).total_seconds()/3600) if p else None,round((c-a).total_seconds()/3600) if a else None,i['title'][:55]))
tot=[r for r in rows if r[2] is not None]
print('issues with e2:',len(tot),' median h provado->fechado:',sorted(r[2] for r in tot)[len(tot)//2],' sum:',sum(r[2] for r in tot))
ta=[r for r in rows if r[3] is not None]
print('issues with e4:',len(ta),' median h no-ar->fechado:',sorted(r[3] for r in ta)[len(ta)//2])
for r in sorted(rows,key=lambda r:-(r[2] or 0))[:12]: print(r)
# closing day concentration
from collections import Counter
print(Counter(i['closed_at'][:10] for i in I.values()))
