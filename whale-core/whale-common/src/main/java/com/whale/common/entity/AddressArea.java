package com.whale.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
/**
    * 地址-县/区
    */
@Data
@TableName(value = "address_area")
public class AddressArea implements Serializable {
    @TableId(value = "are_id", type = IdType.INPUT)
    private Integer areId;

    @TableField(value = "are_code")
    private String areCode;

    @TableField(value = "are_name")
    private String areName;

    @TableField(value = "city_code")
    private String cityCode;

    private static final long serialVersionUID = 1L;

}