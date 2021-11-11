package com.whale.common.service;

import com.whale.common.entity.AddressCity;
import com.whale.common.entity.AddressProvince;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
public interface AddressProvinceService extends IService<AddressProvince>{


    List<AddressProvince> getAll();

}
