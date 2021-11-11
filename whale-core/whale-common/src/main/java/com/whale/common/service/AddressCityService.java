package com.whale.common.service;

import com.whale.common.entity.AddressCity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
public interface AddressCityService extends IService<AddressCity>{


    List<AddressCity> getByProCode(String proCode);
}
