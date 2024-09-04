package com.iwbr.spike.common.response;

import lombok.Getter;
import lombok.Setter;

/**
 * @description: 错误响应数据
 * @author: <a href="mailto:wangbaorui@gtmap.cn">wangbaorui</a>
 * @date: 2024/05/17
 */

@Setter
@Getter
public class ErrorResponseData<T> extends ResponseData<T> {

    private String exceptionClazz;

    public ErrorResponseData(String message) {
        super(false, ResponseData.DEFAULT_ERROR_CODE, message, null);
    }

    public ErrorResponseData(Integer code, String message) {
        super(false, code, message, null);
    }

    public ErrorResponseData(Integer code, String message, T data) {
        super(false, code, message, data);
    }

    @Override
    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof ErrorResponseData)) {
            return false;
        } else {
            ErrorResponseData<T> other = (ErrorResponseData<T>) o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                Object thisExceptionClazz = this.getExceptionClazz();
                Object otherExceptionClazz = other.getExceptionClazz();
                if (thisExceptionClazz == null) {
                    if (otherExceptionClazz != null) {
                        return false;
                    }
                } else if (!thisExceptionClazz.equals(otherExceptionClazz)) {
                    return false;
                }

                return true;
            }
        }
    }

    @Override
    protected boolean canEqual(final Object other) {
        return other instanceof ErrorResponseData;
    }

    @Override
    public int hashCode() {
        int result = 1;
        Object exceptionClazz = this.getExceptionClazz();
        result = result * 59 + (exceptionClazz == null ? 43 : exceptionClazz.hashCode());
        return result;
    }

    @Override
    public String toString() {
        return "ErrorResponseData(exceptionClazz=" + this.getExceptionClazz() + ")";
    }
}
