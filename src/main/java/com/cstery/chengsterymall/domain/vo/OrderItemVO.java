package com.cstery.chengsterymall.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "订单商品对象")
class OrderItemVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 订单编号
    @ApiModelProperty(value = "订单编号", example = "3")
    private Long orderId;

    // 商品名称
    @ApiModelProperty(value = "商品名称", example = "红酒")
    private String productName;

    // 商品数量
    @ApiModelProperty(value = "商品数量", example = "2")
    private Integer quantity;

    // 商品单价
    @ApiModelProperty(value = "商品单价", example = "50.00")
    private BigDecimal productPrice;

    // 商品图片URL
    @ApiModelProperty(value = "商品图片URL", example = "http://localhost:8080/hongjiu.png")
    private String productImageUrl;

    // 商品规格
    @ApiModelProperty(value = "商品规格", example = "{\"颜色\":\"红色\",\"尺寸\":\"S\"}")
    private String specifications;
}