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

import java.util.List;

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
    public Result<Long> createOrder(@RequestBody OrderDTO orderDTO) {
        Long id = orderService.createOrder(orderDTO);
        return Result.success(id);
    }

    /**
     * 根据订单状态返回订单数据
     * @param status
     * @return
     */
    @GetMapping("/status/{status}")
    @ApiOperation("根据订单状态返回订单数据")
    public Result<List<OrderVO>> getOrdersByStatus(@PathVariable @ApiParam("订单状态") Integer status) {
        List<OrderVO> orderVOList = orderService.getOrdersByStatus(status);
        return Result.success(orderVOList);
    }

    /**
     * 根据订单id返回订单详情
     * @param id
     * @return
     */
    @GetMapping
    @ApiOperation("根据订单id返回订单详情")
    public Result<OrderVO> getOrderDetail(@RequestParam @ApiParam("订单id") Long id){
        OrderVO orderVO = orderService.getOrderDetail(id);
        return Result.success(orderVO);
    }

    /**
     * 根据订单id取消订单
     * @param id
     * @return
     */
    @PutMapping("/cancel/{id}")
    @ApiOperation("根据订单id取消订单")
    public Result cancelOrder(@PathVariable @ApiParam("订单id") Long id) {
        orderService.cancelOrder(id);
        return Result.success();
    }

    /**
     * 再次购买
     * @param id
     * @return
     */
    @PostMapping("/buyagain/{id}")
    @ApiOperation("再次购买")
    public Result<List<Long>> buyAgain(@PathVariable @ApiParam("订单id") Long id) {
        List<Long> cartIds = orderService.buyAgain(id);
        return Result.success(cartIds);
    }

    /**
     * 订单支付
     * @param id
     * @return
     */
    @PutMapping("/pay/{id}")
    @ApiOperation("订单支付")
    public Result payOrder(@PathVariable @ApiParam("订单id") Long id) {
        orderService.payOrder(id);
        return Result.success();
    }

    /**
     * 订单完成
     * @param id
     * @return
     */
    @PutMapping("/complete/{id}")
    @ApiOperation("订单完成")
    public Result completeOrder(@PathVariable @ApiParam("订单id") Long id) {
        orderService.completeOrder(id);
        return Result.success();
    }
}
