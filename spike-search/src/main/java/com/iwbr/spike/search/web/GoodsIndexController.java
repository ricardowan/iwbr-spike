package com.iwbr.spike.search.web;

import com.iwbr.spike.common.entity.dto.goods.GoodDto;
import com.iwbr.spike.common.entity.vo.goods.GoodsQueryVo;
import com.iwbr.spike.common.response.ResponseData;
import com.iwbr.spike.common.web.BaseController;
import com.iwbr.spike.search.service.GoodsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @description: 货物索引控制器
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-10 23:14:43
 */
@Slf4j
@CrossOrigin
@RestController
@RequestMapping("/rest/good")
public class GoodsIndexController extends BaseController {

    @Autowired
    private GoodsService goodsService;

    @PostMapping("/save/batch")
    public ResponseData<Boolean> saveGoodsBatch(@RequestBody List<GoodDto> goodDtoList){
        return successWithData(goodsService.saveBatch(goodDtoList));
    }

    @GetMapping("/delete")
    public ResponseData<Boolean> deleteById(@RequestParam(value = "id") String id){
        return successWithData(goodsService.deleteById(id));
    }

    @PostMapping("/update")
    public ResponseData<Boolean> deleteById(@RequestBody GoodDto goodDto){
        return successWithData(goodsService.update(goodDto));
    }

    @PostMapping("/query/page")
    public ResponseData<Page<GoodDto>> queryPage(@RequestBody GoodsQueryVo queryVo){
        return successWithData(goodsService.queryPage(queryVo));
    }

}
