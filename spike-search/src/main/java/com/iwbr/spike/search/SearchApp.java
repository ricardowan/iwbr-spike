package com.iwbr.spike.search;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

/**
 * @description: 搜索应用程序
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-10 23:22:06
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
//扫描Dao接口
@EnableElasticsearchRepositories(basePackages = {"com.iwbr.spike.search.dao"})
public class SearchApp {
    public static void main(String[] args) {
        SpringApplication.run(SearchApp.class, args);
    }
}