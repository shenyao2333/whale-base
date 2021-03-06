package com.whale.base.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * RestTemplate
 *
 * @author sy
 * @date 2018/8/16
 */
@Configuration
public class RestTemplateConfig {


	@Bean
	public RestTemplate restTemplate() {

		SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
		requestFactory.setConnectTimeout(6000);
		requestFactory.setReadTimeout(6000);
		RestTemplate restTemplate = new RestTemplate(requestFactory);
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
		MappingJackson2HttpMessageConverter jacksonConverter = new MappingJackson2HttpMessageConverter(objectMapper);
		List<MediaType> mediaTypes = new ArrayList<>(jacksonConverter.getSupportedMediaTypes());
		// 将头为text_plain
		mediaTypes.add(MediaType.TEXT_PLAIN);
		mediaTypes.add(MediaType.TEXT_HTML);
		mediaTypes.add(MediaType.APPLICATION_FORM_URLENCODED);
		jacksonConverter.setSupportedMediaTypes(mediaTypes);
		restTemplate.setErrorHandler(setErrorHandler());
		restTemplate.getMessageConverters().add(jacksonConverter);
		return restTemplate;
	}


	/**
	 * 请求非200状态不抛异常
	 * @return
	 */
	public ResponseErrorHandler setErrorHandler(){
		return  new ResponseErrorHandler() {
			@Override
			public boolean hasError(ClientHttpResponse clientHttpResponse) throws IOException {
				return false;
			}

			@Override
			public void handleError(ClientHttpResponse clientHttpResponse) throws IOException {

			}
		};
	}
}
