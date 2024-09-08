package com.iwbr.spike.goods.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @description: 商品秒杀活动
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 21:28:54
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sp_activity")
@Schema(title="Activity对象", description="商品秒杀活动")
public class Activity extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(title = "活动名称")
    @TableField("act_name")
    private String actName;

    @Schema(title = "活动状态")
    @TableField("act_status")
    private Integer actStatus;

    @Schema(title = "活动开始时间")
    @TableField("act_begin_time")
    private LocalDateTime actBeginTime;

    @Schema(title = "活动结束时间")
    @TableField("act_end_time")
    private LocalDateTime actEndTime;

    @Schema(title = "活动总耗时")
    @TableField("act_total_time")
    private Float actTotalTime;
}
