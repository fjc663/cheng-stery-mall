package com.cstery.chengsterymall.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "分页查询商品数据传输对象")
public class ProductPageQueryDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "分类id", required = true, example = "2")
    private Long categoryId;

    @ApiModelProperty(value = "页码", required = true, example = "1")
    private Integer page;

    @ApiModelProperty(value = "每页商品数", required = true, example = "10")
    private Integer pageSize;

    @ApiModelProperty(value = "商品名称", example = "红酒 A")
    private String name;

    @ApiModelProperty(value = "商品状态，1=上架，0=下架", example = "1")
    private Integer status;

    @ApiModelProperty(value = "是否按照商品价格升序排序", example = "true")
    private Boolean isOrderBypriceASC;

    @ApiModelProperty(value = "是否按照商品价格降序排序", example = "false")
    private Boolean isOrderBypriceDESC;

    @ApiModelProperty(value = "是否返回全部商品数据", example = "false")
    private Boolean isALLData;

}
