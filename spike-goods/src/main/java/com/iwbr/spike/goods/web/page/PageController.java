package com.iwbr.spike.goods.web.page;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Assert;
import com.alibaba.fastjson2.JSON;
import com.iwbr.spike.common.response.ResponseData;
import com.iwbr.spike.common.web.BaseController;
import com.iwbr.spike.goods.entity.Good;
import com.iwbr.spike.goods.service.GoodService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.*;

import java.io.File;

/**
 * @description: 页面控制器
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-08 21:36:37
 */
@Slf4j
@CrossOrigin
@RestController
@RequestMapping("/rest/page")
public class PageController extends BaseController {

    @Value("${custom.store.page:/opt/data/html}")
    private String pagePath;

    @Autowired
    private Configuration configuration;

    @Autowired
    private GoodService goodService;

    @GetMapping("/create/good/{id}")
    public ResponseData<Boolean> createGoodPage(@PathVariable(value = "id") String id) {
        // 查询商品信息
        Good good = goodService.getById(id);
        Assert.notNull(good,"根据id查询不到商品信息！");
        try {
            // 获取商品详情模版
            Template template = configuration.getTemplate("good-detail.ftl");
            // 根据当前商品数据将模版转换成静态文件存储
            String intoString = FreeMarkerTemplateUtils.processTemplateIntoString(template, good);
            String filePath = pagePath.endsWith(File.separator) ? pagePath : pagePath.concat(File.separator);
            filePath = filePath.concat(id).concat(".html");
            File file = FileUtil.writeUtf8String(intoString, new File(filePath));
            return successWithData(true);
        } catch (Exception e) {
            throw new RuntimeException("商品【{"+ good.getGoodName() +"}】的详情页生产失败，原因：" + e.getMessage());
        }
    }
}
