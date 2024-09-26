package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.po.ProductFavorite;
import com.cstery.chengsterymall.domain.vo.ProductFavoriteVO;

import java.util.List;

public interface ProductFavoritesService extends IService<ProductFavorite> {

    /**
     * 根据商品id添加商品到收藏夹
     * @param id
     */
    void addToFavorites(Long id);

    /**
     * 查询收藏商品信息
     * @return
     */
    List<ProductFavoriteVO> getFavorites();

    /**
     * 根据商品id删除收藏夹商品
     * @param id
     */
    void deleteFavoritesProduct(Long id);
}
