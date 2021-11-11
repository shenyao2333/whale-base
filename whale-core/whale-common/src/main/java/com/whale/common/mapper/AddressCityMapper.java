package com.whale.common.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.whale.common.entity.AddressCity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
public interface AddressCityMapper extends BaseMapper<AddressCity> {

    List<AddressCity> getByProCode(@Param("proCode") String proCode);
}