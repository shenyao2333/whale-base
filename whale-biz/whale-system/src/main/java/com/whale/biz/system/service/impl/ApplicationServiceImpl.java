package com.whale.biz.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.system.entity.Application;
import com.whale.biz.system.mapper.ApplicationMapper;
import com.whale.biz.system.service.ApplicationService;
import org.springframework.stereotype.Service;

/**
 * @author shenyao
 * @date 2020-04-23 18:15:10
 * @description 应用Service业务层
 */
@Service
public class ApplicationServiceImpl extends ServiceImpl<ApplicationMapper, Application> implements ApplicationService {
}
