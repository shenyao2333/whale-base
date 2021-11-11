package com.whale.biz.quartz.util;

import com.alibaba.fastjson.JSONObject;
import com.whale.base.util.RestTemplateUtil;
import com.whale.biz.quartz.entity.Job;
import com.whale.biz.quartz.exception.TaskException;
import com.whale.base.api.R;
import com.whale.base.constant.CommonConstants;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

/**
 * 定时任务rest反射实现
 *
 * @date 2019-06-28
 */
@Slf4j
@Component("restTaskInvok")
@AllArgsConstructor
public class RestTaskInvok implements ITaskInvok {

	private final RestTemplateUtil restTemplateUtil;

	@Override
	public void invokMethod(Job job) throws TaskException {
		JSONObject jsonObject = restTemplateUtil.doGet(job.getExecutePath());
		log.info(job.getJobName() +"--->"+jsonObject);
	}
}
