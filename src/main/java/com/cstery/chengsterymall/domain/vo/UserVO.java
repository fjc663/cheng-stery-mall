package com.cstery.chengsterymall.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserVO implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    // 用户id
    private Long id;
    // 用户名
    private String username;
    // 邮箱
    private String email;
    // 电话
    private String phone;
    // 头像存储地址
    private String avatarUrl;
    // 性别
    private Integer gender;
    // 生日
    private Date birthdate;
    // 地址
    private String address;
    // 创建时时间
    private LocalDateTime createdAt;
    // 更新时间
    private LocalDateTime updatedAt;
    // 最后登录时间
    private LocalDateTime lastLogin;
}
