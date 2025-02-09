import{_ as h,r as l,o as i,c as v,w as o,a as t,b as e,d as S,s as A,e as N,f as a,u as d,g as _,h as x,t as E}from"./index-CMV7StrB.js";import{u as F}from"./http-Bo0dlXKR.js";import{u as j}from"./useCartItemsNumStore-BpwacNS2.js";import{u as G}from"./useUser-aX2g__mo.js";import{u as J}from"./useProduct-D_j9yIew.js";import"./axios-BimPEqV4.js";import"./userApi-CmX0eGrO.js";import"./httpAdmin-C6IWq_Ob.js";const K={};function O(b,s){const r=l("el-col"),u=l("el-row"),c=l("el-container");return i(),v(c,{class:"footer-content"},{default:o(()=>[t(u,{gutter:20},{default:o(()=>[t(r,{xs:24,sm:12,lg:6},{default:o(()=>s[0]||(s[0]=[e("div",{class:"footer-section"},[e("h3",{class:"footer-title"},"关于我们"),e("p",{class:"footer-text"}," 我们是一家专注于高质量电商的公司，提供多样化的商品，致力于为顾客提供优质的购物体验。 ")],-1)])),_:1}),t(r,{xs:24,sm:12,lg:6},{default:o(()=>s[1]||(s[1]=[e("div",{class:"footer-section"},[e("h3",{class:"footer-title"},"帮助中心"),e("ul",{class:"footer-links"},[e("li",null,[e("a",{href:"#"},"常见问题")]),e("li",null,[e("a",{href:"#"},"订单跟踪")]),e("li",null,[e("a",{href:"#"},"退换货政策")]),e("li",null,[e("a",{href:"#"},"联系客服")])])],-1)])),_:1}),t(r,{xs:24,sm:12,lg:6},{default:o(()=>s[2]||(s[2]=[e("div",{class:"footer-section"},[e("h3",{class:"footer-title"},"友情链接"),e("ul",{class:"footer-links"},[e("li",null,[e("a",{href:"#"},"合作伙伴1")]),e("li",null,[e("a",{href:"#"},"合作伙伴2")]),e("li",null,[e("a",{href:"#"},"合作伙伴3")]),e("li",null,[e("a",{href:"#"},"合作伙伴4")])])],-1)])),_:1}),t(r,{xs:24,sm:12,lg:6},{default:o(()=>s[3]||(s[3]=[e("div",{class:"footer-section"},[e("h3",{class:"footer-title"},"关注我们"),e("div",{class:"social-icons"},[e("a",{href:"#"},[e("i",{class:"el-icon-s-platform"})]),e("a",{href:"#"},[e("i",{class:"el-icon-s-opportunity"})]),e("a",{href:"#"},[e("i",{class:"el-icon-s-goods"})]),e("a",{href:"#"},[e("i",{class:"el-icon-s-cooperation"})])])],-1)])),_:1})]),_:1}),s[4]||(s[4]=e("div",{class:"footer-bottom"},[e("p",null,"© 2024 ChengSteryMall. 保留所有权利。")],-1))]),_:1})}const W=h(K,[["render",O],["__scopeId","data-v-b65992f7"]]),X={key:0,class:"auth-buttons"},Y={key:1,class:"user-info"},Z={class:"el-dropdown-link"},ee=S({__name:"HeaderView",setup(b){const s=j(),{cartItemsNum:r}=A(s),u=F(),c=N(!1);u.token.length!=0&&(c.value=!0);const{logout:g}=G(),k=()=>{_.push({path:"/login",query:{isLogin:1}})},y=()=>{_.push({path:"/login",query:{isLogin:0}})},{pageQuery:C,pageQueryByCategoryId:B}=J(),f=N(""),R=()=>{f.value.length<=0||(C.value.name=f.value,C.value.isALLData=!0,B(),_.push({path:"/search",query:{searchQuery:f.value}}))},U=()=>{_.push("/userInfo")},V=()=>{_.push("/cart")};return(le,n)=>{const w=l("el-col"),p=l("el-menu-item"),Q=l("el-menu"),m=l("el-button"),T=l("el-input"),I=l("el-icon"),q=l("el-badge"),$=l("el-avatar"),L=l("el-dropdown-item"),D=l("el-dropdown-menu"),H=l("el-dropdown"),M=l("el-row"),P=l("el-container");return i(),v(P,null,{default:o(()=>[t(M,{class:"nav-bar"},{default:o(()=>[t(w,{span:4},{default:o(()=>n[1]||(n[1]=[e("div",{class:"logo"},[e("svg",{class:"icon","aria-hidden":"true"},[e("use",{"xlink:href":"#icon-yuanzi"})]),a(" ChengSteryMall ")],-1)])),_:1}),t(w,{span:12,class:"center-content"},{default:o(()=>[t(Q,{mode:"vertical",class:"main-menu","default-active":d(_).currentRoute.value.path,"background-color":"transparent","active-text-color":"#f56c6c",router:""},{default:o(()=>[t(p,{index:"/"},{default:o(()=>n[2]||(n[2]=[a("首页")])),_:1}),t(p,{index:"/category"},{default:o(()=>n[3]||(n[3]=[a("商品分类")])),_:1}),t(p,{index:"/price"},{default:o(()=>n[4]||(n[4]=[a("特价专区")])),_:1}),t(p,{index:"/newItem"},{default:o(()=>n[5]||(n[5]=[a("新品上架")])),_:1}),t(p,{index:"/about"},{default:o(()=>n[6]||(n[6]=[a("关于我们")])),_:1})]),_:1},8,["default-active"]),t(T,{modelValue:f.value,"onUpdate:modelValue":n[0]||(n[0]=z=>f.value=z),placeholder:"搜索商品...",clearable:"",class:"search-input"},{append:o(()=>[t(m,{onClick:R},{default:o(()=>n[7]||(n[7]=[e("svg",{class:"icon","aria-hidden":"true"},[e("use",{"xlink:href":"#icon-find"})],-1)])),_:1})]),_:1},8,["modelValue"]),d(r)>0?(i(),v(q,{key:0,value:d(r),class:"cart-badge",type:"danger"},{default:o(()=>[t(m,{onClick:V,class:"cart-icon-button"},{default:o(()=>[t(I,null,{default:o(()=>n[8]||(n[8]=[e("svg",{class:"icon","aria-hidden":"true"},[e("use",{"xlink:href":"#icon-gouwuche"})],-1)])),_:1})]),_:1})]),_:1},8,["value"])):(i(),v(m,{key:1,onClick:V,class:"cart-icon-button"},{default:o(()=>[t(I,null,{default:o(()=>n[9]||(n[9]=[e("svg",{class:"icon","aria-hidden":"true"},[e("use",{"xlink:href":"#icon-gouwuche"})],-1)])),_:1})]),_:1}))]),_:1}),t(w,{span:4,class:"nav-right"},{default:o(()=>[c.value?(i(),x("div",Y,[t(H,null,{dropdown:o(()=>[t(D,null,{default:o(()=>[t(L,{onClick:U},{default:o(()=>n[12]||(n[12]=[a("个人中心")])),_:1}),t(L,{onClick:d(g),divided:""},{default:o(()=>n[13]||(n[13]=[a("退出登录")])),_:1},8,["onClick"])]),_:1})]),default:o(()=>[e("span",Z,[t($,{src:d(u).avatarUrl},null,8,["src"]),e("span",null,E(d(u).username),1)])]),_:1})])):(i(),x("div",X,[t(m,{type:"primary",onClick:k,link:""},{default:o(()=>n[10]||(n[10]=[a("登录")])),_:1}),t(m,{type:"success",onClick:y,link:""},{default:o(()=>n[11]||(n[11]=[a("注册")])),_:1})]))]),_:1})]),_:1})]),_:1})}}}),oe=h(ee,[["__scopeId","data-v-134d8c31"]]),te={class:"ecommerce-homepage"},ne=S({__name:"LayoutView",setup(b){return(s,r)=>{const u=l("el-header"),c=l("RouterView"),g=l("el-main"),k=l("el-footer"),y=l("el-container");return i(),x("div",te,[t(y,null,{default:o(()=>[t(u,{class:"nav-container"},{default:o(()=>[t(oe)]),_:1}),t(g,null,{default:o(()=>[t(c)]),_:1}),t(k,{class:"footer"},{default:o(()=>[t(W)]),_:1})]),_:1})])}}}),fe=h(ne,[["__scopeId","data-v-b2ad64b6"]]);export{fe as default};
