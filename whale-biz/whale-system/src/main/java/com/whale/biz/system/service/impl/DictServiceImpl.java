package com.whale.biz.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.system.entity.Dict;
import com.whale.biz.system.mapper.DictMapper;
import com.whale.biz.system.service.DictService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 字典类型表 服务实现类
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
@Service
public class DictServiceImpl extends ServiceImpl<DictMapper, Dict> implements DictService {

}
