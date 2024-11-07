package com.cstery.product.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.cstery.product.domain.po.Product;
import com.cstery.product.domain.vo.ProductVO;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface ProductMapper extends BaseMapper<Product> {

    /**
     * 分页查询商品数据
     * @param page
     * @param name
     * @param categoryId
     * @param status
     * @param type
     * @return
     */
    IPage<ProductVO> selectProductPage(IPage<ProductVO> page,
                                       @Param("name") String name,
                                       @Param("categoryId") Long categoryId,
                                       @Param("status") Integer status,
                                       @Param("type") Integer type);

    /**
     * 增加被取消订单中商品数量
     * @param quantities
     */
    void batchIncreaseStock(Map<String, Integer> quantities);

    /**
     * 增加商品销量
     * @param sales
     */
    void batchIncreaseSale(Map<String, Integer> sales);

    /**
     * 减少商品的库存
     * @param quantities
     */
    void batchDecreaseStock(Map<String, Integer> quantities);
}
