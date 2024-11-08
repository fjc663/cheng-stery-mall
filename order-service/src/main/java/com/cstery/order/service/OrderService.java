package com.cstery.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.cstery.order.domain.dto.ChartDTO;
import com.cstery.order.domain.dto.OrderDTO;
import com.cstery.order.domain.dto.OrderPageQueryDTO;
import com.cstery.order.domain.po.Order;
import com.cstery.order.domain.vo.Hot10VO;
import com.cstery.order.domain.vo.OrderVO;
import com.cstery.common.result.PageResult;

import java.math.BigDecimal;
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

    /**
     * 获得总销售额
     * @param chartDTO
     * @param isCumulative
     * @return
     */
    BigDecimal getTotalSales(ChartDTO chartDTO, Boolean isCumulative);

    /**
     * 获得总订单数
     * @param chartDTO
     * @return
     */
    Integer getTotalOrders(ChartDTO chartDTO);

    /**
     * 获得前10热门商品
     * @param chartDTO
     * @return
     */
    List<Hot10VO> getHot10Product(ChartDTO chartDTO);

    /**
     * 获得最热门商品
     * @param chartDTO
     * @return
     */
    String getHotProduct(ChartDTO chartDTO);

    /**
     * 获得各状态订单数
     * @param chartDTO
     * @return
     */
    public List<Integer> getStatusList(ChartDTO chartDTO);
}
