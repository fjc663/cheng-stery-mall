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
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "购物车对象")
public class CartVO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    // 购物车记录ID
    @ApiModelProperty(value = "购物车记录ID", example = "1")
    private Long id;

    // 商品ID
    @ApiModelProperty(value = "商品ID", example = "15")
    private Long productId;

    // 商品名称
    @ApiModelProperty(value = "商品名称", example = "红酒")
    private String productName;

    // 商品图片URL
    @ApiModelProperty(value = "商品图片URL", example = "http://localhost:8080/hongjiu.png")
    private String productImageUrl;

    // 商品价格
    @ApiModelProperty(value = "商品价格", example = "120.00")
    private BigDecimal productPrice;

    // 商品数量
    @ApiModelProperty(value = "商品数量", example = "4")
    private Integer quantity;

    // 商品规格
    @ApiModelProperty(value = "商品规格", example = "{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}")
    private String specifications;

}
