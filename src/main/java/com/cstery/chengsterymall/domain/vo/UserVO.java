package com.cstery.chengsterymall.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(description = "用户视图对象")
public class UserVO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户ID", example = "1")
    private Long id;

    @ApiModelProperty(value = "用户名", example = "johndoe")
    private String username;

    @ApiModelProperty(value = "邮箱", example = "johndoe@example.com")
    private String email;

    @ApiModelProperty(value = "电话", example = "+1234567890")
    private String phone;

    @ApiModelProperty(value = "头像存储地址", example = "http://example.com/avatar.jpg")
    private String avatarUrl;

    @ApiModelProperty(value = "性别", allowableValues = "0, 1", example = "1")
    private Integer gender; // 0: 女, 1: 男

    @ApiModelProperty(value = "生日", example = "1990-01-01")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date birthdate;

    @ApiModelProperty(value = "地址", example = "北京市朝阳区")
    private String address;

    @ApiModelProperty(value = "创建时间", example = "2024-01-01 12:00:00")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createdAt;

    @ApiModelProperty(value = "更新时间", example = "2024-01-02 15:00:00")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updatedAt;

    @ApiModelProperty(value = "最后登录时间", example = "2024-01-03 18:00:00")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime lastLogin;
}
