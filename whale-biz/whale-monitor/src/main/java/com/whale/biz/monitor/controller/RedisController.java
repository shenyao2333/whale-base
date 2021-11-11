package com.whale.biz.monitor.controller;

import com.whale.biz.monitor.service.RedisService;
import com.whale.base.api.R;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author shenyao
 * @date 2020-05-16
 * @description redis数据
 */
@RestController
@AllArgsConstructor
@RequestMapping("/monitor/redis")
public class RedisController {

    private final RedisService redisService;

    @GetMapping()
    public R getInfo() {
        return R.ok(redisService.getInfo());
    }
}
