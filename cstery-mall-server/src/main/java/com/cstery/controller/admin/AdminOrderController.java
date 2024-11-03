package com.cstery.controller.admin;

import com.cstery.dto.OrderPageQueryDTO;
import com.cstery.result.PageResult;
import com.cstery.result.Result;
import com.cstery.service.OrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

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

}

