package com.cstery.chengsterymall.controller.user;

import com.cstery.chengsterymall.domain.dto.OrderDTO;
import com.cstery.chengsterymall.domain.vo.OrderVO;
import com.cstery.chengsterymall.result.Result;
import com.cstery.chengsterymall.service.OrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("user/order")
@RequiredArgsConstructor
@Api(tags = "用户端订单相关接口")
public class OrderController {

    private final OrderService orderService;

    /**
     * 为当前购物车商品创建订单
     * @param orderDTO
     * @return
     */
    @PostMapping
    @ApiOperation("为当前购物车商品创建订单")
    public Result createOrder(@RequestBody OrderDTO orderDTO) {
        orderService.createOrder(orderDTO);
        return Result.success();
    }
}
