package com.whale.data.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.Date;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:03
 * @description:
 */
@Data
public class FaunEntity {
    protected static final long serialVersionUID = 1L;



    /** 开始时间 */
    @TableField(exist = false)
    @JsonIgnore
    @ExcelIgnore
    private String beginTime;

    /** 结束时间 */
    @TableField(exist = false)
    @JsonIgnore
    @ExcelIgnore
    private String endTime;

    @TableField(exist = false)
    @JsonIgnore
    @ExcelIgnore
    private String sqlFilter;
}
