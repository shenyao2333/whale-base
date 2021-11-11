package com.whale.biz.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.whale.biz.system.entity.RoleMenu;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 角色和菜单关联表 Mapper 接口
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {


    int delRoleMenu(@Param("roleId") Integer roleId, @Param("applicationId") String[] applicationId);

}
