package com.whale.biz.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.whale.base.api.R;
import com.whale.biz.system.entity.Application;
import com.whale.biz.system.entity.Menu;
import com.whale.biz.system.service.ApplicationService;
import com.whale.biz.system.service.MenuService;
import com.whale.biz.system.service.RoleMenuService;
import com.whale.biz.system.service.UserService;
import com.whale.biz.system.vo.ResultVo;
import com.whale.log.annotation.OperLog;
import com.whale.security.util.SecurityUtil;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.*;
import java.util.stream.Collectors;
import org.springframework.web.bind.annotation.*;
/**
 * 菜单信息
 *
 * @author shenyao
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/menu")
public class MenuController {

    private final ApplicationService applicationService;
    private final MenuService menuService;
    private final RoleMenuService roleMenuService;
    private final UserService userService;

    private QueryWrapper<Menu> getQueryWrapper(Menu menu) {
        return new QueryWrapper<Menu>().like(StrUtil.isNotBlank(menu.getName()), "name", menu.getName()).eq(StrUtil.isNotBlank(menu.getStatus()), "status", menu.getStatus())
                .eq(menu.getApplicationId()!=null,"application_id",menu.getApplicationId())
                .orderByAsc("sort")
                .between(StrUtil.isNotBlank(menu.getBeginTime()) && StrUtil.isNotBlank(menu.getEndTime()), "create_time", menu.getBeginTime(), menu.getEndTime());
    }

    @PreAuthorize("@ps.hasPerm('menu_view')")
    @GetMapping("/list")
    public R list(Menu menu) {
        List<Menu> menuList = menuService.list(getQueryWrapper(menu));
        if (menuList.size() > 0) {
            for (Menu menu1 : menuList) {
                if (StrUtil.isNotBlank(menu.getName()) || StrUtil.isNotBlank(menu.getStatus())) {
                    menu1.setParentId(0);
                }
            }
        }
        return R.ok(menuList, menuList.size());
    }

    @GetMapping
    public R getMenus() {
        List<Application> applications = applicationService.list(new QueryWrapper<Application>().orderByAsc("sort"));
        Set<Menu> menuSet = new HashSet<>();
        SecurityUtil.getRoles().forEach(roleId -> menuSet.addAll(menuService.selectMenuListByRoleId(roleId)));
        List<Menu> menuList = menuSet.stream().sorted(Comparator.comparingInt(Menu::getSort)).collect(Collectors.toList());
        Map<String, Object> map = new HashMap<>();
        map.put("applications", applications);
        map.put("menus", menuService.buildMenus(menuService.buildTree(menuList, 0)));
        return R.ok(map);
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(menuService.getById(id));
    }

    @OperLog("菜单新增")
    @PreAuthorize("@ps.hasPerm('menu_add')")
    @PostMapping("/save")
    public R save(@RequestBody Menu menu) {
        menuService.save(menu);
        return R.ok();
    }

    @OperLog("菜单修改")
    @PreAuthorize("@ps.hasPerm('menu_edit')")
    @PutMapping("/update")
    public R update(@RequestBody Menu menu) {
        menuService.updateById(menu);
        return R.ok();
    }

    @OperLog("菜单删除")
    @PreAuthorize("@ps.hasPerm('menu_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable("id") Integer id) {
        if (menuService.count(new QueryWrapper<Menu>().eq("parent_id", id)) > 0) {
            return R.error("存在子菜单,不允许删除");
        }
        //if (roleMenuService.count(new QueryWrapper<RoleMenu>().eq("menu_id", id)) > 0) {
        //    return R.error("菜单已分配,不允许删除");
        //}
        menuService.removeById(id);
        return R.ok();
    }

    @OperLog("菜单状态更改")
    @PreAuthorize("@ps.hasPerm('menu_edit')")
    @GetMapping("/changeStatus")
    public R changeStatus(Menu menu) {
        menuService.updateById(menu);
        return R.ok();
    }

    /**
     * 加载所有菜单列表树
     */
    @GetMapping("/menuTree")
    @ResponseBody
    public R menuTree(@RequestParam(required = false) String applicationIds) {

        List<Menu> menuList = menuService.list(new QueryWrapper<Menu>().in(StrUtil.isNotBlank(applicationIds), "application_id", applicationIds.split(",")).eq("status", "0").orderByAsc("sort"));
        return R.ok(menuList);
    }

    /**
     * 加载角色菜单列表树
     */
    @GetMapping("/roleMenuTree/{roleId}")
    public R roleMenuTree(@PathVariable Integer roleId) {
        List<Menu> menuList = menuService.list(new QueryWrapper<Menu>().eq("status", "0").orderByAsc("sort"));
        return R.ok(ResultVo.builder().result(menuList).extend(menuService.selectMenusByRoleId(roleId)).build());
    }

}
