package com.cstery.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "订单传输对象")
public class OrderDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 订单总金额
    @ApiModelProperty(value = "订单总金额", example = "250.00")
    private BigDecimal totalAmount;

    // 支付方式
    @ApiModelProperty(value = "支付方式", example = "1", notes = "1-支付宝, 2-微信, 3-信用卡")
    private Integer paymentMethod;

    // 收货地址
    @ApiModelProperty(value = "收货地址ID", example = "2")
    private Long addressId;

    // 运费
    @ApiModelProperty(value = "运费", example = "10.00")
    private BigDecimal shippingCost;

    // 优惠金额
    @ApiModelProperty(value = "优惠金额", example = "20.00")
    private BigDecimal discountAmount;

    // 订单备注
    @ApiModelProperty(value = "订单备注", example = "尽量下午送达")
    private String remark;

    // 购物车中选中的商品
    @ApiModelProperty(value = "购物车中选中的商品", example = "[1,2,3,4]")
    private List<Long> selectedCardId;
}
