package com.cstery.product.config;


import com.cstery.product.propertis.AliOssProperties;
import com.cstery.common.utils.AliOssUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class OssConfiguration {

    private final AliOssProperties aliOssProperties;

    @Bean
    public AliOssUtil aliOssUtil(){
        return new AliOssUtil(
                aliOssProperties.getEndpoint(),
                aliOssProperties.getAccessKeyId(),
                aliOssProperties.getAccessKeySecret(),
                aliOssProperties.getBucketName());
    }

}
