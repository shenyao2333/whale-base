package com.whale.common.service;

import com.whale.common.entity.AddressArea;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
public interface AddressAreaService extends IService<AddressArea>{


    List<AddressArea> getByAreaCode(String cityCode);
}
