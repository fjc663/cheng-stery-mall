package com.cstery.chengsterymall.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serial;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "分类数据传输对象")
public class CategoryDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "分类ID", example = "1")
    private Long id;

    @ApiModelProperty(value = "分类名称", required = true, example = "饮料")
    @NotBlank(message = "分类名称不能为空")
    @Size(min = 1, max = 20, message = "分类名称字符长度为1到20")
    private String name;

    @ApiModelProperty(value = "分类描述", example = "各类饮品的分类")
    private String description;

    @ApiModelProperty(value = "图片地址", example = "http://localhost:8080/category_jiu.png")
    private String imageUrl;

    @ApiModelProperty(value = "分类状态，1=有效，0=禁用", example = "1")
    private Integer status;

    @ApiModelProperty(value = "排序字段", example = "1")
    private Integer sortOrder;

    @ApiModelProperty(value = "父分类ID", example = "5")
    private Long parentId;
}
