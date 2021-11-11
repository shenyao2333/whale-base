package com.whale.security.exception;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Getter;
import org.springframework.security.oauth2.common.exceptions.OAuth2Exception;

/**
 * @author shenyao
 * @date 2018/7/8
 * 自定义OAuth2Exception
 */
@JsonSerialize(using = EntfrmAuth2ExceptionSerializer.class)
public class whaleAuth2Exception extends OAuth2Exception {
	@Getter
	private String errorCode;

	public whaleAuth2Exception(String msg) {
		super(msg);
	}

	public whaleAuth2Exception(String msg, String errorCode) {
		super(msg);
		this.errorCode = errorCode;
	}
}
