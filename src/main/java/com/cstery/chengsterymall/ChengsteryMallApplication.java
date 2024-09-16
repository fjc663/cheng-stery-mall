package com.cstery.chengsterymall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan("com.cstery.chengsterymall.mapper")
@EnableTransactionManagement // 开始事务管理
public class ChengsteryMallApplication {

    public static void main(String[] args) {
        SpringApplication.run(ChengsteryMallApplication.class, args);
    }

}
