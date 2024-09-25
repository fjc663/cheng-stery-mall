package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.chengsterymall.domain.po.FeaturedProduct;
import com.cstery.chengsterymall.domain.po.Product;
import com.cstery.chengsterymall.domain.vo.FeaturedProductVO;
import com.cstery.chengsterymall.domain.vo.ProductVO;
import com.cstery.chengsterymall.mapper.FeaturedProductMapper;
import com.cstery.chengsterymall.service.FeaturedProductService;
import org.springframework.stereotype.Service;

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
                .orderByDesc(FeaturedProduct::getDisplayOrder);
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
}
