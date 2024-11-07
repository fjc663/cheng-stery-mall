package com.cstery.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.product.domain.dto.ProductDTO;
import com.cstery.product.domain.dto.ProductPageQueryDTO;
import com.cstery.product.domain.po.Product;
import com.cstery.product.domain.vo.ProductVO;
import com.cstery.result.PageResult;

import java.util.List;
import java.util.Map;

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

    /**
     * 管理端商品分页查询
     * @param productPageQueryDTO
     * @return
     */
    PageResult adminProductPageQuery(ProductPageQueryDTO productPageQueryDTO);

    /**
     * 添加商品
     * @param productDTO
     */
    void add(ProductDTO productDTO);

    /**
     * 修改商品信息
     * @param productDTO
     */
    void edit(ProductDTO productDTO);

    /**
     * 删除商品
     * @param id
     */
    void delete(Long id);

    /**
     * 增加被取消商品的库存
     * @param quantities
     */
    void increaseStock(Map<String, Integer> quantities);

    /**
     * 增加商品销量
     * @param sales
     */
    void increaseSales(Map<String, Integer> sales);

    /**
     * 减少商品的库存
     * @param quantities
     */
    void decreaseStock(Map<String, Integer> quantities);
}
