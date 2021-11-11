package com.whale.auth.handler;

import com.whale.base.api.R;
import com.whale.base.exception.BaseException;
import com.whale.security.exception.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.common.DefaultThrowableAnalyzer;
import org.springframework.security.oauth2.common.exceptions.*;
import org.springframework.security.oauth2.provider.error.DefaultWebResponseExceptionTranslator;
import org.springframework.security.oauth2.provider.error.WebResponseExceptionTranslator;
import org.springframework.security.web.util.ThrowableAnalyzer;

/**
 * @date 2018/7/8
 * 异常处理,重写oauth 默认实现
 */
@Slf4j
public class WhaleWebResponseExceptionTranslator   implements WebResponseExceptionTranslator {


    @Override
    public ResponseEntity translate(Exception e) {
        if (e instanceof BaseException){
            return ResponseEntity.ok(R.error(3001, e.getMessage()));
        }else if (e instanceof InvalidGrantException) {
            return ResponseEntity.ok(R.error(3001, "密码错误！"));
        } else if (e instanceof UsernameNotFoundException) {
            return ResponseEntity.ok(R.error(3002, e.getMessage()));
        } else if (e instanceof UnsupportedGrantTypeException) {
            return ResponseEntity.ok(R.error(3003, "不支持该认证方式！"));
        } else if (e instanceof InvalidScopeException) {
            return ResponseEntity.ok(R.error(3004, "授权范围错误"));
        } else if (e instanceof InternalAuthenticationServiceException) {
            return ResponseEntity.ok(R.error(3001, "账号不存在！"));
        } else if (e instanceof InvalidTokenException) {
            return ResponseEntity.ok(R.error(3004, "token失效！"));
        }
        return ResponseEntity.ok(R.error(2003, "登陆错误!"));

    }

}

