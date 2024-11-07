package com.cstery.order.task;

import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.order.domain.po.Order;
import com.cstery.order.service.OrderService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Component
public class OrderTask {

    @Resource
    private OrderService orderService;

    /**
     * 处理超时订单
     */
    @Scheduled(cron = "0 * * * * ?")
    public void cancelOrder(){

        LocalDateTime time = LocalDateTime.now().plusMinutes(-15);

        List<Order> orderList = Db.lambdaQuery(Order.class)
                .eq(Order::getStatus, Order.ALIPAY)
                .le(Order::getCreatedAt, time)
                .list();

        if (orderList != null && !orderList.isEmpty()){
            for (Order order : orderList) {
                orderService.cancelOrder(order.getId());
            }
        }
    }

    /**
     * 处理一直处于送货中的订单
     */
    @Scheduled(cron = "0 0 0 ? * 1") // 每周触发1次
    public void processDeliveryOrder(){
        LocalDateTime time = LocalDateTime.now().plusDays(-7);

        List<Order> orderList = Db.lambdaQuery(Order.class)
                .eq(Order::getStatus, Order.ALIPAY)
                .le(Order::getCreatedAt, time)
                .list();

        if (orderList != null && !orderList.isEmpty()){
            for (Order order : orderList) {
                orderService.completeOrder(order.getId());
            }
        }

    }

}
