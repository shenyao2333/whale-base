package com.whale.biz.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whale.biz.system.entity.Config;
import com.whale.biz.system.service.ConfigService;
import com.whale.base.api.R;
import com.whale.log.annotation.OperLog;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;

import java.util.Arrays;
import org.springframework.web.bind.annotation.*;
/**
 * 参数信息
 *
 * @author shenyao
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/config")
public class ConfigController {

    private final ConfigService configService;

    private QueryWrapper<Config> getQueryWrapper(Config config) {
        return new QueryWrapper<Config>().like(StrUtil.isNotBlank(config.getName()), "name", config.getName()).orderByDesc("id")
                .eq(StrUtil.isNotBlank(config.getKey()), "`key`", config.getKey()).eq(StrUtil.isNotBlank(config.getIsSys()), "is_sys", config.getIsSys())
                .between(StrUtil.isNotBlank(config.getBeginTime()) && StrUtil.isNotBlank(config.getEndTime()), "create_time", config.getBeginTime(), config.getEndTime());
    }

    @PreAuthorize("@ps.hasPerm('config_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, Config config) {
        IPage<Config> configPage = configService.page(page, getQueryWrapper(config));
        return R.ok(configPage.getRecords(), configPage.getTotal());
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(configService.getById(id));
    }

    @GetMapping("/getByKey/{key}")
    public R getByKey(@PathVariable("key") String key) {
        return R.ok(configService.getValueByKey(key));
    }


    @OperLog("参数新增")
    @PreAuthorize("@ps.hasPerm('config_add')")
    @PostMapping("/save")
    @ResponseBody
    public R save(@Validated @RequestBody Config config) {
        configService.save(config);
        return R.ok();
    }

    @OperLog("参数修改")
    @PreAuthorize("@ps.hasPerm('config_edit')")
    @PutMapping("/update")
    @ResponseBody
    public R update(@Validated @RequestBody Config config) {
        configService.updateById(config);
        return R.ok();
    }

    @OperLog("参数删除")
    @PreAuthorize("@ps.hasPerm('config_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable Integer[] id) {
        try {
            configService.removeByIds(Arrays.asList(id));
            return R.ok();
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
    }
}
