package com.iwbr.spike.goods.web;

import cn.hutool.core.bean.BeanUtil;
import com.iwbr.spike.common.entity.dto.goods.GoodDto;
import com.iwbr.spike.common.response.ResponseData;
import com.iwbr.spike.common.web.BaseController;
import com.iwbr.spike.goods.entity.Good;
import com.iwbr.spike.goods.service.GoodService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @description: 商品相关接口
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 22:37:36
 */
@Slf4j
@CrossOrigin
@RestController
@RequestMapping("/rest/good")
public class GoodController extends BaseController {

    @Autowired
    private GoodService goodService;

    @PostMapping("/save/batch")
    public ResponseData<Boolean> addGoods(@RequestBody List<GoodDto> goodDtoList){
        List<Good> goodList = BeanUtil.copyToList(goodDtoList, Good.class);
        return successWithData(goodService.saveBatch(goodList));
    }

    @GetMapping("/query/{id}")
    public ResponseData<GoodDto> queryGood(@PathVariable(value = "id") String id){
        GoodDto goodDto = BeanUtil.copyProperties(goodService.getById(id), GoodDto.class);
        return successWithData(goodDto);
    }

}
