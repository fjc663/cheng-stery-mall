package com.cstery.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.mapper.FeaturedProductMapper;
import com.cstery.po.FeaturedProduct;
import com.cstery.po.Product;
import com.cstery.service.FeaturedProductService;
import com.cstery.vo.FeaturedProductVO;
import com.cstery.vo.ProductVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class FeaturedProductServiceImpl extends ServiceImpl<FeaturedProductMapper, FeaturedProduct> implements FeaturedProductService {

    /**
     * 返回特色商品数据
     * @return
     */
    @Override
    public List<FeaturedProductVO> getFeaturedProducts() {
        // 查询特色商品表
        LambdaQueryWrapper<FeaturedProduct> featuredProductLambdaQueryWrapper = new LambdaQueryWrapper<FeaturedProduct>()
                .orderByDesc(FeaturedProduct::getCreatedAt);
        List<FeaturedProduct> featuredProductList = list(featuredProductLambdaQueryWrapper);

        // 判断是否为空
        if (featuredProductList == null || featuredProductList.isEmpty()) {
            return null;
        }

        // 赋值为VO对象
        List<FeaturedProductVO> featuredProductVOList = BeanUtil.copyToList(featuredProductList, FeaturedProductVO.class);

        // 为特色商品查询对应商品的详细信息
        for (FeaturedProductVO featuredProductVO : featuredProductVOList) {
            Product product = Db.getById(featuredProductVO.getProductId(), Product.class);

            ProductVO productVO = BeanUtil.copyProperties(product, ProductVO.class);

            featuredProductVO.setProduct(productVO);
        }

        return featuredProductVOList;
    }

    /**
     * 设置商品类型
     * @param id
     * @param type
     */
    @Override
    @Transactional
    public void setFeaturedType(Long id, Integer type) {
        FeaturedProduct featuredProduct = FeaturedProduct
                .builder()
                .productId(id)
                .type(type)
                .createdAt(LocalDateTime.now())
                .updatedAt(LocalDateTime.now())
                .build();

        save(featuredProduct);
    }

    /**
     * 去除商品类型
     * @param id
     * @param type
     */
    @Override
    @Transactional
    public void resetFeaturedType(Long id, Integer type) {
        LambdaQueryWrapper<FeaturedProduct> featuredProductLambdaQueryWrapper = new LambdaQueryWrapper<FeaturedProduct>()
                .eq(FeaturedProduct::getProductId, id)
                .eq(FeaturedProduct::getType, type);
        remove(featuredProductLambdaQueryWrapper);
    }
}
