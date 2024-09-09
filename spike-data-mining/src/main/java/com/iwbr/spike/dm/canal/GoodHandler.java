package com.iwbr.spike.dm.canal;

import com.alibaba.fastjson2.JSON;
import com.iwbr.spike.dm.entity.Good;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import top.javatool.canal.client.annotation.CanalTable;
import top.javatool.canal.client.handler.EntryHandler;

/**
 * @description: 资源处理程序
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-01 18:28:00
 */
@Slf4j
@Component
@CanalTable(value = "sp_good")
public class GoodHandler implements EntryHandler<Good> {

    @Override
    public void insert(Good good) {
        log.info(JSON.toJSONString(good));
    }

    @Override
    public void update(Good before, Good after) {
        log.info("before:{}",JSON.toJSONString(before));
        log.info("after:{}",JSON.toJSONString(after));
    }

    @Override
    public void delete(Good good) {
        log.info(JSON.toJSONString(good));
    }
}
