package com.iwbr.spike.search.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.iwbr.spike.common.entity.dto.goods.GoodDto;
import com.iwbr.spike.common.entity.vo.goods.GoodsQueryVo;
import com.iwbr.spike.search.dao.GoodRepository;
import com.iwbr.spike.search.entity.GoodIndex;
import com.iwbr.spike.search.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description: 货物服务实施
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-10 22:02:50
 */
@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodRepository goodRepository;

    @Override
    public boolean saveBatch(List<GoodDto> goodDtoList) {
        List<GoodIndex> goodIndexList = BeanUtil.copyToList(goodDtoList, GoodIndex.class);
        goodRepository.saveAll(goodIndexList);
        return true;
    }

    @Override
    public boolean deleteById(String id) {
        goodRepository.deleteById(id);
        return true;
    }

    @Override
    public boolean update(GoodDto goodDto) {
        GoodIndex goodIndex = BeanUtil.copyProperties(goodDto, GoodIndex.class);
        goodRepository.save(goodIndex);
        return true;
    }

    @Override
    public Page<GoodDto> queryPage(GoodsQueryVo queryVo) {
        Page<GoodIndex> indexPage = goodRepository.findAll(PageRequest.of(queryVo.getPage(), queryVo.getSize()));
        List<GoodDto> goodDtoList = BeanUtil.copyToList(indexPage.getContent(), GoodDto.class);
        return new PageImpl<>(goodDtoList);
    }
}
