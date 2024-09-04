package com.iwbr.spike.common.enums;

import lombok.Getter;

/**
 * @description: 响应结果枚举
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-04 23:50:23
 */
@Getter
public enum ResponseCodeEnum {

    /**
     * 成功响应
     */
    OPN_SUCCESS("操作成功"),

    /**
     * 失败响应
     */
    OPN_FAIL("操作失败"),

    SYS_ERROR("系统异常"),

    AUTH_STATE("非法权限请求(业务状态已变化)"),

    SYS_NPE("空指针异常"),
    SYS_CLASS("类访问异常"),
    SYS_IOOB("下标越界异常"),
    SYS_OOM("内存溢出异常"),
    SYS_SOF("堆栈溢出异常"),
    SYS_UN_SUPPORTED("不支持此操作"),
    SYS_NOT_IMPL("功能尚未实现"),
    SYS_IO("IO异常"),
    SYS_NETWORK("网络异常"),

    /* 中间件异常 */
    SYS_DB("数据库访问异常"),
    SYS_DB_POOL_FULL("数据库连接池满"),
    SYS_DB_DOWN("数据库下线"),
    SYS_DB_READONLY("数据库只读"),
    SYS_DB_SQL_QUERY_TIMEOUT("数据库查询超时"),
    SYS_DB_SQL("数据库sql执行异常"),
    SYS_DB_NON_UNIQUE("数据库唯一性异常"),
    SYS_DB_LOCK("数据库锁异常"),

    SYS_TEMPLATE("模板异常"),
    SYS_TEMPLATE_NOT_FOUND("模板未找到"),

    BIZ_ERROR("业务异常"),
    BIZ_ERROR_RETRY("业务异常, 调用方请重试"),
    BIZ_FLOW_CONTROL("业务被流控"),
    BIZ_IDEMPOTENT("业务被幂等"),
    BIZ_LOCKED("业务锁冲突"),
    BIZ_DIRTY_DATA("业务脏数据"),

    /* 实体对象相关异常 */
    ENTITY_EX("实体对象异常"),
    ENTITY_NOT_FOUND("实体对象未找到"),
    ENTITY_EXISTS("实体对象已存在"),

    /* 参数相关异常 */
    ARG_VIOLATION("参数违反约束"),
    ARG_ILLEGAL("非法参数"),
    ARG_ILLEGAL_FORMAT("非法参数格式"),
    ARG_ILLEGAL_STATE("非法参数状态"),

    FILE_NOT_FOUND("文件没找到");

    public static final String SYS_PREFIX    = "SYS_";
    public static final String RETRY_POSTFIX = "_RETRY";

    private String value;

    ResponseCodeEnum(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return this.getValue();
    }

}
