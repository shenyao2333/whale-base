package com.whale.data.datasource;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author sy
 * @date 2020/2/1
 *
 * 参考DruidDataSourceWrapper
 */
@Data
@Component
@ConfigurationProperties("spring.datasource")
public class DruidDataSourceProperties {
	private String username;
	private String password;
	private String url;
	private String driverClassName;
}
