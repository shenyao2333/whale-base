package com.whale.auth.service.impl;

import com.whale.auth.entity.SysUser;
import com.whale.auth.mapper.AuthMapper;
import com.whale.auth.service.WhaleUserDetailService;
import com.whale.base.constant.CommonConstants;
import com.whale.base.exception.BaseException;
import com.whale.base.util.StrUtil;
import com.whale.data.redis.RedisUtil;
import com.whale.security.entity.WhaleUser;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author sy
 * @date 2020/3/10
 * @description 用户详情实现
 */
@Configuration
@AllArgsConstructor
public class WhaleUserDetailServiceImpl implements WhaleUserDetailService {

    private final AuthMapper authMapper;
    private final RedisUtil redisUtil;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUser sysUser = authMapper.queryUserByUserName(username);
        if (sysUser!=null){
            return new WhaleUser(sysUser.getId(), sysUser.getDeptId(), sysUser.getUserName(), sysUser.getPassword(), true, true, true, true,
                    this.createAuthorityList( sysUser.getPermsList(),sysUser.getRoleIdList()));
        }

       throw new UsernameNotFoundException("");
    }



    @Override
    public UserDetails loadUserByMobile(String mobile, String code) {
        if (StrUtil.isAllBlank(code)){
            throw new BaseException("验证码为空！");
        }
        String authCode = (String)redisUtil.get(CommonConstants.AUTH_CODE + mobile);
        if (authCode==null||!authCode.equals(code)){
            throw new BaseException("验证码错误！");
        }
        //todo 根据手机号查找用户信息

        return null;
    }







    public  List<GrantedAuthority> createAuthorityList(Set<String> authorities,Set<Integer> roleIdList) {
        if (authorities==null || authorities.size()<1){
            return AuthorityUtils.NO_AUTHORITIES;
        }
        List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>(authorities.size());
        for (String authority : authorities) {
            grantedAuthorities.add(new SimpleGrantedAuthority(authority));
        }
        for (Integer roleId : roleIdList) {
            grantedAuthorities.add(new SimpleGrantedAuthority(CommonConstants.ROLE+roleId));
        }
        return grantedAuthorities;
    }
}

