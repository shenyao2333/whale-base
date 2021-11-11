package com.whale.biz.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.whale.biz.system.entity.DictData;

import java.util.List;

/**
 * <p>
 * 字典数据表 服务类
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
public interface DictDataService extends IService<DictData> {

    List<DictData> getDictDataList(String dictType);


    void delRedisByDictType(String dictType);
}
