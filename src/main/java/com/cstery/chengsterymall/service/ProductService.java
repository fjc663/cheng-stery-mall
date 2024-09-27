package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.dto.ProductPageQueryDTO;
import com.cstery.chengsterymall.domain.po.Product;
import com.cstery.chengsterymall.domain.vo.ProductVO;
import com.cstery.chengsterymall.result.PageResult;

import java.util.List;

public interface ProductService extends IService<Product> {

    /**
     * 根据分类id返回商品
     * @param categoryId
     * @return
     */
    List<ProductVO> getByCategoryId(Long categoryId);

    /**
     * 根据商品id返回商品
     * @param id
     * @return
     */
    ProductVO getProductDetailInfo(Long id);

    /**
     * 分页查询商品数据
     * @param productPageQueryDTO
     * @return
     */
    PageResult productPageQuery(ProductPageQueryDTO productPageQueryDTO);
}
