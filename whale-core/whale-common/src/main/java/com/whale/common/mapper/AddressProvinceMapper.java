package com.whale.common.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.whale.common.entity.AddressProvince;

import java.util.List;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
public interface AddressProvinceMapper extends BaseMapper<AddressProvince> {


    List<AddressProvince> getAll();


}