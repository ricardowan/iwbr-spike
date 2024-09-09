package com.iwbr.spike.dm.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @description: 商品表
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 21:29:49
 */
@Data
@Table(name = "sp_good")
@Schema(title="Good对象", description="商品表")
public class Good implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column(name = "id")
    @Schema(title = "主键")
    private String id;

    @Column(name = "create_at")
    @Schema(title = "创建时间")
    private LocalDateTime createAt;

    @Column(name = "update_at")
    @Schema(title = "更新时间")
    private LocalDateTime updateAt;

    @Column(name = "enabled")
    @Schema(title = "是否启用")
    protected Boolean enabled = true;

    @Column(name = "operator")
    @Schema(title = "最后一次操作人")
    protected String operator;

    @Schema(title = "商品名称")
    @Column(name = "good_name")
    private String goodName;

    @Schema(title = "商品价格")
    @Column(name = "good_price")
    private Integer goodPrice;

    @Schema(title = "商品秒杀价格")
    @Column(name = "good_spike_price")
    private Integer goodSpikePrice;

    @Schema(title = "库存数量")
    @Column(name = "good_stock_num")
    private Integer goodStockNum;

    @Schema(title = "库存预警数量")
    @Column(name = "good_alert_num")
    private Integer goodAlertNum;

    @Schema(title = "商品缩略图")
    @Column(name = "good_icon")
    private String goodIcon;

    @Schema(title = "商品图片列表")
    @Column(name = "good_images")
    private String goodImages;

    @Schema(title = "spu_id")
    @Column(name = "good_spu_id")
    private String goodSpuId;

    @Schema(title = "商品分类类目id")
    @Column(name = "good_category_ids")
    private String goodCategoryIds;

    @Schema(title = "商品分类类目名称")
    @Column(name = "good_category_names")
    private String goodCategoryNames;

    @Schema(title = "商品品牌id")
    @Column(name = "good_brand_id")
    private String goodBrandId;

    @Schema(title = "商品品牌名称")
    @Column(name = "good_brand_name")
    private String goodBrandName;

    @Schema(title = "规模")
    @Column(name = "good_scope")
    private String goodScope;

    @Schema(title = "商品销量")
    @Column(name = "good_sale_num")
    private Integer goodSaleNum;

    @Schema(title = "商品评论数量")
    @Column(name = "good_comment_num")
    private Integer goodCommentNum;

    @Schema(title = "秒杀开始时间")
    @Column(name = "good_spike_begin")
    private LocalDateTime goodSpikeBegin;

    @Schema(title = "秒杀结束时间")
    @Column(name = "good_spike_end")
    private LocalDateTime goodSpikeEnd;

    @Schema(title = "商品状态（1普通商品/2秒杀商品）")
    @Column(name = "good_status")
    private Integer goodStatus;

    @Schema(title = "锁定状态（1未锁定/2已锁定）")
    @Column(name = "good_lock")
    private Integer goodLock;

    @Schema(title = "参与秒杀商品数量")
    @Column(name = "good_spike_num")
    private Integer goodSpikeNum;
}
