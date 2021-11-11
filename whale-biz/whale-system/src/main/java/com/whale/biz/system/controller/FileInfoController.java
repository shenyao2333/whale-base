package com.whale.biz.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.whale.biz.system.entity.FileInfo;
import com.whale.biz.system.service.FileInfoService;
import com.whale.base.api.R;
import com.whale.base.config.GlobalConfig;
import com.whale.base.util.FileUtil;
import com.whale.base.util.UploadUtil;
import com.whale.log.annotation.OperLog;
import com.whale.security.entity.WhaleUser;
import com.whale.security.util.SecurityUtil;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import org.springframework.web.bind.annotation.*;

/**
 * @author shenyao
 * @date 2019-09-30 14:17:03
 * @description 文件Controller
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/fileInfo")
public class FileInfoController {

    private final FileInfoService fileInfoService;

    private QueryWrapper<FileInfo> getQueryWrapper(FileInfo fileInfo) {
        return new QueryWrapper<FileInfo>().like(StrUtil.isNotBlank(fileInfo.getName()), "name", fileInfo.getName()).eq(StrUtil.isNotBlank(fileInfo.getType()), "type", fileInfo.getType())
                .between(StrUtil.isNotBlank(fileInfo.getBeginTime()) && StrUtil.isNotBlank(fileInfo.getEndTime()), "create_time", fileInfo.getBeginTime(), fileInfo.getEndTime()).orderByDesc("create_time");
    }

    @PreAuthorize("@ps.hasPerm('fileInfo_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, FileInfo fileInfo) {
        IPage<FileInfo> fileInfoPage = fileInfoService.page(page, getQueryWrapper(fileInfo));
        return R.ok(fileInfoPage.getRecords(), fileInfoPage.getTotal());
    }

    @OperLog("文件上传")
    @PreAuthorize("@ps.hasPerm('fileInfo_add')")
    @PostMapping("/upload")
    @ResponseBody
    public R upload(MultipartFile file, HttpServletRequest request) {
        FileInfo fileInfo = new FileInfo();
        String oFileName = file.getOriginalFilename();
        // 获取文件的文件名
        String fileName = oFileName.substring(0, oFileName.lastIndexOf("."));
        // 获取文件的后缀名
        String fileFormat = oFileName.substring(oFileName.lastIndexOf(".") + 1);
        // 获取文件的后缀名
        String type = UploadUtil.getType(fileFormat);
        // 新文件名
        String newFileName = type + new Date().getTime();
        // 获取大小
        String fileSize = FileUtil.fileSize(file.getSize());
        String path = "/profile/upload/" + type + "/" + UploadUtil.fileUp(file, GlobalConfig.getUploadPath() + type + "/", newFileName);
        fileInfo.setName(fileName);
        fileInfo.setType(type);
        fileInfo.setPath(path);
        fileInfo.setFormat(fileFormat);
        fileInfo.setSize(fileSize);
        WhaleUser user = SecurityUtil.getUser();
        fileInfo.setDeptId(user.getDeptId());
        fileInfo.setCreateBy(user.getUsername());
        fileInfo.setCreateTime(new Date());
        fileInfoService.save(fileInfo);
        return R.ok("文件上传成功！");
    }

    @OperLog("文件删除")
    @PreAuthorize("@ps.hasPerm('fileInfo_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable("id") Integer[] id) {
        return R.ok(fileInfoService.removeByIds(Arrays.asList(id)));
    }

    /**
     * 预览图片
     *
     * @param category 文件编号
     */
    @GetMapping("/preview")
    @ResponseBody
    public R preview(@RequestParam String category, @RequestParam String type, @RequestParam String baseName, @RequestParam String objId) {
        List<FileInfo> fileInfoList = fileInfoService.list(new QueryWrapper<FileInfo>().eq(StrUtil.isNotBlank(category), "category", category).eq(StrUtil.isNotBlank(type), "type", type).eq("base_name", baseName).eq("obj_id", objId));
        if (fileInfoList != null && fileInfoList.size() > 0) {
            List<Map<String, Object>> mapList = new ArrayList<>();
            for (FileInfo fileInfo : fileInfoList) {
                Map<String, Object> map = new HashMap<>();
                map.put("src", fileInfo.getThumbnail());
                map.put("name", fileInfo.getName());
                map.put("id", fileInfo.getId());
                mapList.add(map);
            }
            return R.ok(mapList);
        } else {
            return R.error("暂无数据");
        }
    }
}
