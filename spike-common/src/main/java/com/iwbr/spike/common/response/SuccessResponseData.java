package com.iwbr.spike.common.response;

import com.iwbr.spike.common.enums.ResponseCodeEnum;

/**
 * @description: 成功响应数据
 * @author: <a href="mailto:wangbaorui@gtmap.cn">wangbaorui</a>
 * @date: 2024/05/17
 */
public class SuccessResponseData<T> extends ResponseData<T> {

    public SuccessResponseData() {
        super(true, DEFAULT_SUCCESS_CODE, ResponseCodeEnum.OPN_SUCCESS.getValue(), null);
    }

    public SuccessResponseData(T data) {
        super(true, DEFAULT_SUCCESS_CODE, ResponseCodeEnum.OPN_SUCCESS.getValue(), data);
    }

    public SuccessResponseData(Integer code, String message, T data) {
        super(true, code, message, data);
    }
}
