package com.iwbr.spike.common.web;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import com.iwbr.spike.common.enums.ResponseCodeEnum;
import com.iwbr.spike.common.response.ResponseData;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.beans.PropertyEditorSupport;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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

//    @ModelAttribute
//    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response) {
//
//    }

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

//    /**
//     * sendFile
//     *
//     * @param filePath
//     * @param response
//     * @param download 下载
//     * @throws IOException ioexception
//     */
//    protected void sendFile(String filePath, HttpServletResponse response, boolean download) throws IOException {
//        sendFile(new File(filePath), response, download);
//    }
//
//    /**
//     * send file
//     *
//     * @param file
//     * @param response 响应
//     * @param download 下载
//     * @throws IOException ioexception
//     */
//    protected void sendFile(File file, HttpServletResponse response, boolean download) throws IOException {
//        if (file == null || response == null) {
//            return;
//        }
//        if (file.exists()) {
//            final String fileName = file.getName();
//            final String contentType = ObjectUtil.defaultIfNull(FileUtil.getMimeType(fileName), "application/octet-stream");
//            BufferedInputStream in = null;
//            try {
//                in = FileUtil.getInputStream(file);
//                sendStream(response, in, contentType, fileName, download);
//            } finally {
//                IoUtil.close(in);
//            }
//        } else {
//            response.sendError(HttpServletResponse.SC_NOT_FOUND, ResponseCodeEnum.FILE_NOT_FOUND.getValue());
//        }
//
//    }
//
//    /**
//     * send stream
//     *
//     * @param response
//     * @param inputStream
//     * @param contentType 内容类型
//     * @param fileName
//     * @param download    是否直接下载文件  false可以在浏览器预览pdf
//     * @throws IOException ioexception
//     */
//    protected void sendStream(HttpServletResponse response, InputStream inputStream, String contentType, String fileName, boolean download) throws IOException {
//        if (inputStream == null || response == null) {
//            return;
//        }
//        final String charset = ObjectUtil.defaultIfNull(response.getCharacterEncoding(), CharsetUtil.UTF_8);
//        if (download) {
//            response.setHeader("Content-Disposition", StrUtil.format("attachment;filename={}",
//                    URLUtil.encode(fileName, CharsetUtil.charset(charset))));
//        } else {
//            response.setHeader("Content-Disposition", StrUtil.format("inline;filename={}",
//                    URLUtil.encode(fileName, CharsetUtil.charset(charset))));
//        }
//        response.setContentType(contentType);
//        ServletOutputStream out = null;
//        try {
//            out = response.getOutputStream();
//            IoUtil.copy(inputStream, out, IoUtil.DEFAULT_BUFFER_SIZE);
//        } catch (IOException e) {
//            throw e;
//        } finally {
//            IoUtil.close(out);
//            IoUtil.close(inputStream);
//        }
//    }
}
