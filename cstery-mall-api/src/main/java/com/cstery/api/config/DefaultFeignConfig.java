package com.cstery.api.config;


import com.cstery.context.BaseContext;
import feign.Logger;
import feign.RequestInterceptor;
import org.springframework.context.annotation.Bean;

public class DefaultFeignConfig {
    @Bean
    public Logger.Level feignLoggerLevel(){
        return Logger.Level.FULL;
    }

    @Bean
    public RequestInterceptor userInfoRequestInterceptor(){
        return template -> {
            Long userId = BaseContext.getCurrentId();
            if (userId != null){
                template.header("user-info", userId.toString());
            }
        };
    }
}
