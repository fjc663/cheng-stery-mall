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
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "商品数据传输对象")
public class ProductDTO {
    @ApiModelProperty(value = "商品名称", required = true, example = "红酒 A")
    @NotBlank(message = "商品名称不能为空")
    @Size(min = 1, max = 50, message = "商品名字符长度为1到50")
    private String name;

    @ApiModelProperty(value = "商品描述", example = "优质红酒")
    private String description;

    @ApiModelProperty(value = "商品价格", required = true, example = "120.00")
    @NotNull(message = "商品价格不能为空")
    @Min(value = 0, message = "商品价格不能小于0")
    private BigDecimal price;

    @ApiModelProperty(value = "商品库存", required = true, example = "100")
    @NotNull(message = "商品库存不能为空")
    @Min(value = 0, message = "库存不能小于0")
    private Integer stock;

    @ApiModelProperty(value = "分类ID", required = true, example = "1")
    @NotNull(message = "分类ID不能为空")
    private Long categoryId;

    @ApiModelProperty(value = "商品状态，1=上架，0=下架", example = "1")
    private Integer status;

    @ApiModelProperty(value = "商品图片地址", example = "http://localhost:8080/product_hongjiu.png")
    private String imageUrl;
}
