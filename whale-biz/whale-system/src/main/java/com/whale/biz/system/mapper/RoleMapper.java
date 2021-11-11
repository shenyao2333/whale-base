package com.whale.biz.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.whale.biz.system.entity.Role;

import java.util.List;

/**
 * <p>
 * 角色信息表 Mapper 接口
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
public interface RoleMapper extends BaseMapper<Role> {
    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    public List<Role> selectRolesByUserId(Integer userId);

}
