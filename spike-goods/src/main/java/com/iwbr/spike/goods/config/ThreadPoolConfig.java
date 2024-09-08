package com.iwbr.spike.goods.config;

import com.google.common.util.concurrent.ThreadFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.*;

/**
 * @description: 线程管理
 * @author: <a href="mailto:wangbaorui@gtmap.cn">wangbaorui</a>
 * @version: 3.0.0
 * @date: 2022/10/13
 */
@Configuration
public class ThreadPoolConfig {

    /**
     * 当前机器的核数
     */
    public static final int CPU_NUM = Runtime.getRuntime().availableProcessors();

    @Bean({"messageHandlingPool"})
    public ExecutorService messageHandlingPool() {
        ThreadFactory namedThreadFactory = (new ThreadFactoryBuilder()).setNameFormat("message-handling-%d").build();
        return new ThreadPoolExecutor(CPU_NUM, CPU_NUM * 2, 1L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue(5000), namedThreadFactory, new ThreadPoolExecutor.DiscardPolicy());
    }

    @Bean({"saveIdentifyPool"})
    public ExecutorService analysisPool() {
        ThreadFactory namedThreadFactory = (new ThreadFactoryBuilder()).setNameFormat("saveIdentify-%d").build();
        return new ThreadPoolExecutor(1, 2, 1L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue(5000), namedThreadFactory, new ThreadPoolExecutor.DiscardPolicy());
    }

}
