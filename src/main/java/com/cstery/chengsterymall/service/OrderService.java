package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.dto.OrderDTO;
import com.cstery.chengsterymall.domain.dto.OrderPageQueryDTO;
import com.cstery.chengsterymall.domain.po.Order;
import com.cstery.chengsterymall.domain.vo.OrderVO;
import com.cstery.chengsterymall.result.PageResult;

import java.util.List;

public interface OrderService extends IService<Order> {

    /**
     * 为当前购物车商品创建订单
     * @param orderDTO
     * @return
     */
    Long createOrder(OrderDTO orderDTO);

    /**
     * 根据订单状态返回订单数据
     * @param status
     * @return
     */
    List<OrderVO> getOrdersByStatus(Integer status);

    /**
     * 根据订单id返回订单详情
     * @param id
     * @return
     */
    OrderVO getOrderDetail(Long id);

    /**
     * 根据订单id取消订单
     * @param id
     */
    void cancelOrder(Long id);

    /**
     * 再次购买
     * @param id
     * @return
     */
    List<Long> buyAgain(Long id);

    /**
     * 订单数据分页查询
     * @param orderPageQueryDTO
     * @return
     */
    PageResult pageQuery(OrderPageQueryDTO orderPageQueryDTO);

    /**
     * 修改订单状态
     * @param status
     * @param id
     */
    void setOrderStatus(Long id, Integer status);

    /**
     * 订单支付
     * @param id
     */
    void payOrder(Long id);

    /**
     * 订单完成
     * @param id
     */
    void completeOrder(Long id);
}
