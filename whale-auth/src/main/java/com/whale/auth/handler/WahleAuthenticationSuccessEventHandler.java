package com.whale.auth.handler;

import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;

import com.whale.auth.util.LoginLogUtil;
import com.whale.base.constant.SecurityConstants;
import com.whale.base.constant.SqlConstants;
import com.whale.security.entity.WhaleUser;
import com.whale.security.handler.AbstractAuthenticationSuccessEventHandler;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.task.TaskExecutor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;

/**
 * @author entfmr
 * @date 2018/10/8
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class WahleAuthenticationSuccessEventHandler extends AbstractAuthenticationSuccessEventHandler {


	@Resource
	@Qualifier("taskExecutor")
	private  ExecutorService taskExecutor;

	@Resource
	private JdbcTemplate jdbcTemplate;

	/**
	 * 处理登录成功方法
	 * <p>
	 * 获取到登录的authentication 对象
	 *
	 * @param authentication 登录对象
	 * @param request        请求
	 * @param response       返回
	 */
	@Override
	public void handle(Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
		WhaleUser whaleUser = (WhaleUser) authentication.getPrincipal();

		String url = URLUtil.getPath(request.getRequestURI());

		log.info("用户：{} 授权成功，url：{}", whaleUser.getUsername(), url);

		String loginType = "0"; // 0 登录 1退出
		if (StrUtil.containsAny(url, SecurityConstants.AUTH_TOKEN, SecurityConstants.TOKEN_LOGOUT)) {

			if(SecurityConstants.TOKEN_LOGOUT.equals(url)){
				loginType = "1";
			}

			PreparedStatementSetter pss = LoginLogUtil.setLoginLog(request, loginType, whaleUser.getUsername(), "");

			CompletableFuture.runAsync(() -> {
				log.info("执行结果：" + jdbcTemplate.update(SqlConstants.LOGIN_LOG, pss));
			}, taskExecutor);

		}
	}
}
