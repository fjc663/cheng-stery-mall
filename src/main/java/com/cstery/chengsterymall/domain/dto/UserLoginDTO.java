package com.cstery.chengsterymall.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel("用户登录信息提交实体")
public class UserLoginDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @NotBlank(message = "用户名不能为空")
    @Size(min = 2, max = 20, message = "用户名字符长度为2到20")
    @ApiModelProperty(value = "用户名", example = "john_doe")
    private String username;

    @NotBlank(message = "密码不能为空")
    @Size(min = 6, max = 18, message = "密码字符长度为6到18")
    @ApiModelProperty(value = "用户密码", example = "password123")
    private String password;

}
