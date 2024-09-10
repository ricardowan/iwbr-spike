package com.iwbr.spike.common.entity.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author admin
 * @version 1.0
 * Create by 2022/7/19 11:17
 */
@Data
public class BaseQueryVo implements Serializable {

    /**
     * 页数
     */
    private int page = 1;

    /**
     * 每页条数
     */
    private int size = 10;

    /**
     * 排序字段
     */
    private String sortField;

    /**
     * 排序方法
     */
    private String sortMethod;
}
