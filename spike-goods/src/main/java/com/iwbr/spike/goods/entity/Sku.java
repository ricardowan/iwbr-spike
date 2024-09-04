package com.iwbr.spike.goods.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 *  商品表
 *
 * @author <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @since 2024-09-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("tb_sku")
@Schema(title="Sku对象", description="商品表")
public class Sku extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(title = "SKU名称")
    @TableField("name")
    private String name;

    @Schema(title = "价格（分）")
    @TableField("price")
    private Integer price;

    @Schema(title = "单位，分")
    @TableField("seckill_price")
    private Integer seckillPrice;

    @Schema(title = "库存数量")
    @TableField("num")
    private Integer num;

    @Schema(title = "库存预警数量")
    @TableField("alert_num")
    private Integer alertNum;

    @Schema(title = "商品图片")
    @TableField("image")
    private String image;

    @Schema(title = "商品图片列表")
    @TableField("images")
    private String images;

    @Schema(title = "创建时间")
    @TableField("create_time")
    private LocalDateTime createTime;

    @Schema(title = "更新时间")
    @TableField("update_time")
    private LocalDateTime updateTime;

    @Schema(title = "SPUID")
    @TableField("spu_id")
    private String spuId;

    @Schema(title = "类目ID")
    @TableField("category1_id")
    private Integer category1Id;

    @TableField("category2_id")
    private Integer category2Id;

    @TableField("category3_id")
    private Integer category3Id;

    @TableField("category1_name")
    private String category1Name;

    @TableField("category2_name")
    private String category2Name;

    @Schema(title = "类目名称")
    @TableField("category3_name")
    private String category3Name;

    @TableField("brand_id")
    private Integer brandId;

    @Schema(title = "品牌名称")
    @TableField("brand_name")
    private String brandName;

    @Schema(title = "规格")
    @TableField("spec")
    private String spec;

    @Schema(title = "销量")
    @TableField("sale_num")
    private Integer saleNum;

    @Schema(title = "评论数")
    @TableField("comment_num")
    private Integer commentNum;

    @Schema(title = "秒杀结束时间")
    @TableField("seckill_end")
    private LocalDateTime seckillEnd;

    @Schema(title = "秒杀开始时间")
    @TableField("seckill_begin")
    private LocalDateTime seckillBegin;

    @Schema(title = "商品状态 1普通商品，2参与秒杀")
    @TableField("status")
    private Integer status;

    @Schema(title = "是否锁定，1：未锁定，2：锁定")
    @TableField("islock")
    private Integer islock;

    @Schema(title = "秒杀数量")
    @TableField("seckill_num")
    private Integer seckillNum;


}
