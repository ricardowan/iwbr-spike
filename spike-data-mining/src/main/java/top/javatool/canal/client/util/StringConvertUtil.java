package top.javatool.canal.client.util;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;

import java.math.BigDecimal;
import java.util.Date;
import java.time.LocalDateTime;

/**
 * @description: 字符串转换util
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-10 00:20:56
 */
public class StringConvertUtil {

    private static String[] PARSE_PATTERNS = {
            "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM",
            "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM",
            "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM"};


    /**
     * 转换类型
     *
     * @param type        类型
     * @param columnValue 列值
     * @return {@link Object }
     */
    static Object convertType(Class<?> type, String columnValue) {
        if (StrUtil.isBlank(columnValue)) {
            return null;
        } else if (type.equals(Integer.class)) {
            return Integer.parseInt(columnValue);
        } else if (type.equals(Long.class)) {
            return Long.parseLong(columnValue);
        } else if (type.equals(Boolean.class)) {
            return convertToBoolean(columnValue);
        } else if (type.equals(BigDecimal.class)) {
            return new BigDecimal(columnValue);
        } else if (type.equals(Double.class)) {
            return Double.parseDouble(columnValue);
        } else if (type.equals(Float.class)) {
            return Float.parseFloat(columnValue);
        } else if (type.equals(Date.class)) {
            return DateUtil.parse(columnValue);
        } else if (type.equals(java.sql.Date.class)) {
            return DateUtil.parse(columnValue);
        } else if(type.equals(LocalDateTime.class)) {
            return DateUtil.parseLocalDateTime(columnValue);
        } else{
            return columnValue;
        }
    }

    /**
     * 转换为布尔值
     *
     * @param value 值
     * @return boolean
     */
    private static boolean convertToBoolean(String value) {
        return "1".equalsIgnoreCase(value) || "true".equalsIgnoreCase(value);
    }
}
