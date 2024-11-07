package com.cstery.user.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@Data
@ConfigurationProperties(prefix = "csm.jwt")
public class JwtProperties {

    /**
     * 管理员生成jwt令牌配置
     */
    private String adminSecretKey;
    private Long adminTtl;
    private String adminTokenName;


    /**
     * 用户生成jwt令牌配置
     */
    private String userSecretKey;
    private Long userTtl;
    private String userTokenName;

}
