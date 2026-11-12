import json,sys
from datetime import datetime as D
from collections import defaultdict,Counter
G=sys.argv[1]
I={i['number']:i for i in json.load(open(G+'/issues.json'))}
E=json.load(open(G+'/all_events.json'));C=json.load(open(G+'/all_comments.json'))
t=lambda s:D.fromisoformat(s.replace('Z','+00:00'))
stages=['e0-nao-lida','e0-triagem','e1-medindo','e2-provado','e3-aguardando-deploy','e4-no-ar','e5-reteste','e6-validado']
score=('bv-','tc-','rr-','SP-','P0','P1','P2','P3')
per=defaultdict(lambda:Counter())
stage_time=defaultdict(float); bloq_time=Counter(); back=[]
for n,i in I.items():
    ev=sorted([e for e in E if e['n']==n],key=lambda e:e['created_at'])
    closed=t(i['closed_at']) if i['closed_at'] else None
    cur={};seq=[]
    for e in ev:
        if e['event'] in('labeled','unlabeled'):
            L=e['label']['name']
            k='stage' if L in stages else 'score' if L.startswith(score) else 'bloq' if L.startswith('bloq') else 'other'
            per[n][k]+=1
            if e['event']=='labeled': cur[L]=t(e['created_at'])
            else:
                if L in cur:
                    d=(t(e['created_at'])-cur.pop(L)).total_seconds()/3600
                    if L in stages: stage_time[L]+=d
                    if L.startswith('bloq'): bloq_time[(n,L)]+=d
            if e['event']=='labeled' and L in stages: seq.append(L)
    for L,s in cur.items():
        if closed:
            d=(closed-s).total_seconds()/3600
            if L in stages: stage_time[L]+=d
            if L.startswith('bloq'): bloq_time[(n,L)]+=d
    idx=[stages.index(s) for s in seq]
    if any(b<a for a,b in zip(idx,idx[1:])): back.append((n,seq))
    per[n]['comments']=sum(1 for c in C if c['n']==n)
    per[n]['cchars']=sum(len(c['body']) for c in C if c['n']==n)
    per[n]['life_h']=round(((closed or t(i['created_at']))-t(i['created_at'])).total_seconds()/3600)
tot=Counter()
for n in per: 
    for k in('stage','score','bloq','other'):tot[k]+=per[n][k]
print('label events by kind',dict(tot))
print('stage hours total',{k:round(v) for k,v in stage_time.items()})
print('bloq hours',{f'#{n} {L}':round(h) for (n,L),h in bloq_time.items()})
print('issues going backwards',len(back)); [print(' #',n,' > '.join(s)) for n,s in back[:12]]
print('\nper issue: n label_stage label_score comments chars life_h')
for n in sorted(per,key=lambda n:-per[n]['cchars'])[:15]:
    p=per[n];print(n,p['stage'],p['score'],p['comments'],p['cchars'],p['life_h'],I[n]['title'][:60])
# rescoring churn: score label events after first day
print('\nscore relabels per issue >6:',[(n,per[n]['score']) for n in per if per[n]['score']>6])
# comments per day
cd=Counter(c['created_at'][:10] for c in C);print('\ncomments/day',sorted(cd.items()))
# ratio comment chars vs issue body chars vs code
print('issue body chars',sum(len(i['body'] or '') for i in I.values()),'comment chars',sum(len(c['body']) for c in C))
