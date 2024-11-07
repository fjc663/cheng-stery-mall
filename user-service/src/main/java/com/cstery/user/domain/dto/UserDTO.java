package com.cstery.user.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel("用户信息提交实体")
public class UserDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty("用户ID")
    private Long id;

    @NotBlank(message = "用户名不能为空")
    @Size(min = 2, max = 20, message = "用户名字符长度为2到20")
    @ApiModelProperty(value = "用户名", example = "john_doe")
    private String username;

    @Email(message = "请输入正确的邮箱")
    @ApiModelProperty(value = "用户邮箱", example = "john_doe@example.com")
    private String email;

    @ApiModelProperty(value = "用户手机号", example = "1234567890")
    private String phone;

    @ApiModelProperty(value = "用户状态（1=正常，0=禁用）", example = "1")
    private Integer status;

    @ApiModelProperty(value = "用户角色", example = "USER")
    private String role;

    @ApiModelProperty(value = "用户头像URL", example = "https://example.com/avatar.jpg")
    private String avatarUrl;

    @ApiModelProperty(value = "性别（0=未知，1=男，2=女）", example = "1")
    private Integer gender;

    @ApiModelProperty(value = "生日", example = "2000-01-01")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthdate;

    @ApiModelProperty(value = "默认收货地址", example = "123 Main St, City, Country")
    private String address;
}
