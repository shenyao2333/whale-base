package com.whale.biz.quartz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.quartz.entity.Job;
import com.whale.biz.quartz.mapper.JobMapper;
import com.whale.biz.quartz.service.JobService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 定时任务调度表
 *
 * @author shenyao
 * @date 2019-06-28
 */
@Service
@AllArgsConstructor
public class JobServiceImpl extends ServiceImpl<JobMapper, Job> implements JobService {

}
