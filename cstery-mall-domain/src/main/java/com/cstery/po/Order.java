package com.cstery.po;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@TableName("orders")
public class Order implements Serializable {
    // 订单状态
    public static final int PENDING_PAYMENT = 1;  // 待支付
    public static final int CONFIRM = 2;          // 已支付
    public static final int SHIPPED = 3;          // 已发货
    public static final int COMPLETED = 4;        // 已完成
    public static final int CANCELED = 5;         // 已取消

    // 支付状态
    public static final int UNPAID = 0; // 未支付
    public static final int PAID = 1;   // 已支付

    // 支付方式
    public static final int ALIPAY = 1;   // 支付宝
    public static final int WECHAT = 2;   // 微信
    public static final int CREDIT_CARD = 3; // 信用卡

    @Serial
    private static final long serialVersionUID = 1L;

    // 订单ID
    @TableId(type = IdType.AUTO)
    private Long id;

    // 用户ID
    private Long userId;

    // 订单编号
    @TableField("order_number")
    private String orderNumber;

    // 订单总金额
    private BigDecimal totalAmount;

    // 订单状态 1-待支付, 2-已支付, 3-已发货, 4-已完成, 5-已取消
    private Integer status;

    // 支付状态 0-未支付, 1-已支付
    private Integer paymentStatus;

    // 支付方式 1-支付宝, 2-微信, 3-信用卡
    private Integer paymentMethod;

    // 收货地址
    private String shippingAddress;

    // 运费
    private BigDecimal shippingCost;

    // 商品总数
    private Integer itemCount;

    // 优惠金额
    private BigDecimal discountAmount;

    // 订单创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createdAt;

    // 订单更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updatedAt;

    // 支付时间
    private LocalDateTime paidAt;

    // 发货时间
    private LocalDateTime shippedAt;

    // 订单完成时间
    private LocalDateTime completedAt;

    // 订单取消时间
    private LocalDateTime canceledAt;

    // 订单备注
    private String remark;
}
