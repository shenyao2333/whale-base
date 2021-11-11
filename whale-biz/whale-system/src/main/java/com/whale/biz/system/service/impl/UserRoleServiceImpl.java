package com.whale.biz.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.system.entity.UserRole;
import com.whale.biz.system.mapper.UserRoleMapper;
import com.whale.biz.system.service.UserRoleService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户和角色关联表 服务实现类
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {

}
