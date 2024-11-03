package com.cstery.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "特色商品视图对象")
public class FeaturedProductVO implements Serializable {

    @ApiModelProperty(value = "特色商品ID", example = "1")
    private Long id;

    @ApiModelProperty(value = "商品ID", example = "1001")
    private Long productId;

    @ApiModelProperty(value = "显示位置类型：1-轮播图，2-热门商品，3-新品", example = "1")
    private Integer type;

    @ApiModelProperty(value = "对应的商品信息")
    private ProductVO product;
}
