package com.cstery.order.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.Db;
import com.cstery.api.client.ProductClient;
import com.cstery.api.client.UserClient;
import com.cstery.api.vo.AddressVO;
import com.cstery.api.vo.ProductVO;
import com.cstery.common.constant.MessageConstant;
import com.cstery.common.context.BaseContext;
import com.cstery.common.exceptions.AddressException;
import com.cstery.common.exceptions.OrderException;
import com.cstery.common.exceptions.ProductException;
import com.cstery.order.domain.dto.CartDTO;
import com.cstery.order.domain.dto.ChartDTO;
import com.cstery.order.domain.dto.OrderDTO;
import com.cstery.order.domain.dto.OrderPageQueryDTO;
import com.cstery.order.domain.po.Order;
import com.cstery.order.domain.po.OrderItem;
import com.cstery.order.domain.vo.CartVO;
import com.cstery.order.domain.vo.Hot10VO;
import com.cstery.order.domain.vo.OrderItemVO;
import com.cstery.order.domain.vo.OrderVO;
import com.cstery.order.mapper.OrderItemsMapper;
import com.cstery.order.mapper.OrderMapper;
import com.cstery.order.service.CartService;
import com.cstery.order.service.OrderService;
import com.cstery.common.result.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    private final CartService cartService;
    private final OrderItemsMapper orderItemsMapper;
    private final UserClient userClient;
    private final ProductClient productClient;

    /**
     * 为当前购物车商品创建订单
     * @param orderDTO
     * @return
     */
    @Override
    @Transactional
    public Long createOrder(OrderDTO orderDTO) {
        // 查出购物车数据
        List<CartVO> cartList = cartService.getBySelectId(orderDTO.getSelectedCardId());

        // 校验订单总金额
        BigDecimal totalAmount = BigDecimal.ZERO; // 订单总金额

        // 减少商品的库存
        Map<String, Integer> quantities = new HashMap<>();
        for (CartVO cart : cartList) {
            totalAmount = totalAmount.add(cart.getProductPrice().multiply(BigDecimal.valueOf(cart.getQuantity())));

            // 判断库存是否充足
            ProductVO product = productClient.queryProductById(cart.getProductId()).getData();
            if (product.getStock() < cart.getQuantity()) {
                throw new OrderException(cart.getProductName() + MessageConstant.COMMODITYSHORTAGE);
            }

            // 减少库存
            quantities.put(String.valueOf(cart.getProductId()), cart.getQuantity());
        }
        productClient.decProductStock(quantities);

        // 订单总额异常
        if (totalAmount.compareTo(orderDTO.getTotalAmount()) != 0){
            throw new OrderException(MessageConstant.TOTALAMOUTERROR);
        }

        // 根据地址ID查出送货地址
        AddressVO address = userClient.queryAddressById(orderDTO.getAddressId()).getData();
        if (address == null){
            throw new AddressException(MessageConstant.ADDRESSEMPTY);
        }
        String shippingAddress = address.getReceiverName() + " "
                + address.getReceiverPhone() + "\n"
                + address.getProvince() + " "
                + address.getCity() + " "
                + address.getDistrict() + " "
                + address.getDetailedAddress();

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

        // 根据购物车id列表删除购物车数据
        cartService.deleteItemBySelectId(orderDTO.getSelectedCardId());

        return orderId;
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

        return setOrderItem(orderList);
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

    /**
     * 根据订单id取消订单
     * @param id
     */
    @Override
    @Transactional
    public void cancelOrder(Long id) {

        // 查询订单商品
        List<OrderItem> orderItemList = Db.lambdaQuery(OrderItem.class)
                .eq(OrderItem::getOrderId, id)
                .list();

        // 增加被取消商品的库存
        Map<String, Integer> quantities = new HashMap<>();

        for (OrderItem orderItem : orderItemList) {
            quantities.put(String.valueOf(orderItem.getProductId()), orderItem.getQuantity());
        }

        productClient.incProductStock(quantities);

        Order order = Order
                .builder()
                .id(id)
                .canceledAt(LocalDateTime.now())
                .status(Order.CANCELED)
                .updatedAt(LocalDateTime.now())
                .build();

        updateById(order);
    }

    /**
     * 根据订单id支付订单
     * @param id
     */
    @Override
    @Transactional
    public void payOrder(Long id) {
        Order order = Order
                .builder()
                .id(id)
                .paidAt(LocalDateTime.now())
                .status(Order.CONFIRM)
                .paymentStatus(Order.PAID)
                .updatedAt(LocalDateTime.now())
                .build();

        updateById(order);
    }

    /**
     * 完成订单
     * @param id
     */
    @Override
    @Transactional
    public void completeOrder(Long id) {
        // 查询订单商品
        List<OrderItem> orderItemList = Db.lambdaQuery(OrderItem.class)
                .eq(OrderItem::getOrderId, id)
                .list();

        // 增加商品销量
        Map<String, Integer> sales = new HashMap<>();

        for (OrderItem orderItem : orderItemList) {
            sales.put(String.valueOf(orderItem.getProductId()), orderItem.getQuantity());
        }

        productClient.updateProductSales(sales);

        Order order = Order
                .builder()
                .id(id)
                .completedAt(LocalDateTime.now())
                .status(Order.COMPLETED)
                .updatedAt(LocalDateTime.now())
                .build();

        updateById(order);
    }

    /**
     * 再次购买
     * @param id
     */
    @Override
    @Transactional
    public List<Long> buyAgain(Long id) {
        // 根据订单id查询订单商品数据
        List<OrderItem> orderItemList = Db.lambdaQuery(OrderItem.class).eq(OrderItem::getOrderId, id).list();

        if (orderItemList == null || orderItemList.isEmpty()){
            throw new OrderException(MessageConstant.ORDERNOTEXIST);
        }

        // 复制订单商品到购物车
        List<CartDTO> cartDTOList = BeanUtil.copyToList(orderItemList, CartDTO.class);

        // 返回插入购物车后的购物车记录id
        List<Long> cartIds = new ArrayList<>();

        // 判断商品是否存在，并设置价格到购物车
        for (CartDTO cartDTO : cartDTOList) {
            // 查询商品数据
            ProductVO product = productClient.queryProductById(cartDTO.getProductId()).getData();

            if (product == null){
                throw new ProductException("订单中有" + MessageConstant.PRODUCTNOTEXIST);
            }

            // 插入购物车数据，可判断商品是否否已在购物车
            Long cartId = cartService.add(cartDTO);

            cartIds.add(cartId);
        }

        return cartIds;
    }

    /**
     * 订单数据分页查询
     * @param orderPageQueryDTO
     * @return
     */
    @Override
    public PageResult pageQuery(OrderPageQueryDTO orderPageQueryDTO) {
        // 设置分页条件
        IPage<Order> orderIPage = new Page<>(orderPageQueryDTO.getPage(), orderPageQueryDTO.getPageSize());

        LambdaQueryWrapper<Order> orderLambdaQueryWrapper = new LambdaQueryWrapper<>();
        orderLambdaQueryWrapper.orderByDesc(Order::getCreatedAt);
        // 设置状态筛选
        if (orderPageQueryDTO.getStatus() != null) {
            orderLambdaQueryWrapper.eq(Order::getStatus, orderPageQueryDTO.getStatus());
        }

        // 分页查询
        IPage<Order> page = page(orderIPage, orderLambdaQueryWrapper);

        // 设置返回分页结果
        PageResult pageResult = new PageResult();
        pageResult.setTotal(page.getTotal());
        pageResult.setRecords(setOrderItem(page.getRecords()));

        return pageResult;
    }

    /**
     * 修改订单状态
     * @param status
     * @param id
     */
    @Override
    @Transactional
    public void setOrderStatus(Long id, Integer status) {
        LambdaUpdateWrapper<Order> orderLambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        orderLambdaUpdateWrapper.eq(Order::getId, id);

        // 根据要设置的状态设置对应操作的时间
        if (status == Order.SHIPPED) {
            orderLambdaUpdateWrapper.set(Order::getShippedAt, LocalDateTime.now());
        } else if (status == Order.COMPLETED) {
            orderLambdaUpdateWrapper.set(Order::getCompletedAt, LocalDateTime.now());
        } else if (status == Order.CANCELED) {
            orderLambdaUpdateWrapper.set(Order::getCanceledAt, LocalDateTime.now());
        }

        // 设置状态和更新时间
        orderLambdaUpdateWrapper.set(Order::getStatus, status);
        orderLambdaUpdateWrapper.set(Order::getUpdatedAt, LocalDateTime.now());

        // 更新
        update(orderLambdaUpdateWrapper);
    }



    // 为订单VO对象设置订单商品
    private List<OrderVO> setOrderItem(List<Order> orderList) {
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
     * 获得总销售额
     * @param chartDTO
     * @return
     */
    @Override
    public BigDecimal getTotalSales(ChartDTO chartDTO, Boolean isCumulative) {
        // 构造日期条件限制
        LambdaQueryWrapper<Order> orderLambdaQueryWrapper = new LambdaQueryWrapper<>();
        LocalDateTime beginTime = LocalDateTime.of(chartDTO.getStartData(), LocalTime.MIN);
        LocalDateTime endTime = LocalDateTime.of(chartDTO.getEndData(), LocalTime.MAX);

        orderLambdaQueryWrapper
                .eq(Order::getStatus, Order.COMPLETED);
        if (isCumulative) {
            orderLambdaQueryWrapper.le(Order::getCanceledAt, endTime);
        } else {
            orderLambdaQueryWrapper
                    .between(Order::getCreatedAt, beginTime, endTime);
        }

        List<Order> orderList = list(orderLambdaQueryWrapper);

        // 计算总销售额，将所有订单的总金额相加
        return orderList.stream()
                .map(Order::getTotalAmount)  // 提取订单的总金额
                .reduce(BigDecimal.ZERO, BigDecimal::add);  // 累加总金额

    }

    /**
     * 获得总订单数
     * @param chartDTO
     * @return
     */
    @Override
    public Integer getTotalOrders(ChartDTO chartDTO) {
        // 构造日期条件限制
        LambdaQueryWrapper<Order> orderLambdaQueryWrapper = new LambdaQueryWrapper<>();
        LocalDateTime beginTime = LocalDateTime.of(chartDTO.getStartData(), LocalTime.MIN);
        LocalDateTime endTime = LocalDateTime.of(chartDTO.getEndData(), LocalTime.MAX);

        orderLambdaQueryWrapper
                .between(Order::getCreatedAt, beginTime, endTime);

        return (int) count(orderLambdaQueryWrapper);
    }

    /**
     * 获得前10热门商品
     * @param chartDTO
     * @return
     */
    @Override
    public List<Hot10VO> getHot10Product(ChartDTO chartDTO) {
        // 构造日期条件限制
        LocalDateTime beginTime = LocalDateTime.of(chartDTO.getStartData(), LocalTime.MIN);
        LocalDateTime endTime = LocalDateTime.of(chartDTO.getEndData(), LocalTime.MAX);

        LambdaQueryWrapper<Order> orderLambdaQueryWrapper = new LambdaQueryWrapper<Order>()
                .between(Order::getCreatedAt, beginTime, endTime)
                .eq(Order::getStatus, Order.COMPLETED);

        List<Long> orderIdList = list(orderLambdaQueryWrapper).stream().map(Order::getId).toList();
        if (orderIdList.isEmpty()) {
            return null;
        }

        return orderItemsMapper.getHotProduct(orderIdList);
    }

    /**
     * 获得最热门商品
     * @param chartDTO
     * @return
     */
    @Override
    public String getHotProduct(ChartDTO chartDTO) {
        List<Hot10VO> hot10VOList = getHot10Product(chartDTO);
        if (hot10VOList == null) {
            return "";
        }

        return hot10VOList.get(0).getProductName();
    }

    /**
     * 获得各状态订单数
     * @param chartDTO
     * @return
     */
    @Override
    public List<Integer> getStatusList(ChartDTO chartDTO) {

        List<Integer> validStatuses = List.of(Order.PENDING_PAYMENT, Order.CONFIRM, Order.SHIPPED, Order.COMPLETED, Order.CANCELED);

        List<Integer> statusList = new ArrayList<>();

        // 构造日期条件限制
        LocalDateTime beginTime = LocalDateTime.of(chartDTO.getStartData(), LocalTime.MIN);
        LocalDateTime endTime = LocalDateTime.of(chartDTO.getEndData(), LocalTime.MAX);

        for (Integer status : validStatuses) {
            LambdaQueryWrapper<Order> orderLambdaQueryWrapper = new LambdaQueryWrapper<Order>()
                    .between(Order::getCreatedAt, beginTime, endTime)
                    .eq(Order::getStatus, status);

            Integer countStatus = (int)count(orderLambdaQueryWrapper);
            statusList.add(countStatus);
        }

        return statusList;

    }


}
