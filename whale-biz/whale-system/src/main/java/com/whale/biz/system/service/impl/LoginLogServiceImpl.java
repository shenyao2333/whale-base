package com.whale.biz.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.system.entity.LoginLog;
import com.whale.biz.system.mapper.LoginLogMapper;
import com.whale.biz.system.service.LoginLogService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统访问记录 服务实现类
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
@Service
public class LoginLogServiceImpl extends ServiceImpl<LoginLogMapper, LoginLog> implements LoginLogService {

}
