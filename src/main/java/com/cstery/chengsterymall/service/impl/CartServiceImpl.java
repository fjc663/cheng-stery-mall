package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.chengsterymall.constant.MessageConstant;
import com.cstery.chengsterymall.context.BaseContext;
import com.cstery.chengsterymall.domain.dto.CartDTO;
import com.cstery.chengsterymall.domain.po.Cart;
import com.cstery.chengsterymall.domain.po.Product;
import com.cstery.chengsterymall.domain.vo.CartVO;
import com.cstery.chengsterymall.exceptions.CartException;
import com.cstery.chengsterymall.mapper.CartMapper;
import com.cstery.chengsterymall.service.CartService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {

    /**
     * 添加商品到购物车
     * @param cartDTO
     * @return
     */
    @Override
    @Transactional
    public Long add(CartDTO cartDTO) {

        Long userId = BaseContext.getCurrentId();

        // 查询购物车，判断当前商品是否已经存在购物车
        LambdaQueryWrapper<Cart> cartLambdaQueryWrapper = new LambdaQueryWrapper<Cart>()
                .eq(Cart::getUserId, userId)
                .eq(Cart::getProductId, cartDTO.getProductId())
                .eq(Cart::getSpecifications, cartDTO.getSpecifications());
        Cart cart = getOne(cartLambdaQueryWrapper);

        // 当前商品已存在购物车,数量加1
        if (cart != null){
            LambdaUpdateWrapper<Cart> cartLambdaUpdateWrapper = new LambdaUpdateWrapper<Cart>()
                    .set(Cart::getQuantity, cart.getQuantity() + cartDTO.getQuantity())
                    .set(Cart::getUpdatedAt, LocalDateTime.now())
                    .eq(Cart::getId, cart.getId());
            update(cartLambdaUpdateWrapper);
        }else { // 不存在于购物车，创建新数据插入购物车
            cart = BeanUtil.copyProperties(cartDTO, Cart.class);

            cart.setUserId(userId);
            cart.setCreatedAt(LocalDateTime.now());
            cart.setUpdatedAt(LocalDateTime.now());

            save(cart);
        }

        return cart.getId();
    }

    /**
     * 获得当前用户购物车的商品数量（同种商品算一个）
     * @return
     */
    @Override
    public Integer getCartItemsNum() {
        LambdaUpdateWrapper<Cart> cartLambdaUpdateWrapper = new LambdaUpdateWrapper<Cart>()
                .eq(Cart::getUserId, BaseContext.getCurrentId());
        long cartItemsNum = count(cartLambdaUpdateWrapper);

        return (int) cartItemsNum;
    }

    /**
     * 根据用户id返回购物车数据
     * @return
     */
    @Override
    public List<CartVO> getByUserId() {
        LambdaQueryWrapper<Cart> cartLambdaQueryWrapper = new LambdaQueryWrapper<Cart>()
                .eq(Cart::getUserId, BaseContext.getCurrentId())
                .orderByDesc(Cart::getCreatedAt);
        List<Cart> cartList = list(cartLambdaQueryWrapper);

        if (CollUtil.isEmpty(cartList)){
            throw new CartException(MessageConstant.CARTEMPTY);
        }

        List<CartVO> cartVOList = BeanUtil.copyToList(cartList, CartVO.class);
        cartVOList.forEach(cartVO -> {
            Product product = Db.getById(cartVO.getProductId(), Product.class);

            cartVO.setProductName(product.getName());
            cartVO.setProductImageUrl(product.getImageUrl());
            cartVO.setProductPrice(product.getPrice());
        });

        return cartVOList;
    }

    /**
     * 根据购物车记录ID更新商品数量
     * @param id
     * @param quantity
     */
    @Override
    @Transactional
    public void updateCart(Long id, Integer quantity) {
        LambdaUpdateWrapper<Cart> cartLambdaUpdateWrapper = new LambdaUpdateWrapper<Cart>()
                .set(Cart::getQuantity, quantity)
                .eq(Cart::getUserId, BaseContext.getCurrentId())
                .eq(Cart::getId, id);
        update(cartLambdaUpdateWrapper);
    }

    /**
     * 根据ID删除购物车记录
     * @param id
     */
    @Override
    @Transactional
    public void deleteCart(Long id) {
        LambdaQueryWrapper<Cart> cartLambdaQueryWrapper = new LambdaQueryWrapper<Cart>()
                .eq(Cart::getUserId, BaseContext.getCurrentId())
                .eq(Cart::getId, id);
        remove(cartLambdaQueryWrapper);
    }

    /**
     * 根据用户id清空购物车
     */
    @Override
    @Transactional
    public void deleteAllItem() {
        LambdaQueryWrapper<Cart> cartLambdaQueryWrapper = new LambdaQueryWrapper<Cart>()
                .eq(Cart::getUserId, BaseContext.getCurrentId());
        remove(cartLambdaQueryWrapper);
    }

    /**
     * 根据选中的id返回购物车商品数据
     * @param selectedCardId
     * @return
     */
    @Override
    public List<CartVO> getBySelectId(List<Long> selectedCardId) {
        LambdaQueryWrapper<Cart> cartLambdaQueryWrapper = new LambdaQueryWrapper<Cart>()
                .in(Cart::getId, selectedCardId)
                .orderByDesc(Cart::getCreatedAt);

        List<Cart> cartList = list(cartLambdaQueryWrapper);

        if (CollUtil.isEmpty(cartList)){
            throw new CartException(MessageConstant.NOTSELECTPRODUCT);
        }

        // 转发为vo对象
        List<CartVO> cartVOList = BeanUtil.copyToList(cartList, CartVO.class);

        // 增加商品数据
        cartVOList.forEach(cartVO -> {
            Product product = Db.getById(cartVO.getProductId(), Product.class);

            cartVO.setProductName(product.getName());
            cartVO.setProductImageUrl(product.getImageUrl());
            cartVO.setProductPrice(product.getPrice());
        });

        return cartVOList;
    }

    /**
     * 根据购物车id列表删除购物车数据
     * @param selectedCardId
     */
    @Override
    @Transactional
    public void deleteItemBySelectId(List<Long> selectedCardId) {
        LambdaQueryWrapper<Cart> cartLambdaQueryWrapper = new LambdaQueryWrapper<Cart>()
                .in(Cart::getId, selectedCardId);
        remove(cartLambdaQueryWrapper);
    }
}
