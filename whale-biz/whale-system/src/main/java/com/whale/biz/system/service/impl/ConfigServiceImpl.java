package com.whale.biz.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.system.entity.Config;
import com.whale.biz.system.mapper.ConfigMapper;
import com.whale.biz.system.service.ConfigService;
import com.whale.base.config.GlobalConfig;
import com.whale.base.util.StrUtil;
import com.whale.data.redis.RedisUtil;
import lombok.AllArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;

/**
 * <p>
 * 参数配置表 服务实现类
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
@Service
@AllArgsConstructor
public class ConfigServiceImpl extends ServiceImpl<ConfigMapper, Config> implements ConfigService {


    private final RedisUtil redisUtil;


    @Override
    public String getValueByKey(String key) {
        String value = "";
        //redis缓存
        String valStr = (String) redisUtil.get(key);
        if (valStr == null) {
            Config config = baseMapper.selectOne(new QueryWrapper<Config>().eq("`key`", key));
            if (config != null) {
                value = config.getValue();
                redisUtil.set(key,value,3600*12);
            }
        }
        return value;
    }
}
