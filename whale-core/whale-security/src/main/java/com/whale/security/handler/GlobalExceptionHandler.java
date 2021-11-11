package com.whale.security.handler;

import com.whale.base.api.R;
import com.whale.base.exception.BaseException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.SpringSecurityMessageSource;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author sy
 * @date
 * 全局异常处理器
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 全局异常.
     *
     * @param e the e
     * @return R
     */
    @ExceptionHandler(Exception.class)
    public R handleGlobalException(Exception e) {
        log.error("全局异常信息 ex={}", e.getMessage(), e);
        return R.error(e.getLocalizedMessage());
    }

    /**
     * AccessDeniedException
     *
     * @param e the e
     * @return R
     */
    @ExceptionHandler(AccessDeniedException.class)
    public R handleAccessDeniedException(AccessDeniedException e) {
        String msg = SpringSecurityMessageSource.getAccessor()
                .getMessage("AbstractAccessDecisionManager.accessDenied"
                        , e.getMessage());
        log.error("拒绝授权异常信息 ex={}", msg, e);
        return R.error(e.getLocalizedMessage());
    }



    @ExceptionHandler(BaseException.class)
    public R baseException(BaseException e) {
        return R.error(e.getCode(),e.getMessage());
    }


    /**
     * validation Exception
     *
     * @param exception
     * @return R
     */
    @ExceptionHandler({MethodArgumentNotValidException.class, BindException.class})
    public R handleBodyValidException(MethodArgumentNotValidException exception) {
        List<FieldError> fieldErrors = exception.getBindingResult().getFieldErrors();
        log.error("参数绑定异常信息 ex = {}", fieldErrors.get(0).getDefaultMessage());
        return R.error(fieldErrors.get(0).getDefaultMessage());
    }

    @ExceptionHandler(value = {MissingServletRequestParameterException.class})
    public <T> R serviceException(MissingServletRequestParameterException ex){
        return R.error(ex.getParameterName()+"不能为空！");
    }


    /**
     * 请求方式错误
     * @param ex
     * @return
     */
    @ExceptionHandler(value = {HttpRequestMethodNotSupportedException.class})
    public R serviceException(HttpRequestMethodNotSupportedException ex, HttpServletRequest request) {
        return R.error("请求方式错误！不能使用"+ request.getMethod());
    }


}
