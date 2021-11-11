package com.whale.biz.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.system.entity.Dept;
import com.whale.biz.system.entity.Role;
import com.whale.biz.system.entity.RoleDept;
import com.whale.biz.system.entity.RoleMenu;
import com.whale.biz.system.mapper.RoleMapper;
import com.whale.biz.system.mapper.RoleMenuMapper;
import com.whale.biz.system.service.DeptService;
import com.whale.biz.system.service.RoleDeptService;
import com.whale.biz.system.service.RoleMenuService;
import com.whale.biz.system.service.RoleService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.ExecutorService;

/**
 * <p>
 * 角色信息表 服务实现类
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
@Service
@RequiredArgsConstructor
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    private final DeptService deptService;
    private final RoleMenuMapper roleMenuMapper;
    private final RoleDeptService roleDeptService;
    private final RoleMenuService roleMenuService;

    @Resource
    @Qualifier("taskExecutor")
    private  ExecutorService executorService;

    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    @Override
    public Set<String> selectRoleKeys(Integer userId) {
        List<Role> perms = baseMapper.selectRolesByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (Role perm : perms) {
            if (perm != null) {
                permsSet.addAll(Arrays.asList(perm.getCode().trim().split(",")));
            }
        }
        return permsSet;
    }

    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    @Override
    public List<Role> selectMyRolesByUserId(Integer userId) {
        return baseMapper.selectRolesByUserId(userId);
    }

    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    @Override
    public List<Role> selectRolesByUserId(Integer userId) {
        List<Role> roles = baseMapper.selectList(new QueryWrapper<>());
        if (StrUtil.isEmptyIfStr(userId)) {
            return roles;
        } else {
            List<Role> userRoles = baseMapper.selectRolesByUserId(userId);
            for (Role role : roles) {
                for (Role userRole : userRoles) {
                    if (role.getId().equals(userRole.getId())) {
                        role.setFlag(true);
                        break;
                    }
                }
            }
            return roles;
        }
    }

    /**
     * 新增保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    @Transactional
    public boolean insertRole(Role role) {
        baseMapper.insert(role);
        return insertRoleMenu(role);
    }

    /**
     * 修改数据权限信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public boolean updatePerms(Role role) {
        // 修改角色信息
        baseMapper.updateById(role);
        // 删除角色与部门关联
        roleDeptService.remove(new QueryWrapper<RoleDept>().eq("role_id", role.getId()));
        // 新增角色和部门信息（数据权限）
        return insertRoleDept(role);
    }

    /**
     * 新增角色部门信息(数据权限)
     *
     * @param role 角色对象
     */
    public boolean insertRoleDept(Role role) {
        boolean rows = true;
        // 新增角色与部门（数据权限）管理
        List<RoleDept> list = new ArrayList<RoleDept>();
        for (Integer deptId : role.getDeptIds()) {
            Dept dept = deptService.getById(deptId);
            if (dept != null) {
                RoleDept rd = new RoleDept();
                rd.setRoleId(role.getId());
                rd.setDeptId(deptId);
                list.add(rd);
            }
        }
        if (list.size() > 0) {
            rows = roleDeptService.saveBatch(list);
        }
        return rows;
    }


    /**
     * 修改保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */

    @Override
    @SneakyThrows
    public boolean updateRoleMenu(Role role) {
        // 修改角色信息
        baseMapper.updateById(role);
        String[] split = new String[0];
        String applications = role.getApplications();
        if (StrUtil.isNotBlank(applications)){
            if (',' == applications.charAt(0)) {
                applications =  applications.substring(1).trim();
            }
            split = applications.split(",");
        }
        if( split.length > 0 ){
            roleMenuMapper.delRoleMenu(role.getId(),split);
        }else{
            roleMenuService.remove(new QueryWrapper<RoleMenu>().eq("role_id", role.getId()));
        }
        return insertRoleMenu(role);
    }

    /**
     * 新增角色菜单信息
     *
     * @param role 角色对象
     */
    public boolean insertRoleMenu(Role role) {
        boolean rows = true;
        // 新增用户与角色管理
        List<RoleMenu> list = new ArrayList<RoleMenu>();
        for (Integer menuId : role.getMenuIds()) {
            RoleMenu rm = new RoleMenu();
            rm.setRoleId(role.getId());
            rm.setMenuId(menuId);
            list.add(rm);
        }
        if (list.size() > 0) {
            rows = roleMenuService.saveBatch(list);
        }
        return rows;
    }
}
