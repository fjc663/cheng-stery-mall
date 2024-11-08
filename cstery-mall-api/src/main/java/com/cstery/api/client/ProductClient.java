package com.cstery.api.client;

import com.cstery.api.vo.ProductVO;
import com.cstery.common.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;


@FeignClient("product-service")
public interface ProductClient {

    /**
     * 根据分类ID返回商品数据
     */
    @GetMapping("/user/product/list")
    Result<List<ProductVO>> queryProductByCategoryId(@RequestParam("id") Long id);

    /**
     * 根据商品ID返回商品详细数据
     */
    @GetMapping("/user/product")
    Result<ProductVO> queryProductById(@RequestParam("id") Long id);

    /**
     * 增加被取消商品的库存
     */
    @PutMapping("/admin/product/stock/inc")
    Result<Void> incProductStock(@RequestParam("quantities") Map<String, Integer> quantities);

    /**
     * 增加完成订单商品的销量
     */
    @PutMapping("/admin/product/sales")
    Result<Void> updateProductSales(@RequestParam("sales") Map<String, Integer> sales);

    /**
     * 减少商品的库存
     */
    @PutMapping("/admin/product/stock/dec")
    Result<Void> decProductStock(@RequestParam("quantities") Map<String, Integer> quantities);

}
