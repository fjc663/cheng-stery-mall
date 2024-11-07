package com.cstery.order.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serial;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "购物车数据传输对象")
public class CartDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    
    // 商品ID，关联商品表
    @ApiModelProperty(value = "商品ID", required = true, example = "1")
    @NotNull(message = "商品ID不能为空")
    private Long productId;
    
    // 商品数量
    @ApiModelProperty(value = "商品数量", required = true, example = "10")
    @NotNull(message = "商品数量不能为空")
    @Min(value = 1, message = "商品数量最小为1")
    private Integer quantity;

    // 商品规格
    @ApiModelProperty(value = "商品规格", example = "{\"颜色\":\"红色\",\"尺寸\":\"S\",\"材质\":\"棉\"}")
    private String specifications;
}
