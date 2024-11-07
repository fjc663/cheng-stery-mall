package com.cstery.chart;

import com.cstery.api.config.DefaultFeignConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients(basePackages = "com.cstery.api.client", defaultConfiguration = DefaultFeignConfig.class)
@EnableCaching // 开启缓存
public class ChartApplication {

    public static void main(String[] args) {
        SpringApplication.run(ChartApplication.class, args);
    }

}
