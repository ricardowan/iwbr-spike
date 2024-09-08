package com.iwbr.spike.goods.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @description: 商品表
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 21:29:49
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sp_good")
@Schema(title="Good对象", description="商品表")
public class Good extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(title = "商品名称")
    @TableField("good_name")
    private String goodName;

    @Schema(title = "商品价格")
    @TableField("good_price")
    private Integer goodPrice;

    @Schema(title = "商品秒杀价格")
    @TableField("good_spike_price")
    private Integer goodSpikePrice;

    @Schema(title = "库存数量")
    @TableField("good_stock_num")
    private Integer goodStockNum;

    @Schema(title = "库存预警数量")
    @TableField("good_alert_num")
    private Integer goodAlertNum;

    @Schema(title = "商品缩略图")
    @TableField("good_icon")
    private String goodIcon;

    @Schema(title = "商品图片列表")
    @TableField("good_images")
    private String goodImages;

    @Schema(title = "spu_id")
    @TableField("good_spu_id")
    private String goodSpuId;

    @Schema(title = "商品分类类目id")
    @TableField("good_category_ids")
    private String goodCategoryIds;

    @Schema(title = "商品分类类目名称")
    @TableField("good_category_names")
    private String goodCategoryNames;

    @Schema(title = "商品品牌id")
    @TableField("good_brand_id")
    private String goodBrandId;

    @Schema(title = "商品品牌名称")
    @TableField("good_brand_name")
    private String goodBrandName;

    @Schema(title = "规模")
    @TableField("good_scope")
    private String goodScope;

    @Schema(title = "商品销量")
    @TableField("good_sale_num")
    private Integer goodSaleNum;

    @Schema(title = "商品评论数量")
    @TableField("good_comment_num")
    private Integer goodCommentNum;

    @Schema(title = "秒杀开始时间")
    @TableField("good_spike_begin")
    private LocalDateTime goodSpikeBegin;

    @Schema(title = "秒杀结束时间")
    @TableField("good_spike_end")
    private LocalDateTime goodSpikeEnd;

    @Schema(title = "商品状态（1普通商品/2秒杀商品）")
    @TableField("good_status")
    private Integer goodStatus;

    @Schema(title = "锁定状态（1未锁定/2已锁定）")
    @TableField("good_lock")
    private Integer goodLock;

    @Schema(title = "参与秒杀商品数量")
    @TableField("good_spike_num")
    private Integer goodSpikeNum;
}
