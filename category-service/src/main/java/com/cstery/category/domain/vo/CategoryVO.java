package com.cstery.category.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "分类视图对象")
public class CategoryVO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "分类ID", example = "1")
    private Long id;

    @ApiModelProperty(value = "分类名称", example = "电子产品")
    private String name;

    @ApiModelProperty(value = "分类描述", example = "包括手机、电脑、家电等电子产品")
    private String description;

    @ApiModelProperty(value = "分类图片URL", example = "http://localhost:8080/category_jiu.png")
    private String imageUrl;

    @ApiModelProperty(value = "分类状态", allowableValues = "0, 1", example = "1")
    private Integer status; // 1表示启用，0表示禁用

    @ApiModelProperty(value = "排序字段", example = "1")
    private Integer sortOrder;

    @ApiModelProperty(value = "父分类ID", example = "0")
    private Long parentId; // 0表示无父级分类

    @ApiModelProperty(value = "一级分类下的二级分类")
    private List<CategoryVO> subCategories;
}
