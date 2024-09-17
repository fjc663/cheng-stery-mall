package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.po.Product;
import com.cstery.chengsterymall.domain.vo.ProductVO;

import java.util.List;

public interface ProductService extends IService<Product> {

    /**
     * 根据分类id返回商品
     * @param categoryId
     * @return
     */
    List<ProductVO> getByCategoryId(Long categoryId);
}
