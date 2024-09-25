package com.cstery.chengsterymall.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "特色商品数据传输对象")
public class FeaturedProductDTO implements Serializable {

    @ApiModelProperty(value = "特色商品ID", example = "1")
    private Long id;

    @ApiModelProperty(value = "商品ID", required = true, example = "1001")
    @NotNull(message = "商品ID不能为空")
    private Long productId;

    @ApiModelProperty(value = "显示位置类型：1-轮播图，2-热门商品，3-新品", required = true, example = "1")
    @NotNull(message = "显示位置不能为空")
    private Integer type;

    @ApiModelProperty(value = "显示顺序", example = "1")
    private Integer displayOrder;
}
