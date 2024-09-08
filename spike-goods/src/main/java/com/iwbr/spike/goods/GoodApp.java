package com.iwbr.spike.goods;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @description: 启动类
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 22:24:02
 */
@SpringBootApplication(scanBasePackages = {"com.iwbr.spike.goods.*"})
public class GoodApp {
    public static void main(String[] args) {
        SpringApplication.run(GoodApp.class, args);
    }
}