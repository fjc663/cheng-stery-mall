package com.cstery.order;

import com.cstery.api.config.DefaultFeignConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableFeignClients(basePackages = "com.cstery.api.client", defaultConfiguration = DefaultFeignConfig.class)
@MapperScan("com.cstery.order.mapper")
@EnableScheduling // 定时任务处理
@EnableTransactionManagement // 开始事务管理
@EnableCaching // 开启缓存
public class OrderApplication {

    public static void main(String[] args) {
        SpringApplication.run(OrderApplication.class, args);
    }

}
