package com.whale.data.aspect;


import cn.hutool.core.util.StrUtil;
import com.whale.base.exception.BaseException;
import com.whale.data.annotation.LoginValidate;
import com.whale.data.constant.StatusCodeConstants;
import com.whale.data.util.JwtTokenUtil;
import io.jsonwebtoken.Claims;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 操作日志使用spring event异步入库
 *
 * @author shenyao
 */
@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class LoginAspect {

    private final HttpServletRequest httpServletRequest;

    @Pointcut("@annotation(com.whale.data.annotation.LoginValidate)")
    public void logPointCut() {
    }

    @SneakyThrows
    @Around("@annotation(slog)")
    public Object doAround(ProceedingJoinPoint point, LoginValidate slog) {
        String token = JwtTokenUtil.resolveToken(httpServletRequest);

        if (StrUtil.isBlank(token)){
            throw new BaseException(StatusCodeConstants.AUTH_ERROR,"请先登录！");
        }
        Claims tokenBody = JwtTokenUtil.getTokenBody(token);
        String subject = tokenBody.getSubject();
        MethodSignature signature = (MethodSignature) point.getSignature();
        String[] parameterNames = signature.getParameterNames();
        Object[] args = point.getArgs();
        if (parameterNames!=null && parameterNames.length>0){
            for (int i = 0; i < parameterNames.length; i++) {
                if ("defUserId".equals(parameterNames[i])){
                    args[i]=Integer.parseInt(subject);
                    break;
                }
            }
        }
        return point.proceed(args);
    }




    private Boolean isExceed(Date expirationTime ){
        return expirationTime.before(new Date());
    }






}
