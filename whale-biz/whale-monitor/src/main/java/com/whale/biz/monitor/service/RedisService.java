package com.whale.biz.monitor.service;

import java.util.Map;

/**
 * @author shenyao
 * @date 2020-05-16
 * @description redis 数据
 */
public interface RedisService {
	/**
	 * 获取内存信息
	 *
	 * @return
	 */
	Map<String, Object> getInfo();
}
