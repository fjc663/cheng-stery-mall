package com.cstery.chengsterymall.domain.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginVO implements Serializable {

    // 用户id
    private Long id;

    // JWT令牌
    private String token;

    // 用户头像URL
    private String avatarUrl;

}
