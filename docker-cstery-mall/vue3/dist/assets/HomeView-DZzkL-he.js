import{u as S}from"./useCategory-DUTDZwFS.js";import{d as j,e as C,i as D,h as l,a as i,w as c,b as t,u as r,j as M,r as f,k as T,o as a,F as d,l as p,t as o,E as A,c as k,m as G,n as B,p as q,q as P,v as V,_ as J}from"./index-CMV7StrB.js";import{u as K}from"./useProduct-D_j9yIew.js";import"./http-Bo0dlXKR.js";import"./axios-BimPEqV4.js";import"./httpAdmin-C6IWq_Ob.js";const O={class:"home-layout"},Q=["onClick"],W={class:"sub-categories"},X=["onClick"],Y=["src","alt","onClick"],Z={class:"carousel-text"},I={class:"product-price"},ee=["onClick"],te={class:"sub-categories"},se=["onClick"],ae={class:"products"},oe={class:"container"},ne=["alt"],le={class:"product-info"},ce={class:"product-price"},re={class:"news"},ie={class:"container"},ue=["alt"],de={class:"product-price"},pe=j({__name:"HomeView",setup(_e){const m=M(),{categories:_,getCategoryList:F,subCategories:L,getSubCategoryList:N}=S(),{featuredProducts:h,getFeaturedProducts:U}=K(),g=C([]),y=C([]),b=C([]);D(async()=>{await U(),g.value=h.value.filter(s=>s.type===1),y.value=h.value.filter(s=>s.type===2),b.value=h.value.filter(s=>s.type===3)}),D(async()=>{await F(),_.value.forEach(async s=>{await N(s.id),s.subCategories={...L.value}})});const v=s=>{m.push({path:`/productDetail/${s}`,query:{isDisplayBreadcrumb:0}})},w=s=>{m.push({path:`/subCategory/${s.id}`,query:{name:s.name}})},x=(s,u)=>{m.push({path:`/subCategory/${s.id}`,query:{name:s.name,subCategoryId:u.id,subCategoryName:u.name}})};return(s,u)=>{const $=f("el-aside"),z=f("el-main"),H=f("el-container"),E=T("lazy");return a(),l("div",O,[i(H,null,{default:c(()=>[i($,{width:"200px",class:"left-aside-container"},{default:c(()=>[(a(!0),l(d,null,p(r(_).slice(0,r(_).length/2),e=>(a(),l("div",{key:e.id},[t("span",{onClick:n=>w(e),class:"category-name",style:{cursor:"pointer"}},o(e.name)+": ",9,Q),t("span",W,[(a(!0),l(d,null,p(e.subCategories,n=>(a(),l("span",{key:n.id,onClick:R=>x(e,n),class:"sub-category",style:{cursor:"pointer"}},o(n.name),9,X))),128))])]))),128))]),_:1}),i(z,{class:"carousel-container"},{default:c(()=>[i(r(A),{height:"600px",interval:5e3,arrow:"always"},{default:c(()=>[(a(!0),l(d,null,p(g.value,e=>(a(),k(r(G),{key:e.id},{default:c(()=>[t("img",{src:e.product.imageUrl,alt:e.product.name,class:"carousel-img",onClick:n=>v(e.product.id)},null,8,Y),t("div",Z,[t("h2",null,o(e.product.name),1),t("p",null,o(e.product.description),1),t("p",I,"￥"+o(e.product.price),1)])]),_:2},1024))),128))]),_:1})]),_:1}),i($,{width:"200px",class:"right-aside-container"},{default:c(()=>[(a(!0),l(d,null,p(r(_).slice(r(_).length/2),e=>(a(),l("div",{key:e.id},[t("span",{onClick:n=>w(e),class:"category-name",style:{cursor:"pointer"}},o(e.name)+": ",9,ee),t("span",te,[(a(!0),l(d,null,p(e.subCategories,n=>(a(),l("span",{key:n.id,onClick:R=>x(e,n),class:"sub-category",style:{cursor:"pointer"}},o(n.name),9,se))),128))])]))),128))]),_:1})]),_:1}),t("section",ae,[t("div",oe,[u[0]||(u[0]=t("h2",{style:{margin:"15px 0"}},"热门商品",-1)),i(r(V),{gutter:20},{default:c(()=>[(a(!0),l(d,null,p(y.value,e=>(a(),k(r(P),{key:e.id,span:6},{default:c(()=>[i(r(B),{class:"product-card",onClick:n=>v(e.product.id)},{default:c(()=>[q(t("img",{alt:e.product.name,class:"product-image"},null,8,ne),[[E,e.product.imageUrl]]),t("div",le,[t("h3",null,o(e.product.name),1),t("p",null,o(e.product.description),1),t("p",ce,"￥"+o(e.product.price),1)])]),_:2},1032,["onClick"])]),_:2},1024))),128))]),_:1})])]),t("section",re,[t("div",ie,[u[1]||(u[1]=t("h2",{style:{margin:"15px 0"}},"最新动态",-1)),i(r(V),{gutter:20},{default:c(()=>[(a(!0),l(d,null,p(b.value,e=>(a(),k(r(P),{key:e.id,span:8},{default:c(()=>[i(r(B),{class:"news-card",onClick:n=>v(e.product.id)},{default:c(()=>[q(t("img",{alt:e.product.name,class:"news-image"},null,8,ue),[[E,e.product.imageUrl]]),t("h3",null,o(e.product.name),1),t("p",null,o(e.product.description),1),t("p",de,"￥"+o(e.product.price),1)]),_:2},1032,["onClick"])]),_:2},1024))),128))]),_:1})])])])}}}),ge=J(pe,[["__scopeId","data-v-d421c9bf"]]);export{ge as default};
