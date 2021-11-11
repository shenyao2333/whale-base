package com.whale.biz.toolkit.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.whale.biz.toolkit.entity.Column;

import java.util.List;

/**
 * 业务字段 服务层
 */
public interface ColumnService extends IService<Column> {

    /**
     * 根据表名称查询列信息
     *
     * @param tableName 表名称
     * @return 列信息
     */
    List<Column> selectDbColumnsByName(String tableName,String alias);

    /**
     * 删除业务字段信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteColumnByTableIds(String ids);
}
