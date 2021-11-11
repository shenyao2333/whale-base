package com.whale.biz.quartz.util;


import com.whale.biz.quartz.entity.Job;
import com.whale.biz.quartz.exception.TaskException;

/**
 * 定时任务反射实现接口类
 *
 * @date 2019-06-28
 */
public interface ITaskInvok {

	/**
	 * 执行反射方法
	 *
	 * @param job 配置类
	 * @throws TaskException
	 */
	void invokMethod(Job job) throws TaskException;
}
