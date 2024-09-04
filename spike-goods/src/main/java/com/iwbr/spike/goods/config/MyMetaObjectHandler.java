package com.iwbr.spike.goods.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @description: 自定义MyBatis自动填充配置
 * @author: JamesWan
 * @date: 2024-09-04 23:46:10
 */
@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName("createAt",new Date(), metaObject);
        this.setFieldValByName("updateAt",new Date(), metaObject);
        this.setFieldValByName("operator",null, metaObject);
        this.setFieldValByName("enabled", true, metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("updateAt",new Date(), metaObject);
        this.setFieldValByName("operator",null, metaObject);
    }
}
