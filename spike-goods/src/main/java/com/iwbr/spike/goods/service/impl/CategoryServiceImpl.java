package com.iwbr.spike.goods.service.impl;

import com.iwbr.spike.goods.entity.Category;
import com.iwbr.spike.goods.mapper.CategoryMapper;
import com.iwbr.spike.goods.service.CategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品分类表 服务实现类
 * </p>
 *
 * @author <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @since 2024-09-08
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

}
