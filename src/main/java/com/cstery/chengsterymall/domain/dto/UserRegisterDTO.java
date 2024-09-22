package com.cstery.chengsterymall.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.*;
import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel("用户信息提交实体")
public class UserRegisterDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @NotBlank(message = "用户名不能为空")
    @Size(min = 2, max = 20, message = "用户名字符长度为2到20")
    @ApiModelProperty(value = "用户名", example = "john_doe")
    private String username;

    @Email(message = "请输入正确的邮箱")
    @ApiModelProperty(value = "用户邮箱", example = "john_doe@example.com")
    private String email;

    @NotBlank(message = "密码不能为空")
    @Size(min = 6, max = 18, message = "密码字符长度为6到18")
    @ApiModelProperty(value = "用户密码", example = "password123")
    private String password;
}
