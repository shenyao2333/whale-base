package com.whale.biz.quartz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.quartz.entity.JobLog;
import com.whale.biz.quartz.mapper.JobLogMapper;
import com.whale.biz.quartz.service.JobLogService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;


/**
 * 定时任务执行日志表
 *
 * @author shenyao
 * @date 2019-06-28
 */
@Service
@AllArgsConstructor
public class JobLogServiceImpl extends ServiceImpl<JobLogMapper, JobLog> implements JobLogService {

}
