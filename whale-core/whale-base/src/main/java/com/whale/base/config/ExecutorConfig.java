package com.whale.base.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import java.util.concurrent.*;

/**
 * @author sy
 * @date: 2021/2/5 10:01
 * @description
 */


@Slf4j
@Component
public class ExecutorConfig {


    /**
     * 参数说明：
     * 1、核心线程
     * 2、最大线程
     * 3、超出核心数的线程的保留时间
     * 4、时间单位
     * 5、列队中的任务大小无上限，可提交多个任务进行等待
     * 6、拒绝策略，由调用者当前的线程去执行
     * @return
     */
    @Primary
    @Bean(name = "taskExecutor")
    public static ExecutorService taskExecutor() {
        return new ThreadPoolExecutor(10, 50,
                60, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<>(80),  new ThreadPoolExecutor.CallerRunsPolicy());
    }







}
