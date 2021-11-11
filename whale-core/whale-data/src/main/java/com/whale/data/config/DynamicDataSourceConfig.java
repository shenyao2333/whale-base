package com.whale.data.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.whale.data.constant.DataSourceConstants;
import com.whale.data.datasource.DSContextHolder;
import com.whale.data.datasource.DruidDataSourceProperties;
import com.whale.data.datasource.DynamicDataSource;
import com.zaxxer.hikari.HikariDataSource;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * @author shenyao
 * @date 2019-03-31
 *
 * 动态数据源切换配置
 */
@Slf4j
@Configuration
@AllArgsConstructor
public class DynamicDataSourceConfig {
	private final Map<Object, Object> dataSourceMap = new HashMap<>(8);
	private final DruidDataSourceProperties dataSourceProperties;

	@Bean("dynamicDataSource")
	public DynamicDataSource dataSource() {

		HikariDataSource dds = new HikariDataSource();
		dds.setJdbcUrl(dataSourceProperties.getUrl());
		dds.setDriverClassName(dataSourceProperties.getDriverClassName());
		dds.setUsername(dataSourceProperties.getUsername());
		dds.setPassword(dataSourceProperties.getPassword());

		dataSourceMap.put(0, dds);
		return new DynamicDataSource(dds,dataSourceMap);

	}

	/**
	 * 组装默认配置的数据源，查询数据库配置
	 */
	@PostConstruct
	public void init() {
		DriverManagerDataSource dds = new DriverManagerDataSource();
		dds.setUrl(dataSourceProperties.getUrl());
		dds.setDriverClassName(dataSourceProperties.getDriverClassName());
		dds.setUsername(dataSourceProperties.getUsername());
		dds.setPassword(dataSourceProperties.getPassword());

		List<Map<String, Object>> dbList = new JdbcTemplate(dds).queryForList(DataSourceConstants.DS_QUERY_SQL);
		log.info("开始 -> 初始化动态数据源");
		Optional.of(dbList).ifPresent(list -> list.forEach(db -> {
			log.info("数据源:{} ，标识：{}", db.get(DataSourceConstants.DS_NAME) ,db.get(DataSourceConstants.DS_ALIAS) );
			HikariDataSource ds = new HikariDataSource();
			ds.setJdbcUrl(String.valueOf(db.get(DataSourceConstants.DS_JDBC_URL)));
			ds.setDriverClassName(String.valueOf(db.get(DataSourceConstants.DS_JDBC_DRIVER)));
			ds.setUsername((String) db.get(DataSourceConstants.DS_USER_NAME));
			String decPwd = (String) db.get(DataSourceConstants.DS_USER_PWD);
			ds.setPassword(decPwd);
			dataSourceMap.put(db.get(DataSourceConstants.DS_ALIAS), ds);
		}));
		log.info("完毕 -> 初始化动态数据源,共计 {} 条", dataSourceMap.size());
	}

	/**
	 * 重新加载数据源配置
	 */
	public Boolean reload() {
		this.init();
		this.dataSource();
		return Boolean.FALSE;
	}

}
