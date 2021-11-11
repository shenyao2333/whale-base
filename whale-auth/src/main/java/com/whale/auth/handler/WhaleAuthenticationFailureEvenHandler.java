package com.whale.auth.handler;


import com.whale.auth.util.LoginLogUtil;
import com.whale.base.constant.SqlConstants;
import com.whale.security.handler.AbstractAuthenticationFailureEvenHandler;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.task.TaskExecutor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;

/**
 * @author entfrm
 * @date 2018/10/8
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class WhaleAuthenticationFailureEvenHandler extends AbstractAuthenticationFailureEvenHandler {


    @Resource
    @Qualifier("taskExecutor")
    private ExecutorService taskExecutor;
    private final JdbcTemplate jdbcTemplate;

    /**
     * 处理登录失败方法
     * <p>
     *
     * @param authenticationException 登录的authentication 对象
     * @param authentication          登录的authenticationException 对象
     * @param request                 请求
     * @param response                响应
     */
    @Override
    public void handle(AuthenticationException authenticationException, Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
        log.info("用户：{} 登录失败，异常：{}", authentication.getPrincipal(), authenticationException.getLocalizedMessage());
        PreparedStatementSetter pss = LoginLogUtil.setLoginLog(request, "0", authentication.getPrincipal().toString(),"登录失败，异常：" + authenticationException.getLocalizedMessage());
        CompletableFuture.runAsync(() -> {
            log.info("执行结果：" + jdbcTemplate.update(SqlConstants.LOGIN_LOG, pss));
        }, taskExecutor);

    }
}
