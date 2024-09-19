package com.cstery.chengsterymall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.chengsterymall.domain.dto.OrderDTO;
import com.cstery.chengsterymall.domain.po.Order;
import com.cstery.chengsterymall.domain.vo.OrderVO;

public interface OrderService extends IService<Order> {

    /**
     * 为当前购物车商品创建订单
     * @param orderDTO
     */
    void createOrder(OrderDTO orderDTO);
}
