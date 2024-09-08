package com.iwbr.spike.goods.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @description: 商品与秒杀活动关联表
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 21:31:03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sp_good_activity_ref")
@Schema(title="GoodActivityRef对象", description="商品与秒杀活动关联表")
public class GoodActivityRef extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(title = "分类名称")
    @TableField("good_id")
    private String goodId;

    @Schema(title = "是否启用")
    @TableField("activity_id")
    private Boolean activityId;

    @Schema(title = "商品秒杀价格")
    @TableField("good_spike_price")
    private Integer goodSpikePrice;

    @Schema(title = "参与秒杀商品数量")
    @TableField("good_spike_num")
    private Integer goodSpikeNum;
}
