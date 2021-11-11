package com.whale.base.config;

import com.whale.base.util.SegmentLockUtil;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @Author: sy
 * @Date: Created by 2021/9/8 8:59
 * @description:
 */
@Component
public class SegmentLockConfig {


    @Bean
    public SegmentLockUtil segmentLock(){
        return new SegmentLockUtil(40,true);
    }


}
