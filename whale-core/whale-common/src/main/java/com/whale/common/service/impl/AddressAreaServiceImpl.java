package com.whale.common.service.impl;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.common.mapper.AddressAreaMapper;
import com.whale.common.entity.AddressArea;
import com.whale.common.service.AddressAreaService;
/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
@Service
public class AddressAreaServiceImpl extends ServiceImpl<AddressAreaMapper, AddressArea> implements AddressAreaService{


    @Override
    @Cacheable(value = "address:area",key = "#cityCode")
    public List<AddressArea> getByAreaCode(String cityCode) {
        return baseMapper.getByAreaCode(cityCode);
    }
}
