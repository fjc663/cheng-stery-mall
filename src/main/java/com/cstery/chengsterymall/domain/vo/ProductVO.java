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
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "商品视图对象")
public class ProductVO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "商品ID", example = "1")
    private Long id;

    @ApiModelProperty(value = "商品名称", example = "智能手机")
    private String name;

    @ApiModelProperty(value = "商品描述", example = "这是一款最新款的智能手机")
    private String description;

    @ApiModelProperty(value = "商品价格", example = "2999.99")
    private BigDecimal price;

    @ApiModelProperty(value = "商品库存量", example = "150")
    private Integer stock;

    @ApiModelProperty(value = "分类ID", example = "10")
    private Long categoryId;

    @ApiModelProperty(value = "商品状态", allowableValues = "0, 1", example = "1")
    private Integer status; // 1表示上架，0表示下架

    @ApiModelProperty(value = "商品销量", example = "120")
    private Integer sales;

    @ApiModelProperty(value = "商品规格", example = "[\"红色,黑色,白色\", \"小号,中号,大号\"]")
    private List<SpecificationVO> specifications;

    @ApiModelProperty(value = "商品图片的URL地址", example = "http://localhost:8080/product/default_product.png")
    private String imageUrl;

}
