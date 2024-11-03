package com.cstery.config;

import com.cstery.properties.AliOssProperties;
import com.cstery.utils.AliOssUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OssConfiguration {

    @Autowired
    private AliOssProperties aliOssProperties;

    @Bean
    public AliOssUtil aliOssUtil(){
        return new AliOssUtil(
                aliOssProperties.getEndpoint(),
                aliOssProperties.getAccessKeyId(),
                aliOssProperties.getAccessKeySecret(),
                aliOssProperties.getBucketName());
    }

}
