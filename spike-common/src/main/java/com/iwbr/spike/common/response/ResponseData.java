package com.iwbr.spike.common.response;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 * @description: 响应数据
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-04 23:53:37
 */
@Setter
@Getter
public class ResponseData<T> {
    /**
     * 默认成功消息
     */
    public static final String DEFAULT_SUCCESS_MESSAGE = "请求成功";
    /**
     * 默认错误消息
     */
    public static final String DEFAULT_ERROR_MESSAGE = "网络异常";
    /**
     * 默认参数空白信息
     */
    public static final String DEFAULT_PARAM_BLANK_MESSAGE = "传入参数为空，请检查";
    /**
     * 默认代码成功
     */
    public static final Integer DEFAULT_SUCCESS_CODE = 200;
    /**
     * 默认错误代码
     */
    public static final Integer DEFAULT_ERROR_CODE = 500;
    /**
     * 成功
     * -- GETTER --
     *  获得成功
     *
     *
     * -- SETTER --
     *  设置成功
     *
     @return {@link Boolean}
      * @param success 成功

     */
    private Boolean success;
    /**
     * 代码
     * -- GETTER --
     *  获取代码
     *
     *
     * -- SETTER --
     *  设置代码
     *
     @return {@link Integer}
      * @param code 代码

     */
    private Integer code;
    /**
     * 消息
     * -- GETTER --
     *  得到消息
     *
     *
     * -- SETTER --
     *  设置消息
     *
     @return {@link String}
      * @param message 消息

     */
    private String message;
    /**
     * 数据
     * -- GETTER --
     *  获取数据
     *
     *
     * -- SETTER --
     *  集数据
     *
     @return {@link T}
      * @param data 数据

     */
    private T data;

    /**
     * 响应数据
     */
    public ResponseData() {
    }

    /**
     * 响应数据
     *
     * @param success 成功
     * @param code    代码
     * @param message 消息
     * @param data    数据
     */
    public ResponseData(Boolean success, Integer code, String message, T data) {
        this.success = success;
        this.code = code;
        this.message = message;
        this.data = data;
    }

    /**
     * 成功
     *
     * @return {@link SuccessResponseData}<{@link T}>
     */
    public SuccessResponseData<T> success() {
        return new SuccessResponseData<T>();
    }

    /**
     * 成功
     *
     * @param data 数据
     * @return {@link SuccessResponseData}<{@link T}>
     */
    public SuccessResponseData<T> success(T data) {
        return new SuccessResponseData<T>(data);
    }

    /**
     * 成功
     *
     * @param code    代码
     * @param message 消息
     * @param data    数据
     * @return {@link SuccessResponseData}<{@link T}>
     */
    public SuccessResponseData<T> success(Integer code, String message, T data) {
        return new SuccessResponseData<T>(code, message, data);
    }

    /**
     * 错误
     *
     * @param message 消息
     * @return {@link ErrorResponseData}<{@link T}>
     */
    public ErrorResponseData<T> error(String message) {
        return new ErrorResponseData<T>(message);
    }

    /**
     * 空错误
     *
     * @return {@link ErrorResponseData}<{@link T}>
     */
    public ErrorResponseData<T> emptyError() {
        return new ErrorResponseData<T>(DEFAULT_PARAM_BLANK_MESSAGE);
    }

    /**
     * 错误
     *
     * @param code    代码
     * @param message 消息
     * @return {@link ErrorResponseData}<{@link T}>
     */
    public ErrorResponseData<T> error(Integer code, String message) {
        return new ErrorResponseData<T>(code, message);
    }

    /**
     * 错误
     *
     * @param code    代码
     * @param message 消息
     * @param object  对象
     * @return {@link ErrorResponseData}<{@link T}>
     */
    public ErrorResponseData<T> error(Integer code, String message, T object) {
        return new ErrorResponseData<T>(code, message, object);
    }

    /**
     * 获取数据
     *
     * @param responseData 响应数据
     * @return {@link T}
     */
    public T getData(ResponseData<T> responseData) {
        if (responseData.getSuccess()) {
            return responseData.getData();
        } else {
            throw new RuntimeException("接口调用失败，无法获取数据！");
        }
    }

    /**
     * =
     *
     * @param o o
     * @return boolean
     */
    @Override
    public boolean equals(final Object o) {
        if (o == this) {
            return true;
        } else if (!(o instanceof ResponseData)) {
            return false;
        } else {
            ResponseData<T> other = (ResponseData<T>) o;
            if (!other.canEqual(this)) {
                return false;
            } else {
                label59:
                {
                    Object this$success = this.getSuccess();
                    Object other$success = other.getSuccess();
                    if (this$success == null) {
                        if (other$success == null) {
                            break label59;
                        }
                    } else if (this$success.equals(other$success)) {
                        break label59;
                    }

                    return false;
                }

                Object this$code = this.getCode();
                Object other$code = other.getCode();
                if (this$code == null) {
                    if (other$code != null) {
                        return false;
                    }
                } else if (!this$code.equals(other$code)) {
                    return false;
                }

                Object this$message = this.getMessage();
                Object other$message = other.getMessage();
                if (this$message == null) {
                    if (other$message != null) {
                        return false;
                    }
                } else if (!this$message.equals(other$message)) {
                    return false;
                }

                Object this$data = this.getData();
                Object other$data = other.getData();
                if (this$data == null) {
                    if (other$data != null) {
                        return false;
                    }
                } else if (!this$data.equals(other$data)) {
                    return false;
                }

                return true;
            }
        }
    }

    /**
     * 可以平等
     *
     * @param other 其他
     * @return boolean
     */
    protected boolean canEqual(final Object other) {
        return other instanceof ResponseData;
    }

    /**
     * 散列码
     *
     * @return int
     */
    @Override
    public int hashCode() {
        int result = 1;
        Object $success = this.getSuccess();
        result = result * 59 + ($success == null ? 43 : $success.hashCode());
        Object $code = this.getCode();
        result = result * 59 + ($code == null ? 43 : $code.hashCode());
        Object $message = this.getMessage();
        result = result * 59 + ($message == null ? 43 : $message.hashCode());
        Object $data = this.getData();
        result = result * 59 + ($data == null ? 43 : $data.hashCode());
        return result;
    }

    /**
     * 字符串
     *
     * @return {@link String}
     */
    @Override
    public String toString() {
        return "ResponseData(success=" + this.getSuccess() + ", code=" + this.getCode() + ", message=" + this.getMessage() + ", data=" + this.getData() + ")";
    }
}
