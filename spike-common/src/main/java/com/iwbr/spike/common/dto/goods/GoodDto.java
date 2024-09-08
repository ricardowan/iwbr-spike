package com.iwbr.spike.common.dto.goods;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @description: 商品表
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 21:29:49
 */
@Data
@Schema(title="Good对象", description="商品表")
public class GoodDto implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "主键")
    private String id;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(title = "创建时间")
    private LocalDateTime createAt;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @Schema(title = "更新时间")
    private LocalDateTime updateAt;

    @Schema(title = "商品名称")
    private String goodName;

    @Schema(title = "商品价格")
    private Integer goodPrice;

    @Schema(title = "商品秒杀价格")
    private Integer goodSpikePrice;

    @Schema(title = "库存数量")
    private Integer goodStockNum;

    @Schema(title = "库存预警数量")
    private Integer goodAlertNum;

    @Schema(title = "商品缩略图")
    private String goodIcon;

    @Schema(title = "商品图片列表")
    private String goodImages;

    @Schema(title = "spu_id")
    private String goodSpuId;

    @Schema(title = "商品分类类目id")
    private String goodCategoryIds;

    @Schema(title = "商品分类类目名称")
    private String goodCategoryNames;

    @Schema(title = "商品品牌id")
    private String goodBrandId;

    @Schema(title = "商品品牌名称")
    private String goodBrandName;

    @Schema(title = "规模")
    private String goodScope;

    @Schema(title = "商品销量")
    private Integer goodSaleNum;

    @Schema(title = "商品评论数量")
    private Integer goodCommentNum;

    @Schema(title = "秒杀开始时间")
    private LocalDateTime goodSpikeBegin;

    @Schema(title = "秒杀结束时间")
    private LocalDateTime goodSpikeEnd;

    @Schema(title = "商品状态（1普通商品/2秒杀商品）")
    private Integer goodStatus;

    @Schema(title = "锁定状态（1未锁定/2已锁定）")
    private Integer goodLock;

    @Schema(title = "参与秒杀商品数量")
    private Integer goodSpikeNum;
}
