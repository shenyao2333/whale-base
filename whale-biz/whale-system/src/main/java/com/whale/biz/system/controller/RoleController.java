package com.whale.biz.system.controller;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whale.biz.system.entity.Role;
import com.whale.biz.system.service.RoleService;
import com.whale.base.api.R;
import com.whale.base.util.PinyinUtil;
import com.whale.log.annotation.OperLog;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import org.springframework.web.bind.annotation.*;
/**
 * 角色信息
 *
 * @author shenyao
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/role")
public class RoleController {

    private final RoleService roleService;

    private QueryWrapper<Role> getQueryWrapper(Role role) {
        return new QueryWrapper<Role>().like(StrUtil.isNotBlank(role.getName()), "name", role.getName()).eq(StrUtil.isNotBlank(role.getCode()), "code", role.getCode())
                .between(StrUtil.isNotBlank(role.getBeginTime()) && StrUtil.isNotBlank(role.getEndTime()), "create_time", role.getBeginTime(), role.getEndTime());
    }

    @PreAuthorize("@ps.hasPerm('role_view')")
    @GetMapping("/list")
    public R list(Page page, Role role) {
        IPage<Role> roleIPage = roleService.page(page, getQueryWrapper(role));
        return R.ok(roleIPage.getRecords(), roleIPage.getTotal());
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(roleService.getById(id));
    }

    @OperLog("角色新增")
    @PreAuthorize("@ps.hasPerm('role_add')")
    @PostMapping("/save")
    public R save(@RequestBody Role role) {
        if (StrUtil.isBlank(role.getCode()) && ObjectUtil.isNull(role.getId()) && StrUtil.isNotBlank(role.getName())) {
            role.setCode(PinyinUtil.getAllFirstLetter(role.getName()));
        }
        roleService.insertRole(role);
        return R.ok();
    }

    @OperLog("角色修改")
    @PreAuthorize("@ps.hasPerm('role_edit')")
    @PutMapping("/update")
    public R update(@RequestBody Role role) {
        roleService.updateRoleMenu(role);
        return R.ok();
    }

    @OperLog("数据权限修改")
    @PreAuthorize("@ps.hasPerm('role_data')")
    @PutMapping("/dataScope")
    public R dataScope(@RequestBody Role role) {
        if(role.getId() == 1){
            return R.error("不允许操作超级管理员角色");
        }
        return R.ok(roleService.updatePerms(role));
    }

    @OperLog("角色状态更改")
    @PreAuthorize("@ps.hasPerm('role_edit')")
    @PutMapping("/changeStatus")
    public R changeStatus(@RequestBody Role role) {
        roleService.update(new UpdateWrapper<Role>().eq("id", role.getId()).set("status", role.getStatus()));
        return R.ok();
    }

    @OperLog("角色删除")
    @PreAuthorize("@ps.hasPerm('role_del')")
    @DeleteMapping("/remove/{id}")
    public R remove(@PathVariable Integer[] id) {
        if(ArrayUtil.contains(id, 1)){
            return R.error("不允许删除管理员角色");
        }
        roleService.removeByIds(Arrays.asList(id));
        return R.ok();
    }

}
