package com.cstery.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "订单视图对象")
public class OrderVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 订单ID
    @ApiModelProperty(value = "订单ID", example = "1")
    private Long id;

    // 订单编号
    @ApiModelProperty(value = "订单编号", example = "202309200001")
    private String orderNumber;

    // 订单总金额
    @ApiModelProperty(value = "订单总金额", example = "250.00")
    private BigDecimal totalAmount;

    // 订单状态
    @ApiModelProperty(value = "订单状态", example = "1", notes = "1-待支付, 2-已支付, 3-已发货, 4-已完成, 5-已取消")
    private Integer status;

    // 支付状态
    @ApiModelProperty(value = "支付状态", example = "1", notes = "0-未支付, 1-已支付")
    private Integer paymentStatus;

    // 支付方式
    @ApiModelProperty(value = "支付方式", example = "1", notes = "1-支付宝, 2-微信, 3-信用卡")
    private Integer paymentMethod;

    // 收货地址
    @ApiModelProperty(value = "收货地址", example = "北京市朝阳区XX路XX号")
    private String shippingAddress;

    // 运费
    @ApiModelProperty(value = "运费", example = "10.00")
    private BigDecimal shippingCost;

    // 商品总数
    @ApiModelProperty(value = "商品总数", example = "3")
    private Integer itemCount;

    // 优惠金额
    @ApiModelProperty(value = "优惠金额", example = "20.00")
    private BigDecimal discountAmount;

    // 订单创建时间
    @ApiModelProperty(value = "订单创建时间", example = "2024-09-20 10:00:00")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createdAt;

    // 支付时间
    @ApiModelProperty(value = "支付时间", example = "2024-09-20 10:30:00")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime paidAt;

    // 发货时间
    @ApiModelProperty(value = "发货时间", example = "2024-09-21 15:00:00")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime shippedAt;

    // 订单完成时间
    @ApiModelProperty(value = "订单完成时间", example = "2024-09-23 18:00:00")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime completedAt;

    // 订单取消时间
    @ApiModelProperty(value = "订单取消时间", example = "2024-09-21 10:00:00")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime canceledAt;

    // 订单备注
    @ApiModelProperty(value = "订单备注", example = "尽量下午送达")
    private String remark;

    // 商品信息
    private List<OrderItemVO> orderItemVOList;
}
