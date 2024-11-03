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
@ApiModel("规格分页查询传输对象")
public class SpecificationPageQueryDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "页码", required = true, example = "1")
    private Integer page;

    @ApiModelProperty(value = "每页分类数", required = true, example = "10")
    private Integer pageSize;

    @ApiModelProperty(value = "规格名称", example = "颜色")
    private String name;

    @ApiModelProperty(value = "规格状态", allowableValues = "0, 1", example = "1")
    private Integer status;

}
