package com.iwbr.spike.goods.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @description: 商品分类表
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 21:29:24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sp_category")
@Schema(title="Category对象", description="商品分类表")
public class Category extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Schema(title = "分类名称")
    @TableField("cat_name")
    private String catName;

    @Schema(title = "是否启用")
    @TableField("cat_enable")
    private Boolean catEnable;

    @Schema(title = "分类类型（menu菜单/catalog目录）")
    @TableField("cat_type")
    private String catType;

    @Schema(title = "品牌名称首字母")
    @TableField("cat_sort")
    private String catSort;

    @Schema(title = "品牌排序")
    @TableField("cat_parent_id")
    private Integer catParentId;
}
