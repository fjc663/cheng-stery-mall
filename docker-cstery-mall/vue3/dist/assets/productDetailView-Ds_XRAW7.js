import{d as J,e as x,i as $,c as v,w as o,x as L,r as l,o as i,a as n,u as r,b as e,t as m,h as k,l as C,F as b,f as d,_ as M}from"./index-CMV7StrB.js";import{u as R}from"./useProduct-D_j9yIew.js";import{u as j}from"./useCart-COOFCTo-.js";import{u as A}from"./useFavorites-DvnhUBEH.js";import"./http-Bo0dlXKR.js";import"./axios-BimPEqV4.js";import"./httpAdmin-C6IWq_Ob.js";import"./useCartItemsNumStore-BpwacNS2.js";const G={class:"product-title"},H={class:"product-price"},K={class:"product-description"},Q={class:"product-quantity"},W={class:"actions"},X=J({__name:"productDetailView",setup(Y){const V=L(),F=V.params.productId,{product:u,specifications:f,getProductDetail:g}=R(),p=x({});$(async()=>{await g(F),f.value!=null&&f.value.forEach(a=>{p.value[a.name]=a.specificationOptions.split(",")[0]})});const _=x({productId:Number(V.params.productId),quantity:1,specifications:JSON.stringify(p.value)}),{addPorductToCart:N}=j(),P=()=>{_.value.specifications=JSON.stringify(p.value),N(_.value)},{addProductToFavorites:h,deleteFavoritesProduct:T}=A(),q=async a=>{await h(a),g(a)},z=async a=>{await T(a),g(a)};return(a,t)=>{const B=l("el-image"),w=l("el-col"),D=l("el-radio"),O=l("el-radio-group"),S=l("el-input-number"),y=l("el-button"),U=l("el-row"),I=l("el-card"),E=l("el-container");return i(),v(E,{class:"product-detail-page"},{default:o(()=>[n(I,{class:"product-card",shadow:"hover"},{default:o(()=>[n(U,{gutter:20,class:"product-detail"},{default:o(()=>[n(w,{span:10,class:"product-image-container"},{default:o(()=>[n(B,{src:r(u).imageUrl,lazy:"",fit:"cover",class:"product-image"},null,8,["src"])]),_:1}),n(w,{span:14,class:"product-info-container"},{default:o(()=>[e("h1",G,m(r(u).name),1),e("p",H,"￥"+m(r(u).price),1),e("p",K,m(r(u).description),1),(i(!0),k(b,null,C(r(f),s=>(i(),k("div",{key:s.name,class:"product-options"},[e("h3",null,m(s.name),1),n(O,{modelValue:p.value[s.name],"onUpdate:modelValue":c=>p.value[s.name]=c},{default:o(()=>[(i(!0),k(b,null,C(s.specificationOptions.split(","),c=>(i(),v(D,{key:c,label:c,value:c},{default:o(()=>[d(m(c),1)]),_:2},1032,["label","value"]))),128))]),_:2},1032,["modelValue","onUpdate:modelValue"])]))),128)),e("div",Q,[t[3]||(t[3]=e("h3",null,"数量",-1)),n(S,{modelValue:_.value.quantity,"onUpdate:modelValue":t[0]||(t[0]=s=>_.value.quantity=s),min:1},null,8,["modelValue"])]),e("div",W,[n(y,{type:"primary",size:"large",class:"custom-add-to-cart",onClick:P},{default:o(()=>t[4]||(t[4]=[e("i",{class:"el-icon-shopping-cart-full"},null,-1),d(" 加入购物车 ")])),_:1}),r(u).isFavorites?(i(),v(y,{key:0,type:"info",size:"large",class:"remove-custom-favorite",onClick:t[1]||(t[1]=s=>z(r(u).id))},{default:o(()=>t[5]||(t[5]=[e("svg",{class:"icon","aria-hidden":"true"},[e("use",{"xlink:href":"#icon-shoucang"})],-1),d(" 移除收藏 ")])),_:1})):(i(),v(y,{key:1,type:"success",size:"large",class:"custom-favorite",onClick:t[2]||(t[2]=s=>q(r(u).id))},{default:o(()=>t[6]||(t[6]=[e("svg",{class:"icon","aria-hidden":"true"},[e("use",{"xlink:href":"#icon-shoucang"})],-1),d(" 收藏 ")])),_:1}))])]),_:1})]),_:1}),t[7]||(t[7]=e("div",{class:"extra-info"},[e("p",null,[e("strong",null,"配送时间："),d(" 预计2-3天内送达")]),e("p",null,[e("strong",null,"服务："),d(" 支持7天无理由退货")])],-1))]),_:1})]),_:1})}}}),re=M(X,[["__scopeId","data-v-7e65ca12"]]);export{re as default};
