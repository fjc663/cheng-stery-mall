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
@ApiModel(description = "用户查询传输对象")
public class UserPageQueryDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "页码", required = true, example = "1")
    private Integer page;

    @ApiModelProperty(value = "每页分类数", required = true, example = "10")
    private Integer pageSize;

    @ApiModelProperty(value = "用户名", example = "zhangsan")
    private String username;

    @ApiModelProperty(value = "用户角色", example = "USER")
    private String role;

}
