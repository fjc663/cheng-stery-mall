package com.cstery.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.product.domain.po.FeaturedProduct;
import com.cstery.product.domain.vo.FeaturedProductVO;

import java.util.List;

public interface FeaturedProductService extends IService<FeaturedProduct> {

    /**
     * 返回特色商品数据
     * @return
     */
    List<FeaturedProductVO> getFeaturedProducts();

    /**
     * 设置商品类型
     * @param id
     * @param type
     */
    void setFeaturedType(Long id, Integer type);

    /**
     * 去除商品类型
     * @param id
     * @param type
     */
    void resetFeaturedType(Long id, Integer type);
}
