package com.whale.common.controller;

import com.whale.base.api.R;
import com.whale.common.entity.AddressArea;
import com.whale.common.entity.AddressCity;
import com.whale.common.entity.AddressProvince;
import com.whale.common.service.AddressAreaService;
import com.whale.common.service.AddressCityService;
import com.whale.common.service.AddressProvinceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-18:40
 * @description: 地区处理
 */
@RestController
@Api(tags = "地址信息")
@RequestMapping("/api/address")
@AllArgsConstructor
public class AddressController {

    private final AddressCityService cityService;
    private final AddressAreaService areaService;
    private final AddressProvinceService provinceService;


    @GetMapping("/province")
    @ApiOperation(value = "获取省份信息")
    public R<List<AddressProvince>> province(){
        List<AddressProvince> list = provinceService.list();
        return   R.ok(list);
    }


    @GetMapping("/all")
    @ApiOperation(value = "获取全部地区信息")
    public R<List<AddressProvince>> all(){
        List<AddressProvince> list = provinceService.getAll();
        return   R.ok(list);
    }


    @GetMapping("/city")
    @ApiOperation(value = "获取市级信息")
    public R<List<AddressCity>> city(@RequestParam(defaultValue = "") String proCode){
        List<AddressCity> cityList =  cityService.getByProCode(proCode);
        return  R.ok(cityList);
    }

    @GetMapping("/area")
    @ApiOperation(value = "获取县/区")
    public R<List<AddressArea>> area(@RequestParam(defaultValue = "") String cityCode){
        List<AddressArea> areaList =  areaService.getByAreaCode(cityCode);
        return  R.ok(areaList);
    }



}
