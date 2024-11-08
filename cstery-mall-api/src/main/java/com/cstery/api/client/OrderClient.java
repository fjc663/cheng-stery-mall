package com.cstery.api.client;


import com.cstery.api.vo.Hot10VO;
import com.cstery.common.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@FeignClient("order-service")
public interface OrderClient {

    /**
     * 获得总销售额
     */
    @GetMapping("/admin/order/sales")
    Result<BigDecimal> getTotalSales(@RequestParam("startData") LocalDate startData,
                                     @RequestParam("endData") LocalDate endData,
                                     @RequestParam("isCumulative") Boolean isCumulative);

    /**
     * 获得总订单数
     */
    @GetMapping("/admin/order/orders")
    Result<Integer> getTotalOrders(@RequestParam("startData") LocalDate startData,
                                   @RequestParam("endData") LocalDate endData);

    /**
     * 获得前10热门商品
     */
    @GetMapping("/admin/order/hot10")
    Result<List<Hot10VO>> getHot10Product(@RequestParam("startData") LocalDate startData,
                                          @RequestParam("endData") LocalDate endData);

    /**
     * 获得最热门商品
     */
    @GetMapping("/admin/order/hottest")
    Result<String> getHotProduct(@RequestParam("startData") LocalDate startData,
                                 @RequestParam("endData") LocalDate endData);

    /**
     * 获得各状态订单数
     */
    @GetMapping("/admin/order/statuses")
    Result<List<Integer>> getStatusList(@RequestParam("startData") LocalDate startData,
                                        @RequestParam("endData") LocalDate endData);

}
