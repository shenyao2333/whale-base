package com.whale.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
/**
    * 地址-市区
    */
@Data
@TableName(value = "address_city")
public class AddressCity implements Serializable {
    @TableId(value = "city_id", type = IdType.AUTO)
    private Integer cityId;

    @TableField(value = "city_code")
    private String cityCode;

    @TableField(value = "city_name")
    private String cityName;

    @TableField(value = "pro_code")
    private String proCode;


    @TableField(exist = false)
    private List<AddressArea> areaList;

    private static final long serialVersionUID = 1L;

}