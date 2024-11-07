package com.cstery.user.config;

import cn.hutool.core.collection.CollUtil;
import com.cstery.user.properties.AuthProperies;
import com.cstery.user.interceptors.JwtTokenAdminInterceptor;
import com.cstery.user.interceptors.JwtTokenUserInterceptor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * 配置类，注册web层相关组件
 */
@Configuration
@RequiredArgsConstructor
@Slf4j
public class WebMvcConfiguration implements WebMvcConfigurer {

    private final AuthProperies authProperies;
    private final JwtTokenAdminInterceptor jwtTokenAdminInterceptor;
    private final JwtTokenUserInterceptor jwtTokenUserInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        log.info("注册登录拦截器...");

        InterceptorRegistration adminRegistration = registry.addInterceptor(jwtTokenAdminInterceptor);

        // 配置管理端拦截路径
        List<String> adminIncludePaths = authProperies.getAdminIncludePaths();
        if (CollUtil.isNotEmpty(adminIncludePaths)){
            adminRegistration.addPathPatterns(adminIncludePaths);
        }

        // 配置管理端放行路径
        List<String> adminExcludePaths = authProperies.getAdminExcludePaths();
        if (CollUtil.isNotEmpty(adminExcludePaths)){
            adminRegistration.excludePathPatterns(adminExcludePaths);
        }

        InterceptorRegistration userRegistration = registry.addInterceptor(jwtTokenUserInterceptor);

        // 配置用户端拦截路径
        List<String> userIncludePaths = authProperies.getUserIncludePaths();
        if (CollUtil.isNotEmpty(userIncludePaths)){
            userRegistration.addPathPatterns(userIncludePaths);
        }

        // 配置用户端放行路径
        List<String> userExcludePaths = authProperies.getUserExcludePaths();
        if (CollUtil.isNotEmpty(userExcludePaths)){
            userRegistration.excludePathPatterns(userExcludePaths);
        }

    }


}
