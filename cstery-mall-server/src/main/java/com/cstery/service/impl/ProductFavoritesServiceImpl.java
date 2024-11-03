package com.cstery.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.constant.MessageConstant;
import com.cstery.context.BaseContext;
import com.cstery.exceptions.ProductException;
import com.cstery.mapper.ProductFavoritesMappper;
import com.cstery.service.ProductFavoritesService;
import com.cstery.po.Product;
import com.cstery.po.ProductFavorite;
import com.cstery.vo.ProductFavoriteVO;
import com.cstery.vo.ProductVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProductFavoritesServiceImpl extends ServiceImpl<ProductFavoritesMappper, ProductFavorite> implements ProductFavoritesService {

    /**
     * 根据商品id添加商品到收藏夹
     * @param id
     */
    @Override
    @Transactional
    public void addToFavorites(Long id) {
        // 判断商品是否在收藏夹
        LambdaQueryWrapper<ProductFavorite> productFavoriteLambdaQueryWrapper = new LambdaQueryWrapper<ProductFavorite>()
                .eq(ProductFavorite::getUserId, BaseContext.getCurrentId())
                .eq(ProductFavorite::getProductId, id);
        ProductFavorite productFavorite =getOne(productFavoriteLambdaQueryWrapper);
        if (productFavorite != null) {
            throw new ProductException(MessageConstant.ALREADYINFAVOITES);
        }

        // 插入收藏夹数据
        productFavorite = ProductFavorite
                .builder()
                .userId(BaseContext.getCurrentId())
                .productId(id)
                .createdAt(LocalDateTime.now())
                .updatedAt(LocalDateTime.now())
                .build();
        save(productFavorite);
    }

    /**
     * 查询收藏商品信息
     * @return
     */
    @Override
    public List<ProductFavoriteVO> getFavorites() {
        // 查询用户的收藏商品信息
        LambdaQueryWrapper<ProductFavorite> productFavoriteLambdaQueryWrapper = new LambdaQueryWrapper<ProductFavorite>()
                .eq(ProductFavorite::getUserId, BaseContext.getCurrentId())
                .orderByDesc(ProductFavorite::getCreatedAt);
        List<ProductFavorite> productFavoriteList = list(productFavoriteLambdaQueryWrapper);

        // 查询对应的商品信息,并返回对应的VO对象
        List<ProductFavoriteVO> productFavoriteVOList = new ArrayList<>();
        for (ProductFavorite productFavorite : productFavoriteList) {
            Product product = Db.getById(productFavorite.getProductId(), Product.class);
            ProductVO productVO = BeanUtil.copyProperties(product, ProductVO.class);

            ProductFavoriteVO productFavoriteVO = ProductFavoriteVO
                    .builder()
                    .product(productVO)
                    .createdAt(productFavorite.getCreatedAt())
                    .build();

            productFavoriteVOList.add(productFavoriteVO);
        }

        return productFavoriteVOList;
    }

    /**
     * 根据商品id删除收藏夹商品
     * @param id
     */
    @Override
    @Transactional
    public void deleteFavoritesProduct(Long id) {
        LambdaQueryWrapper<ProductFavorite> productFavoriteLambdaQueryWrapper = new LambdaQueryWrapper<ProductFavorite>()
                .eq(ProductFavorite::getUserId, BaseContext.getCurrentId())
                .eq(ProductFavorite::getProductId, id);
        remove(productFavoriteLambdaQueryWrapper);
    }
}
