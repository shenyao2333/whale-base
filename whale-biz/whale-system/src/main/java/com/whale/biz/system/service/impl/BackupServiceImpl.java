package com.whale.biz.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.system.entity.Backup;
import com.whale.biz.system.mapper.BackupMapper;
import com.whale.biz.system.service.BackupService;
import org.springframework.stereotype.Service;

/**
 * @author shenyao
 * @date 2020-03-02 16:33:24
 *
 * @description 备份Service业务层
 */
@Service
public class BackupServiceImpl extends ServiceImpl<BackupMapper, Backup> implements BackupService {

}
