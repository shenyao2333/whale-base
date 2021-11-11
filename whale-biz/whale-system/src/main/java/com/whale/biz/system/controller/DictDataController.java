package com.whale.biz.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whale.biz.system.entity.DictData;
import com.whale.biz.system.service.DictDataService;
import com.whale.biz.system.service.DictService;
import com.whale.base.api.R;
import com.whale.data.redis.RedisUtil;
import com.whale.log.annotation.OperLog;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.Arrays;
import org.springframework.web.bind.annotation.*;
/**
 * 数据字典信息
 *
 * @author shenyao
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/dictData")
public class DictDataController {

    private final DictService dictService;
    private final DictDataService dictDataService;


    private QueryWrapper<DictData> getQueryWrapper(DictData dictData) {
        return new QueryWrapper<DictData>().like(StrUtil.isNotBlank(dictData.getLabel()), "label", dictData.getLabel())
                .eq(StrUtil.isNotBlank(dictData.getDictType()), "dict_type", dictData.getDictType()).orderByDesc("id");
    }

    @PreAuthorize("@ps.hasPerm('dictData_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, DictData dictData) {
        IPage<DictData> dictPage = dictDataService.page(page, getQueryWrapper(dictData));
        return R.ok(dictPage.getRecords(), dictPage.getTotal());
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(dictDataService.getById(id));
    }

    @GetMapping("/dictType/{dictType}")
    @ResponseBody
    public R dictType(@PathVariable String dictType) {
        return R.ok(dictDataService.getDictDataList(dictType));
    }

    @OperLog("字典数据新增")
    @PreAuthorize("@ps.hasPerm('dictData_add')")
    @PostMapping("/save")
    @ResponseBody
    public R save(@RequestBody DictData dictData) {
        dictDataService.save(dictData);
        dictDataService.delRedisByDictType(dictData.getDictType());
        return R.ok();
    }

    @OperLog("字典数据修改")
    @PreAuthorize("@ps.hasPerm('dictData_edit')")
    @PutMapping("/update")
    public R update(@RequestBody DictData dictData) {
        dictDataService.updateById(dictData);
        dictDataService.delRedisByDictType(dictData.getDictType());
        return R.ok();
    }

    @OperLog("字典数据删除")
    @PreAuthorize("@ps.hasPerm('dictData_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable Integer[] id) {
        DictData date = dictDataService.getById(id[0]);
        dictDataService.removeByIds(Arrays.asList(id));
        dictDataService.delRedisByDictType(date.getDictType());
        return R.ok();
    }

    @GetMapping("/getDictData")
    @ResponseBody
    public R getDictData(String dictType, String value) {
        DictData dictData = dictDataService.getOne(new QueryWrapper<DictData>().eq("dict_type", dictType).eq("value", value));
        if(dictData != null){
            return R.ok(dictData.getLabel());
        }else {
            return R.error("数据不存在");
        }
    }


    private void removeRedisKey(){

    }
}
