package com.whale.common.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.whale.common.entity.AddressArea;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
public interface AddressAreaMapper extends BaseMapper<AddressArea> {

    List<AddressArea> getByAreaCode(@Param("cityCode") String cityCode);

}