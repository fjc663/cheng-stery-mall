package com.cstery.user.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@Component
@ConfigurationProperties(prefix = "csm.auth")
public class AuthProperies {
    // 管理端需要拦截的路径
    private List<String> adminIncludePaths;
    // 管理端直接放行的路径
    private List<String> adminExcludePaths;

    // 用户端需要拦截的路径
    private List<String> userIncludePaths;
    // 用户端直接放行的路径
    private List<String> userExcludePaths;
}
