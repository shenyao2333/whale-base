package com.whale.data.datasource;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

/**
 * @author sy
 * @date 2020/2/1
 *
 * 根据当前线程来选择具体的数据源
 */
@Slf4j
@UtilityClass
public class DSContextHolder {

	private static final ThreadLocal<String> contextHolder = new ThreadLocal<>();

	/**
	 * 提供给AOP去设置当前的线程的数据源的信息
	 *
	 * @param dataSourceType
	 */
	public void setDSType(String dataSourceType) {
		log.info("切换到{}数据源", dataSourceType);
		contextHolder.set(dataSourceType);
	}

	/**
	 * 提供给AbstractRoutingDataSource的实现类，通过key选择数据源
	 *
	 * @return
	 */
	public Object getDSType() {
		return contextHolder.get();
	}

	/**
	 * 使用默认的数据源
	 *
	 */
	public void clearDSType() {
		contextHolder.remove();
	}
}
