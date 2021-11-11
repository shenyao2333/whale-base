package com.whale.auth.mapper;

import com.whale.auth.entity.SysUser;
import org.apache.ibatis.annotations.Param;

/**
 * @Author: sy
 * @Date: Created by 2021/7/13 11:14
 * @description:
 */
public interface AuthMapper {

    SysUser queryUserByUserName(@Param("userName") String userName);



}
