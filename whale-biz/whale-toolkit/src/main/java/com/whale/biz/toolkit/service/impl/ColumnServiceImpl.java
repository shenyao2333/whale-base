package com.whale.biz.toolkit.service.impl;

import cn.hutool.core.convert.Convert;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.whale.base.util.StrUtil;
import com.whale.biz.toolkit.entity.Column;
import com.whale.biz.toolkit.mapper.ColumnMapper;
import com.whale.biz.toolkit.service.ColumnService;
import com.whale.data.datasource.DSContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务字段 服务层实现
 */
@Service
public class ColumnServiceImpl extends ServiceImpl<ColumnMapper, Column> implements ColumnService {

    @Override
    public List<Column> selectDbColumnsByName(String tableName,String alias) {
        try {
            if (StrUtil.isNotBlank(alias)){
                DSContextHolder.setDSType(alias);
            }
            return baseMapper.selectDbColumnsByName(tableName);
        }finally {
            DSContextHolder.clearDSType();
        }


    }

    @Override
    public int deleteColumnByTableIds(String ids) {
        return baseMapper.deleteColumnByTableIds(Convert.toIntArray(ids));
    }
}
