package com.cstery.chart.domain.vo;

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
@ApiModel(description = "销售数据总览")
public class ReportVO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "总销售额", example = "1000.0")
    private BigDecimal totalSale;

    @ApiModelProperty(value = "订单总数", example = "150")
    private Integer totalOrder;

    @ApiModelProperty(value = "用户总数", example = "100")
    private Integer totalUser;

    @ApiModelProperty(value = "热门商品", example = "智能手机")
    private String hotProduct;

}
