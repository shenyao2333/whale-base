package com.whale.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:33
 * @description: $description
 */
/**
    * 地址-省份
    */
@Data
@TableName(value = "address_province")
public class AddressProvince implements Serializable {

    @TableId(value = "pro_id", type = IdType.INPUT)
    private Integer proId;

    @TableField(value = "pro_code")
    private String proCode;

    @TableField(value = "pro_name")
    private String proName;

    @TableField(exist = false)
    private List<AddressCity>  cityList;

    private static final long serialVersionUID = 1L;

}