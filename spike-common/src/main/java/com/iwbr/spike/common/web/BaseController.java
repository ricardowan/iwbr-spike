package com.iwbr.spike.common.web;

import cn.hutool.core.date.DateUtil;
import com.iwbr.spike.common.enums.ResponseCodeEnum;
import com.iwbr.spike.common.response.ResponseData;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.beans.PropertyEditorSupport;
import java.util.Date;

/**
 * @description: 基础Controller
 * @author: <a href="mailto:wangbaorui@gtmap.cn">wangbaorui</a>
 * @date: 2024/05/17
 */
@Slf4j
@Controller
public abstract class BaseController {

    protected static final String LAST_MODIFIED = "Last-Modified";

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                text = StringUtils.trim(text);
                try {
                    if (StringUtils.isBlank(text)) {
                        setValue(null);
                    } else {
                        setValue(DateUtil.parse(text));
                    }
                } catch (Exception e) {
                    log.error(e.getMessage(), e);
                    setValue(null);
                }
            }

        });
    }

    /**
     * 操作成功响应
     *
     * @return cn.gtmap.gtc.portal.core.model.ResponseResult<java.lang.Object>
     */
    protected ResponseData<Object> success() {
        return new ResponseData<>().success(ResponseData.DEFAULT_SUCCESS_CODE, ResponseCodeEnum.OPN_SUCCESS.getValue(), null);
    }

    /**
     * 操作成功响应
     *
     * @param msg 响应消息
     * @return cn.gtmap.gtc.portal.core.model.ResponseResult<java.lang.Object>
     */
    protected ResponseData<Object> success(String... msg) {
        String message = msg.length > 0 ? msg[0] : ResponseCodeEnum.OPN_SUCCESS.getValue();
        return new ResponseData<>().success(ResponseData.DEFAULT_SUCCESS_CODE, message, null);
    }

    /**
     * 操作成功响应
     *
     * @param data 响应数据
     * @return cn.gtmap.gtc.portal.core.model.ResponseResult<java.lang.Object>
     */
    protected <T> ResponseData<T> successWithData(T data) {
        return new ResponseData<T>().success(data);
    }

    /**
     * 操作成功响应
     *
     * @param data 响应数据
     * @param msg  响应消息
     * @return cn.gtmap.gtc.portal.core.model.ResponseResult<java.lang.Object>
     */
    protected <T> ResponseData<T> successWithData(T data, String... msg) {
        String message = msg.length > 0 ? msg[0] : ResponseCodeEnum.OPN_SUCCESS.getValue();
        return new ResponseData<T>().success(ResponseData.DEFAULT_SUCCESS_CODE, message, data);
    }

    /**
     * 操作失败响应
     *
     * @return cn.gtmap.gtc.portal.core.model.ResponseResult<java.lang.Object>
     */
    protected ResponseData<Object> fail() {
        return new ResponseData<>().error(ResponseCodeEnum.OPN_FAIL.getValue());
    }

    /**
     * 操作失败响应
     *
     * @param msg 响应消息
     * @return cn.gtmap.gtc.portal.core.model.ResponseResult<java.lang.Object>
     */
    protected ResponseData<Object> fail(String... msg) {
        String message = msg.length > 0 ? msg[0] : ResponseCodeEnum.OPN_FAIL.getValue();
        return new ResponseData<>().error(message);
    }

    /**
     * 操作失败响应
     *
     * @param data 响应数据
     * @param msg  响应消息
     * @return cn.gtmap.gtc.portal.core.model.ResponseResult<java.lang.Object>
     */
    protected <T> ResponseData<T> fail(T data, String... msg) {
        String message = msg.length > 0 ? msg[0] : ResponseCodeEnum.OPN_FAIL.getValue();
        return new ResponseData<T>().error(ResponseData.DEFAULT_ERROR_CODE, message, data);
    }
}
