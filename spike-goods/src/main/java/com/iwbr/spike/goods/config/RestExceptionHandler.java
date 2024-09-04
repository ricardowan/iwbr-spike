package com.iwbr.spike.goods.config;

import com.iwbr.spike.common.response.ErrorResponseData;
import com.iwbr.spike.common.response.ResponseData;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLSyntaxErrorException;

/**
 * @author JamesWan
 *
 * @description controller层全局异常处理
 * @date 2021年08月18日 11:11
 */
@Slf4j
@RestControllerAdvice(basePackages = "com.iwbr.spike.goods.web")
public class RestExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.OK)
    public ResponseData exception(Exception e) {
        log.error("全局异常信息：{}", e.getMessage(), e);
        return new ErrorResponseData(e.getMessage());
    }

    @ExceptionHandler({SQLSyntaxErrorException.class, PersistenceException.class, BadSqlGrammarException.class})
    @ResponseStatus(HttpStatus.OK)
    public ResponseData sqlException(Exception e) {
        log.error("全局异常信息：{}", e.getMessage(), e);
        String errorMessage = "执行失败，原因：SQL语法错误！";
        return new ErrorResponseData(errorMessage);
    }

    @ExceptionHandler(NullPointerException.class)
    @ResponseStatus(HttpStatus.OK)
    public ResponseData nullPointException(Exception e) {
        log.error("全局异常信息：{}", e.getMessage(), e);
        String errorMessage = "空指针异常！";
        return new ErrorResponseData(errorMessage);
    }

}
