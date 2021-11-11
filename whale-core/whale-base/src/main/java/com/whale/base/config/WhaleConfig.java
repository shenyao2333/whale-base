package com.whale.base.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @Author: sy
 * @Date: Created by 2021-09-05-16:16
 * @description:
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "whale")
public class WhaleConfig {
    private String profile;
    private String lang;
}
