package com.iwbr.spike.dm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class DmApp {

    public static void main(String[] args) {
        SpringApplication.run(DmApp.class, args);
    }

}