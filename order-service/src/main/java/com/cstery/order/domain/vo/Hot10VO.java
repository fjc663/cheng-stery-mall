package com.cstery.order.domain.vo;

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
@ApiModel(description = "图表销售数据")
public class Hot10VO implements Serializable {

    @ApiModelProperty(value = "商品名称列表", example = "手机")
    private String productName;

    @ApiModelProperty(value = "商品销量", example = "100")
    private Integer productSales;

}
