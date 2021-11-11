package com.whale.biz.toolkit.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.biz.toolkit.entity.Dataset;
import com.whale.biz.toolkit.mapper.DatasetMapper;
import com.whale.biz.toolkit.service.DatasetService;
import org.springframework.stereotype.Service;

/**
 * @author shenyao
 * @date 2020-06-12 21:56:29
 * @description 数据源Service业务层
 */
@Service
public class DatasetServiceImpl extends ServiceImpl<DatasetMapper, Dataset> implements DatasetService {
}
