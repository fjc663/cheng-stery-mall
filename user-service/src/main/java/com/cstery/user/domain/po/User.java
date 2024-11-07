package com.cstery.user.domain.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
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
@ApiModel("用户信息实体")
@TableName("user")
public class User implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    // 主键，使用自增策略，数据库字段名为 "id"
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    // 用户名，数据库字段名为 "username"
    @TableField(value = "username")
    private String username;

    // 用户邮箱，数据库字段名为 "email"
    @TableField(value = "email")
    private String email;

    // 手机号，数据库字段名为 "phone"
    @TableField(value = "phone")
    private String phone;

    // 密码，数据库字段名为 "password"
    @TableField(value = "password")
    private String password;

    // 盐值，用于密码加密，数据库字段名为 "salt"
    @TableField(value = "salt")
    private String salt;

    // 用户状态，数据库字段名为 "status"
    @TableField(value = "status")
    private Integer status;

    // 用户角色，数据库字段名为 "role"
    @TableField(value = "role")
    private String role;

    // 注册时间，数据库字段名为 "created_at"
    @TableField(value = "created_at")
    private LocalDateTime createdAt;

    // 最后更新时间，数据库字段名为 "updated_at"
    @TableField(value = "updated_at")
    private LocalDateTime updatedAt;

    // 最后登录时间，数据库字段名为 "last_login"
    @TableField(value = "last_login")
    private LocalDateTime lastLogin;

    // 用户头像URL，数据库字段名为 "avatar_url"
    @TableField(value = "avatar_url")
    private String avatarUrl;

    // 性别，数据库字段名为 "gender"（0=未知，1=男，2=女）
    @TableField(value = "gender")
    private Integer gender;

    // 生日，数据库字段名为 "birthdate"
    @TableField(value = "birthdate")
    private Date birthdate;

    // 地址
    @TableField(value = "address")
    private String address;
}
