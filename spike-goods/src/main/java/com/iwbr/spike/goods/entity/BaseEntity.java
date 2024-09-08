package com.iwbr.spike.goods.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @description: 基础实体
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-04 23:35:47
 */
@Data
public abstract class BaseEntity implements Serializable {

    /**
     * id
     */
    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    @Schema(title = "主键")
    private String id;

    /**
     * 创建时间
     */
    @TableField(value = "create_at", fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(title = "创建时间")
    private LocalDateTime createAt;

    /**
     * 更新时间
     */
    @TableField(value = "update_at", fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(title = "更新时间")
    private LocalDateTime updateAt;

    /**
     * 是否启用
     */
    @TableField(value = "enabled", fill = FieldFill.INSERT)
    @Schema(title = "是否启用")
    protected boolean enabled = true;

    /**
     * 操作人
     */
    @TableField(value = "operator", fill = FieldFill.INSERT_UPDATE)
    @Schema(title = "最后一次操作人")
    protected String operator;
}
