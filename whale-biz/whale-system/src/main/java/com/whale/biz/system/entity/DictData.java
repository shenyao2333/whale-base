package com.whale.biz.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whale.data.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 字典数据表
 * </p>
 *
 * @author shenyao
 * @since 2019-01-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_dict_data")
public class DictData extends BaseEntity {


    private static final long serialVersionUID = -4523717346319198538L;

    /**
     * 数据编号
     */
    @TableId
    private Integer id;

    /**
     * 字典类型
     */
    private String dictType;

    /**
     * 字典标签
     */
    private String label;

    /**
     * 字典键值
     */
    private String value;

    /**
     * 字典排序
     */
    private Integer sort;

}
