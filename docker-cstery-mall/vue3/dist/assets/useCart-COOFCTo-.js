import{g as m,d as u,u as r,a as n,b as d,c as I}from"./useCartItemsNumStore-BpwacNS2.js";import{e as i,D as s}from"./index-CMV7StrB.js";const a=i([]),o=async()=>{const t=await m();if(t.code===0){a.value=[],s.warning(t.msg);return}a.value=t.data},l=async()=>{const t=await u();t.code===0?s.error(t.msg):(s.success("购物车已清空"),a.value=[],r().getCartItemsNum())},C=async t=>{const e=await n(t.id);e.code===0?s.error(e.msg):(r().getCartItemsNum(),o())},g=async t=>{const e=await d(t.id,t.quantity);e.code===0&&s.error(e.msg)},N=async t=>{const e=await I(t);e.code===1?(s.success("加入购物车成功"),r().getCartItemsNum()):s.error(e.msg)};function A(){return{cartItems:a,getCartItems:o,deleteAllCart:l,deleteCart:C,updateCartItemQuantity:g,addPorductToCart:N}}export{A as u};
