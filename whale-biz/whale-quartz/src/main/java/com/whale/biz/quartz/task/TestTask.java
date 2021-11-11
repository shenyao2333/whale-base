package com.whale.biz.quartz.task;

import com.whale.biz.quartz.enums.EntfrmQuartzEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * @Author: sy
 * @Date: Created by 2021/9/18 17:30
 * @description:
 */
@Slf4j
@Component("testTask")
public class TestTask {


    public void test(String para) {
        System.out.println("进来了"+para);
    }
}
