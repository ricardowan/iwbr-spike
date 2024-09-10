package com.iwbr.spike.search.service;

import com.iwbr.spike.common.entity.dto.goods.GoodDto;
import com.iwbr.spike.common.entity.vo.goods.GoodsQueryVo;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @description: 货物服务
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-10 21:51:45
 */
public interface GoodsService {

    // sava
    boolean saveBatch(List<GoodDto> goodDtoList);

    // delete
    boolean deleteById(String id);

    // update
    boolean update(GoodDto goodDto);

    // query
    Page<GoodDto> queryPage(GoodsQueryVo queryVo);
}
