package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.po.FeaturedProduct;
import com.cstery.chengsterymall.domain.vo.FeaturedProductVO;

import java.util.List;

public interface FeaturedProductService extends IService<FeaturedProduct> {

    /**
     * 返回特色商品数据
     * @return
     */
    List<FeaturedProductVO> getFeaturedProducts();
}
