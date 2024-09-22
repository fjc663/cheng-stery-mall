package com.cstery.chengsterymall.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.chengsterymall.constant.MessageConstant;
import com.cstery.chengsterymall.context.BaseContext;
import com.cstery.chengsterymall.domain.dto.OrderDTO;
import com.cstery.chengsterymall.domain.po.Address;
import com.cstery.chengsterymall.domain.po.Order;
import com.cstery.chengsterymall.domain.po.OrderItem;
import com.cstery.chengsterymall.domain.vo.CartVO;
import com.cstery.chengsterymall.domain.vo.OrderItemVO;
import com.cstery.chengsterymall.domain.vo.OrderVO;
import com.cstery.chengsterymall.exceptions.AddressException;
import com.cstery.chengsterymall.exceptions.CartException;
import com.cstery.chengsterymall.exceptions.OrderException;
import com.cstery.chengsterymall.mapper.OrderMapper;
import com.cstery.chengsterymall.service.CartService;
import com.cstery.chengsterymall.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    private final CartService cartService;

    /**
     * 为当前购物车商品创建订单
     * @param orderDTO
     */
    @Override
    @Transactional
    public void createOrder(OrderDTO orderDTO) {
        // 查出购物车数据
        List<CartVO> cartList = cartService.getByUserId();
        if (CollUtil.isEmpty(cartList)){
            throw new CartException(MessageConstant.CARTEMPTY);
        }

        // 根据地址ID查出送货地址
        Address address = Db.getById(orderDTO.getAddressId(), Address.class);
        if (address == null){
            throw new AddressException(MessageConstant.ADDRESSEMPTY);
        }
        String shippingAddress = address.getReceiverName() + " "
                + address.getReceiverPhone() + "\n"
                + address.getProvince() + " "
                + address.getCity() + " "
                + address.getDistrict() + " "
                + address.getDetailedAddress();


        // 校验订单总金额
        BigDecimal totalAmoun = BigDecimal.ZERO; // 订单总金额
        for (CartVO cart : cartList) {
            totalAmoun = totalAmoun.add(cart.getProductPrice().multiply(BigDecimal.valueOf(cart.getQuantity()))) ;
        }

        // 订单总额异常
        if (totalAmoun.compareTo(orderDTO.getTotalAmount()) != 0){
            throw new OrderException(MessageConstant.TOTALAMOUTERROR);
        }

        // 创建订单对象
        Order order = BeanUtil.copyProperties(orderDTO, Order.class);
        order.setUserId(BaseContext.getCurrentId()); // 设置用户id
        order.setOrderNumber(String.valueOf(System.currentTimeMillis())); // 设置订单编号
        order.setStatus(Order.ALIPAY); // 设置订单状态
        order.setPaymentStatus(Order.UNPAID); // 设置支付状态
        order.setShippingAddress(shippingAddress); // 设置收货地址与联系方式
        order.setItemCount(cartList.size()); // 设置商品数
        order.setCreatedAt(LocalDateTime.now()); // 设置创建时间
        order.setUpdatedAt(LocalDateTime.now()); // 设置更新时间

        // 插入订单对象并获得返回的id
        save(order);
        Long orderId = order.getId();

        // 创建订单商品对象列表
        List<OrderItem> orderItemList = BeanUtil.copyToList(cartList, OrderItem.class);
        orderItemList.forEach(orderItem -> {
            orderItem.setOrderId(orderId);
            orderItem.setCreatedAt(LocalDateTime.now());
        });
        // 批量插入订单商品对象
        Db.saveBatch(orderItemList);

        // 清空购物车
        cartService.deleteAllItem();

    }

    /**
     * 根据订单状态返回订单数据
     * @param status
     * @return
     */
    @Override
    public List<OrderVO> getOrdersByStatus(Integer status) {
        // 查询当前用户符合状态的订单
        LambdaQueryWrapper<Order> orderLambdaQueryWrapper = new LambdaQueryWrapper<Order>()
                .eq(Order::getUserId, BaseContext.getCurrentId())
                .orderByDesc(Order::getCreatedAt);

        Set<Integer> validStatuses = Set.of(Order.PENDING_PAYMENT, Order.CONFIRM, Order.SHIPPED, Order.COMPLETED, Order.CANCELED);

        if (validStatuses.contains(status)) {
            orderLambdaQueryWrapper.eq(Order::getStatus, status);
        }

        List<Order> orderList = list(orderLambdaQueryWrapper);

        // 将订单对象转化为订单VO
        List<OrderVO> orderVOList = BeanUtil.copyToList(orderList, OrderVO.class);

        // 为订单设置商品数据
        orderVOList.forEach(orderVO -> {
            // 根据订单id查询商品数据
            List<OrderItem> orderItemList = Db.lambdaQuery(OrderItem.class)
                    .eq(OrderItem::getOrderId, orderVO.getId())
                    .list();

            // 将订单商品对象转化为订单商品VO
            List<OrderItemVO> orderItemVOList = BeanUtil.copyToList(orderItemList, OrderItemVO.class);

            orderVO.setOrderItemVOList(orderItemVOList);
        });

        return orderVOList;
    }

    /**
     * 根据订单id返回订单详情
     * @param id
     * @return
     */
    @Override
    public OrderVO getOrderDetail(Long id) {
        // 获得订单信息
        Order order = getById(id);

        // 根据订单id获得订单商品信息
        List<OrderItem> orderItemList = Db.lambdaQuery(OrderItem.class)
                .eq(OrderItem::getOrderId, order.getId())
                .list();

        // 转发为VO对象
        OrderVO orderVO = BeanUtil.copyProperties(order, OrderVO.class);
        List<OrderItemVO> orderItemVOList = BeanUtil.copyToList(orderItemList, OrderItemVO.class);

        orderVO.setOrderItemVOList(orderItemVOList);

        return orderVO;
    }
}
