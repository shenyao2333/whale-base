package com.whale.biz.system.service.impl;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.system.entity.DictData;
import com.whale.biz.system.mapper.DictDataMapper;
import com.whale.biz.system.service.DictDataService;
import com.whale.base.config.GlobalConfig;
import com.whale.base.util.StrUtil;
import com.whale.data.redis.RedisUtil;
import lombok.AllArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 字典数据表 服务实现类
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
@Service
@AllArgsConstructor
public class DictDataServiceImpl extends ServiceImpl<DictDataMapper, DictData> implements DictDataService {

    private final String REDIS_DIR = "dictdata:";
    private final RedisUtil redisUtil;


    @Override
    public List<DictData> getDictDataList(String dictType) {
        List<DictData> dictDataList = new ArrayList<>();
        //redis缓存
        String cacheKey = REDIS_DIR + dictType;
        List<DictData> dicts =(List<DictData>) redisUtil.get(cacheKey);
        if (dicts!=null) {
          return  dicts ;
        } else {
            dictDataList = baseMapper.selectList(new QueryWrapper<DictData>().eq("dict_type", dictType).orderByAsc("sort"));
            redisUtil.set(cacheKey, dictDataList);
        }
        return dictDataList;
    }

    @Override
    public void delRedisByDictType(String dictType) {
        redisUtil.del(REDIS_DIR + dictType);
    }


}
