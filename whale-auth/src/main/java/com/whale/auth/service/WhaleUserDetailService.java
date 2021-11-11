package com.whale.auth.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @Author: sy
 * @Date: Created by 2021/7/13 11:09
 * @description:
 */
public interface WhaleUserDetailService extends UserDetailsService {

    /**
     * 手机号登录逻辑
     * @param mobile
     * @param code
     * @return
     */
    UserDetails loadUserByMobile(String mobile, String code);
}
