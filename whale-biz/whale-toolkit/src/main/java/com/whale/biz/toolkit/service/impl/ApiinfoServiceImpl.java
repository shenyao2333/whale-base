package com.whale.biz.toolkit.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.toolkit.entity.Apiinfo;
import com.whale.biz.toolkit.mapper.ApiinfoMapper;
import com.whale.biz.toolkit.service.ApiinfoService;
import org.springframework.stereotype.Service;

/**
 * @author shenyao
 * @date 2020-04-24 22:18:00
 * @description 接口Service业务层
 */
@Service
public class ApiinfoServiceImpl extends ServiceImpl<ApiinfoMapper, Apiinfo> implements ApiinfoService {
}
