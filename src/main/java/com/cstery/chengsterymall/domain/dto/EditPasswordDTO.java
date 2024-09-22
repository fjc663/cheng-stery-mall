package com.cstery.chengsterymall.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serial;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel("用户密码修改传输实体")
public class EditPasswordDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @NotBlank(message = "旧密码不能为空")
    @Size(min = 6, max = 18, message = "密码字符长度为6到18")
    @ApiModelProperty(value = "旧密码", example = "password123")
    private String oldPassword;

    @NotBlank(message = "新密码不能为空")
    @Size(min = 6, max = 18, message = "密码字符长度为6到18")
    @ApiModelProperty(value = "新密码", example = "password123")
    private String newPassword;
}
