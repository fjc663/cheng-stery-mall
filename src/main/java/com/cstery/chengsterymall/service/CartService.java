package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.dto.CartDTO;
import com.cstery.chengsterymall.domain.po.Cart;
import com.cstery.chengsterymall.domain.vo.CartVO;

import java.util.List;

public interface CartService extends IService<Cart> {

    /**
     * 添加商品到购物车
     * @param cartDTO
     */
    void add(CartDTO cartDTO);

    /**
     * 获得当前用户购物车的商品数量（同种商品算一个）
     * @return
     */
    Integer getCartItemsNum();

    /**
     * 根据用户id返回购物车数据
     * @return
     */
    List<CartVO> getByUserId();

    /**
     * 根据购物车记录ID更新商品数量
     * @param id
     * @param quantity
     */
    void updateCart(Long id, Integer quantity);

    /**
     * 根据ID删除购物车记录
     * @param id
     */
    void deleteCart(Long id);

    /**
     * 根据用户id清空购物车
     */
    void deleteAllItem();

    /**
     * 根据选中的id返回购物车商品数据
     * @param selectedCardId
     * @return
     */
    List<CartVO> getBySelectId(List<Long> selectedCardId);

    /**
     * 根据购物车id列表删除购物车数据
     * @param selectedCardId
     */
    void deleteItemBySelectId(List<Long> selectedCardId);
}
