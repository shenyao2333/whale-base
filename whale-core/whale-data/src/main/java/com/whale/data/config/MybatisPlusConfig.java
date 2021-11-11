package com.whale.data.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author sy
 * @date 2020/2/1
 *
 * @description mybatisplus配置
 */
@Configuration
@MapperScan("com.whale.**.mapper")
public class MybatisPlusConfig {


	/**
	 * 分页插件
	 *
	 * @return PaginationInterceptor
	 */
	@Bean
	@ConditionalOnMissingBean
	public PaginationInterceptor paginationInterceptor() {
		return new PaginationInterceptor();
	}

	/**
	 * 数据权限插件
	 *
	 * @param dataSource 数据源
	 * @return DataScopeInterceptor
	 */
//	@Bean
//	@ConditionalOnMissingBean
//	public DataScopeInterceptor dataScopeInterceptor(DataSource dataSource) {
//		return new DataScopeInterceptor(dataSource);
//	}

}
