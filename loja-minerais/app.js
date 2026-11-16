/* Dados fictícios — substituir pelo acervo real. */
const BRAND='PERIDOT'; // nome provisório
const FAMILIES={ametista:['#1b0b2e','#6b3fa0','#d9b8ff'],quartzo:['#16181c','#7f8794','#f2f4f8'],malaquita:['#04140e','#0f6b45','#9be3bd'],fluorita:['#07121f','#2b7a8f','#b6f0e0'],turmalina:['#12060a','#a3224f','#ff9fbf'],azurita:['#030b1d','#1f3f9e','#8fb0ff']};
const P=[
{id:'aurora-ametista',nome:'Drusa Aurora',mineral:'Ametista',fam:'ametista',origem:'Artigas, Uruguai',peso:'38 kg',dim:'62 × 41 × 30 cm',preco:48000,tag:'Peça única',txt:'Cavidade de ametista de cor profunda e cristais de terminação limpa, com fundo de ágata preservado.'},
{id:'meridiano-quartzo',nome:'Meridiano',mineral:'Quartzo hialino',fam:'quartzo',origem:'Minas Gerais, Brasil',peso:'12,4 kg',dim:'48 × 18 × 16 cm',preco:26500,tag:'Peça única',txt:'Cristal de rocha de transparência rara, terminação dupla e sem restauros.'},
{id:'selva-malaquita',nome:'Selva Verde',mineral:'Malaquita botrioidal',fam:'malaquita',origem:'Katanga, R.D. Congo',peso:'5,2 kg',dim:'24 × 19 × 14 cm',preco:34000,tag:'Museu',txt:'Concreção de bandeamento concêntrico fino, polimento natural de superfície.'},
{id:'lume-fluorita',nome:'Lume',mineral:'Fluorita',fam:'fluorita',origem:'Hunan, China',peso:'3,8 kg',dim:'21 × 17 × 15 cm',preco:19800,tag:'Novo',txt:'Cubos de fluorita de verde-água translúcido com fluorescência intensa.'},
{id:'rubra-turmalina',nome:'Rubra',mineral:'Turmalina rubelita',fam:'turmalina',origem:'Paraíba, Brasil',peso:'0,9 kg',dim:'14 × 7 × 6 cm',preco:null,tag:'Sob consulta',txt:'Cristal terminado de rubelita sobre matriz de lepidolita. Gema de colecionador.'},
{id:'noite-azurita',nome:'Noite',mineral:'Azurita',fam:'azurita',origem:'Tsumeb, Namíbia',peso:'1,6 kg',dim:'16 × 12 × 9 cm',preco:41500,tag:'Museu',txt:'Rosetas de azurita de azul profundo, procedência histórica de Tsumeb.'},
{id:'nuvem-quartzo',nome:'Nuvem',mineral:'Quartzo fumê',fam:'quartzo',origem:'Alpes Suíços',peso:'7,3 kg',dim:'35 × 20 × 18 cm',preco:22900,tag:'Peça única',txt:'Cluster alpino de fumê claro, cristais elegantes e brilhantes.'},
{id:'bosque-ametista',nome:'Bosque',mineral:'Ametista',fam:'ametista',origem:'Rio Grande do Sul, Brasil',peso:'14 kg',dim:'40 × 28 × 22 cm',preco:15200,tag:'Novo',txt:'Geodo aberto de cristais lavanda, ideal para ambientes de pé-direito generoso.'}];
const brl=n=>n?n.toLocaleString('pt-BR',{style:'currency',currency:'BRL',maximumFractionDigits:0}):'Sob consulta';
const rnd=s=>{let h=0;for(const c of s)h=Math.imul(31,h)+c.charCodeAt(0)|0;return()=>(h=Math.imul(h^h>>>15,2246822507),h=Math.imul(h^h>>>13,3266489909),((h^=h>>>16)>>>0)/4294967296)};
/* Arte procedural provisória até haver fotografia real */
function art(seed,fam,v=0){const [a,b,c]=FAMILIES[fam]||FAMILIES.quartzo,r=rnd(seed+v);let s=`<svg viewBox="0 0 400 500" preserveAspectRatio="xMidYMid slice" xmlns="http://www.w3.org/2000/svg"><defs><radialGradient id="g${seed}${v}" cx="50%" cy="${70+v*5}%" r="75%"><stop offset="0" stop-color="${b}"/><stop offset="1" stop-color="${a}"/></radialGradient></defs><rect width="400" height="500" fill="url(#g${seed}${v})"/>`;
for(let i=0;i<26;i++){const x=40+r()*320,y=240+r()*240,w=14+r()*34,h=70+r()*190,rot=(r()-.5)*70,o=.25+r()*.6;
s+=`<g transform="translate(${x} ${y}) rotate(${rot})" opacity="${o}"><polygon points="0,${-h} ${w},${-h*.82} ${w},0 ${-w},0 ${-w},${-h*.82}" fill="${c}"/><polygon points="0,${-h} ${w},${-h*.82} ${w},0 0,0" fill="${b}" opacity=".55"/><polygon points="0,${-h} ${-w},${-h*.82} 0,${-h*.6}" fill="#fff" opacity=".35"/></g>`}
return s+`<rect y="430" width="400" height="70" fill="${a}" opacity=".7"/></svg>`}
const card=p=>`<a class="card reveal" href="peca.html?id=${p.id}"><div class="ph"><span class="tag">${p.tag}</span>${art(p.id,p.fam)}</div><h3>${p.nome}</h3><p>${p.mineral} · ${p.origem}</p><p class="pr">${brl(p.preco)}</p></a>`;
/* carrinho */
const store={get:()=>{try{return JSON.parse(localStorage.getItem('cart')||'[]')}catch{return[]}},set:v=>{try{localStorage.setItem('cart',JSON.stringify(v))}catch{}}};
let cartMem=store.get();const saveCart=()=>{store.set(cartMem);renderCart()};
function renderCart(){const el=document.getElementById('cart-items');if(!el)return;const items=cartMem.map(id=>P.find(p=>p.id===id)).filter(Boolean);
el.innerHTML=items.length?items.map(p=>`<div class="line"><div class="ph">${art(p.id,p.fam)}</div><div><h4>${p.nome}</h4><span class="eyebrow">${p.mineral}</span></div><div>${brl(p.preco)}<br><button data-rm="${p.id}">Remover</button></div></div>`).join(''):'<p class="eyebrow" style="margin-top:20px">Sua seleção está vazia</p>';
document.getElementById('cart-total').textContent=brl(items.reduce((t,p)=>t+(p.preco||0),0));document.querySelectorAll('[data-count]').forEach(e=>e.textContent=items.length)}
function toggle(id,on){document.getElementById(id).classList.toggle('open',on);document.getElementById('scrim').classList.toggle('on',on&&id==='cart');document.body.style.overflow=on?'hidden':''}
/* shell compartilhado */
document.getElementById('shell-top').innerHTML=`<div class="bar">Entrega assegurada e certificada em todo o Brasil · Atendimento privado</div>
<header><div class="nav-l"><button class="menu-btn" data-open="menu">Menu</button><a href="colecao.html">Coleções</a><a href="colecao.html?f=museu">Museu</a></div><a class="logo" href="index.html">${BRAND}</a><div class="nav-r"><a href="#concierge">Concierge</a><button data-open="cart">Seleção (<span data-count>0</span>)</button></div></header>
<div class="drawer" id="menu"><div class="top"><span>${BRAND}</span><button data-close="menu">Fechar</button></div><nav><a href="colecao.html">Todas as peças</a><a href="colecao.html?f=ametista">Ametistas</a><a href="colecao.html?f=quartzo">Quartzos</a><a href="colecao.html?f=malaquita">Malaquitas</a><a href="index.html#concierge">Concierge</a></nav><div class="foot">Atendimento privado · contato@seudominio.com</div></div>
<div class="scrim" id="scrim"></div><aside class="cart" id="cart"><div class="top"><span>Sua seleção</span><button data-close="cart">Fechar</button></div><div class="items" id="cart-items"></div><div style="display:flex;justify-content:space-between;padding:18px 0"><span class="eyebrow">Total</span><span id="cart-total"></span></div><a class="btn" href="#concierge" data-close="cart">Finalizar com concierge</a></aside>`;
document.getElementById('shell-foot').innerHTML=`<section class="news" id="concierge"><p class="eyebrow">Concierge</p><h2 class="display" style="font-size:clamp(32px,5vw,56px);margin-top:12px">Receba peças antes de serem publicadas</h2><p style="max-width:460px;margin:14px auto 0;color:#55524b">Acesso antecipado a novas aquisições e atendimento reservado para colecionadores.</p><form onsubmit="event.preventDefault();this.innerHTML='<p class=eyebrow>Obrigado — entraremos em contato.</p>'"><input type="email" required placeholder="Seu e-mail" aria-label="E-mail"><button>Solicitar</button></form></section>
<footer><div class="cols"><div><h5>${BRAND}</h5><p>Minerais de coleção e peças de alto valor, com procedência e certificação.</p></div><div><h5>Coleções</h5><ul><li><a href="colecao.html?f=ametista">Ametistas</a></li><li><a href="colecao.html?f=quartzo">Quartzos</a></li><li><a href="colecao.html?f=malaquita">Malaquitas</a></li></ul></div><div><h5>Serviços</h5><ul><li>Certificado de autenticidade</li><li>Envio segurado</li><li>Consultoria de aquisição</li><li>Trocas e devoluções</li></ul></div><div><h5>Contato</h5><ul><li>contato@seudominio.com</li><li>WhatsApp privado</li><li>Instagram</li></ul></div></div><p class="copy">© 2026 ${BRAND}. Protótipo — nomes, peças e valores são fictícios.</p></footer>`;
document.addEventListener('click',e=>{const t=e.target.closest('[data-open],[data-close],[data-rm],[data-add]');if(!t)return;
if(t.dataset.open)toggle(t.dataset.open,true);if(t.dataset.close){toggle(t.dataset.close,false)}
if(t.dataset.rm){cartMem=cartMem.filter(i=>i!==t.dataset.rm);saveCart()}
if(t.dataset.add){if(!cartMem.includes(t.dataset.add))cartMem.push(t.dataset.add);saveCart();toggle('cart',true)}});
document.getElementById('scrim').onclick=()=>toggle('cart',false);
document.addEventListener('keydown',e=>{if(e.key==='Escape'){toggle('cart',false);toggle('menu',false)}});
renderCart();
const io=new IntersectionObserver(es=>es.forEach(e=>{if(e.isIntersecting){e.target.classList.add('in');io.unobserve(e.target)}}),{threshold:.1});
const watch=()=>document.querySelectorAll('.reveal:not(.in)').forEach(n=>io.observe(n));
/* páginas */
const page=document.body.dataset.page;
if(page==='home'){document.getElementById('hero-art').innerHTML=art('hero','ametista',2);
document.getElementById('tiles').innerHTML=['ametista','malaquita'].map(f=>`<a class="tile reveal" href="colecao.html?f=${f}">${art('t'+f,f,1)}<div><h3>${f[0].toUpperCase()+f.slice(1)}s</h3><span class="cta">Explorar</span></div></a>`).join('');
document.getElementById('rail').innerHTML=P.slice(0,6).map(card).join('');
document.getElementById('ed1').innerHTML=art('ed1','fluorita',3);document.getElementById('ed2').innerHTML=art('ed2','azurita',4)}
if(page==='colecao'){const q=new URLSearchParams(location.search);let f=q.get('f')||'todas';
const fams=['todas',...new Set(P.map(p=>p.fam)),'museu'];const chips=document.getElementById('chips'),grid=document.getElementById('grid'),sort=document.getElementById('sort');
const draw=()=>{chips.innerHTML=fams.map(x=>`<button class="chip ${x===f?'on':''}" data-f="${x}">${x}</button>`).join('');
let l=P.filter(p=>f==='todas'||p.fam===f||(f==='museu'&&p.tag==='Museu'));
if(sort.value==='asc')l.sort((a,b)=>(a.preco||1e9)-(b.preco||1e9));if(sort.value==='desc')l.sort((a,b)=>(b.preco||0)-(a.preco||0));
grid.innerHTML=l.map(card).join('');document.getElementById('count').textContent=l.length+' peças';watch()};
chips.onclick=e=>{const c=e.target.closest('[data-f]');if(c){f=c.dataset.f;draw()}};sort.onchange=draw;draw()}
if(page==='peca'){const p=P.find(x=>x.id===new URLSearchParams(location.search).get('id'))||P[0];document.title=p.nome+' — '+BRAND;
document.getElementById('gal').innerHTML=[0,1,2].map(v=>`<div class="ph">${art(p.id,p.fam,v)}</div>`).join('');
document.getElementById('info').innerHTML=`<p class="eyebrow">${p.mineral} · ${p.tag}</p><h1 class="display">${p.nome}</h1><p>${p.txt}</p><p class="price">${brl(p.preco)}</p>
<div class="specs"><div><b>Procedência</b>${p.origem}</div><div><b>Peso</b>${p.peso}</div><div><b>Dimensões</b>${p.dim}</div><div><b>Referência</b>${p.id.replace(/-/g,'').toUpperCase().slice(0,8)}</div></div>
<div class="stack">${p.preco?`<button class="btn" data-add="${p.id}">Adicionar à seleção</button>`:''}<a class="btn ghost" href="index.html#concierge">Falar com o concierge</a></div>
<details open><summary>Certificado e procedência</summary><p>Acompanha certificado de autenticidade, ficha de procedência e documentação de origem.</p></details>
<details><summary>Envio e seguro</summary><p>Embalagem sob medida, transporte segurado porta a porta e acompanhamento dedicado.</p></details>
<details><summary>Trocas e devoluções</summary><p>Política a definir com a operação.</p></details>`;
document.getElementById('more').innerHTML=P.filter(x=>x.id!==p.id).slice(0,4).map(card).join('')}
watch();
