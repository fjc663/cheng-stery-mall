package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.dto.OrderDTO;
import com.cstery.chengsterymall.domain.po.Order;
import com.cstery.chengsterymall.domain.vo.OrderVO;

import java.util.List;

public interface OrderService extends IService<Order> {

    /**
     * 为当前购物车商品创建订单
     * @param orderDTO
     */
    void createOrder(OrderDTO orderDTO);

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
     */
    void buyAgain(Long id);
}
