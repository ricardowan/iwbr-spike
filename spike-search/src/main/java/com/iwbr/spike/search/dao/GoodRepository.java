package com.iwbr.spike.search.dao;

import com.iwbr.spike.search.entity.GoodIndex;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * @description: 商品es存储
 * @author: <a href="mailto:ricardomrwang@gmail.com">wangbaorui</a>
 * @date: 2024-09-10 21:49:22
 */
public interface GoodRepository extends ElasticsearchRepository<GoodIndex, String> {

}
