package com.whale.common.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.common.mapper.AddressProvinceMapper;
import com.whale.common.entity.AddressProvince;
import com.whale.common.service.AddressProvinceService;
/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
@Service
@CacheConfig(cacheNames = "address")
public class AddressProvinceServiceImpl extends ServiceImpl<AddressProvinceMapper, AddressProvince> implements AddressProvinceService{

    @Override
    @Cacheable(key = "'province'")
    public List<AddressProvince> list() {
        return this.list(Wrappers.emptyWrapper());
    }

    @Override
    @Cacheable(key = "'all'")
    public List<AddressProvince> getAll() {
        return baseMapper.getAll();
    }
}
