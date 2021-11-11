package com.whale.common.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.common.mapper.AddressCityMapper;
import com.whale.common.entity.AddressCity;
import com.whale.common.service.AddressCityService;
/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
@Service
public class AddressCityServiceImpl extends ServiceImpl<AddressCityMapper, AddressCity> implements AddressCityService{



    @Override
    @Cacheable(value = "address:city",key = "#proCode")
    public List<AddressCity> getByProCode(String proCode) {
        return baseMapper.getByProCode(proCode);
    }
}
