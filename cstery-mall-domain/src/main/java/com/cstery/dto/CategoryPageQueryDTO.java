package com.cstery.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "分类查询传输对象")
public class CategoryPageQueryDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "页码", required = true, example = "1")
    private Integer page;

    @ApiModelProperty(value = "每页分类数", required = true, example = "10")
    private Integer pageSize;

    @ApiModelProperty(value = "分类名称", example = "饮料")
    private String name;

    @ApiModelProperty(value = "分类状态，1=有效，0=禁用", example = "1")
    private Integer status;

}
