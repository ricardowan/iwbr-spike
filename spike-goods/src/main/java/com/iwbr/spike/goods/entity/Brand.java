package com.iwbr.spike.goods.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @description: 商品品牌表
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 21:27:57
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sp_brand")
@Schema(title="Brand对象", description="商品品牌表")
public class Brand extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(title = "品牌名称")
    @TableField("brand_name")
    private String brandName;

    @Schema(title = "品牌logo")
    @TableField("brand_icon")
    private String brandIcon;

    @Schema(title = "品牌名称首字母")
    @TableField("brand_letter")
    private String brandLetter;

    @Schema(title = "品牌排序")
    @TableField("brand_sort")
    private Integer brandSort;
}
