package com.iwbr.spike.search.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.time.LocalDateTime;

/**
 * @description: 良好指数
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-10 21:28:43
 */
@Data
@Document(indexName = "goods")
public class GoodIndex {

    @Id
    private String id;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss.SSS")
    @Field(type= FieldType.Date, format= DateFormat.custom, pattern="yyyy-MM-dd HH:mm:ss.SSS")
    private LocalDateTime createAt;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss.SSS")
    @Field(type= FieldType.Date, format= DateFormat.custom, pattern="yyyy-MM-dd HH:mm:ss.SSS")
    private LocalDateTime updateAt;

    @Field(type= FieldType.Boolean)
    private boolean enabled;

    @Field(type= FieldType.Text)
    protected String operator;

    @Field(type = FieldType.Text, searchAnalyzer = "ik_smart", analyzer = "ik_smart", store = false)
    private String goodName;

    @Schema(title = "商品价格")
    @Field(type= FieldType.Integer)
    private Integer goodPrice;

    @Schema(title = "商品秒杀价格")
    @Field(type= FieldType.Integer)
    private Integer goodSpikePrice;

    @Schema(title = "库存数量")
    @Field(type= FieldType.Integer)
    private Integer goodStockNum;

    @Schema(title = "库存预警数量")
    @Field(type= FieldType.Integer)
    private Integer goodAlertNum;

    @Schema(title = "商品缩略图")
    @Field(type= FieldType.Text)
    private String goodIcon;

    @Schema(title = "商品图片列表")
    @Field(type= FieldType.Text)
    private String goodImages;

    @Schema(title = "spu_id")
    @Field(type= FieldType.Text)
    private String goodSpuId;

    @Schema(title = "商品分类类目id")
    @Field(type= FieldType.Keyword)
    private String goodCategoryIds;

    @Schema(title = "商品分类类目名称")
    @Field(type= FieldType.Keyword)
    private String goodCategoryNames;

    @Schema(title = "商品品牌id")
    @Field(type= FieldType.Keyword)
    private String goodBrandId;

    @Schema(title = "商品品牌名称")
    @Field(type= FieldType.Keyword)
    private String goodBrandName;

    @Schema(title = "规模")
    @Field(type= FieldType.Text)
    private String goodScope;

    @Schema(title = "商品销量")
    @Field(type= FieldType.Integer)
    private Integer goodSaleNum;

    @Schema(title = "商品评论数量")
    @Field(type= FieldType.Integer)
    private Integer goodCommentNum;

    @Schema(title = "秒杀开始时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss.SSS")
    @Field(type= FieldType.Date, format= DateFormat.custom, pattern="yyyy-MM-dd HH:mm:ss.SSS")
    private LocalDateTime goodSpikeBegin;

    @Schema(title = "秒杀结束时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss.SSS")
    @Field(type= FieldType.Date, format= DateFormat.custom, pattern="yyyy-MM-dd HH:mm:ss.SSS")
    private LocalDateTime goodSpikeEnd;

    @Schema(title = "商品状态（1普通商品/2秒杀商品）")
    @Field(type= FieldType.Integer)
    private Integer goodStatus;

    @Schema(title = "锁定状态（1未锁定/2已锁定）")
    @Field(type= FieldType.Integer)
    private Integer goodLock;

    @Schema(title = "参与秒杀商品数量")
    @Field(type= FieldType.Integer)
    private Integer goodSpikeNum;

}
