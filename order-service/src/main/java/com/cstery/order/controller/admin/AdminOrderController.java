package com.cstery.order.controller.admin;


import com.cstery.order.domain.dto.ChartDTO;
import com.cstery.order.domain.dto.OrderPageQueryDTO;
import com.cstery.order.domain.vo.Hot10VO;
import com.cstery.order.service.OrderService;
import com.cstery.common.result.PageResult;
import com.cstery.common.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/admin/order")
@RequiredArgsConstructor
@Api(tags = "管理端订单相关接口")
public class AdminOrderController {

    private final OrderService orderService;

    /**
     * 订单数据分页查询
     * @param orderPageQueryDTO
     * @return
     */
    @GetMapping("/page")
    @ApiOperation("订单数据分页查询")
    public Result<PageResult> pageQuery(OrderPageQueryDTO orderPageQueryDTO) {
        PageResult pageResult = orderService.pageQuery(orderPageQueryDTO);
        return Result.success(pageResult);
    }

    /**
     * 修改订单状态
     * @param status
     * @param id
     * @return
     */
    @PutMapping("/status/{status}")
    @ApiOperation("修改订单状态")
    public Result setOrderStatus(@RequestParam @ApiParam("订单id") Long id,@PathVariable @ApiParam("订单状态") Integer status) {
        orderService.setOrderStatus(id, status);
        return Result.success();
    }

    /**
     * 获得总销售额
     */
    @GetMapping("/sales")
    @ApiOperation("获得总销售额")
    public Result<BigDecimal> getTotalSales(LocalDate startData, LocalDate endData, Boolean isCumulative) {
        ChartDTO chartDTO = ChartDTO
                .builder()
                .startData(startData)
                .endData(endData)
                .build();
        BigDecimal totalSales = orderService.getTotalSales(chartDTO, isCumulative);
        return Result.success(totalSales);
    }

    /**
     * 获得总订单数
     */
    @GetMapping("/orders")
    @ApiOperation("获得总订单数")
    public Result<Integer> getTotalOrders(LocalDate startData, LocalDate endData) {
        ChartDTO chartDTO = ChartDTO
                .builder()
                .startData(startData)
                .endData(endData)
                .build();
        Integer totalOrders = orderService.getTotalOrders(chartDTO);
        return Result.success(totalOrders);
    }

    /**
     * 获得前10热门商品
     */
    @GetMapping("/hot10")
    @ApiOperation("获得前10热门商品")
    public Result<List<Hot10VO>> getHot10Product(LocalDate startData, LocalDate endData) {
        ChartDTO chartDTO = ChartDTO
                .builder()
                .startData(startData)
                .endData(endData)
                .build();
        List<Hot10VO> hot10Product = orderService.getHot10Product(chartDTO);
        return Result.success(hot10Product);
    }

    /**
     * 获得最热门商品
     */
    @GetMapping("/hottest")
    @ApiOperation("获得最热门商品")
    public Result<String> getHotProduct(LocalDate startData, LocalDate endData) {
        ChartDTO chartDTO = ChartDTO
                .builder()
                .startData(startData)
                .endData(endData)
                .build();
        String hotProduct = orderService.getHotProduct(chartDTO);
        return Result.success(hotProduct);
    }

    /**
     * 获得各状态订单数
     */
    @GetMapping("/statuses")
    @ApiOperation("获得各状态订单数")
    public Result<List<Integer>> getStatusList(LocalDate startData, LocalDate endData) {
        ChartDTO chartDTO = ChartDTO
                .builder()
                .startData(startData)
                .endData(endData)
                .build();
        List<Integer> statusList = orderService.getStatusList(chartDTO);
        return Result.success(statusList);
    }

}

