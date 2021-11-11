package com.whale.auth.filter;


import com.whale.base.util.StrUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

/**
 * 验证码过滤器
 *
 * @author maohua.lin
 * @create 2020-05-28 16:18
 */
@Component
@Data
@AllArgsConstructor
@Slf4j
public class CaptchaFilter extends OncePerRequestFilter {
    /**
     * redis验证码目录
     **/
    private final String REDIS_DIR = "captcha:";

    private RedisTemplate<String, Object> redisTemplate;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        log.info("访问路劲-->"+request.getServletPath());
        if (isLoginReq(request)) {
            if (validateCaptcha(request)) {
                filterChain.doFilter(request, response);
            } else {
                response.setStatus(428);
            }
        } else {
            filterChain.doFilter(request, response);
        }
    }

    /**
     * 验证验证码合法性
     *
     * @param request
     * @return
     */
    private boolean validateCaptcha(HttpServletRequest request) {
        //swagger 授权认证
        String verify = request.getParameter("verify");
        if(StrUtil.isNotBlank(verify) && "no".equals(verify)){
            return true;
        }

        String code = request.getParameter("code");
        String realKey = request.getParameter("realKey");
        if (StrUtil.isBlank(code) || StrUtil.isBlank(realKey)) {
            return false;
        }
        String redisKey = REDIS_DIR + realKey;
        Object obj = redisTemplate.opsForValue().get(redisKey);
        if (!Objects.isNull(obj)) {
            redisTemplate.delete(redisKey);
            return obj.toString().toLowerCase().equals(code.toLowerCase());
        }
        return false;

    }

    /**
     * 是否 login的POST请求
     *
     * @param request
     * @return
     */
    private boolean isLoginReq(HttpServletRequest request) {
        return "POST".equals(request.getMethod()) && "/oauth/token".equals(request.getServletPath());
    }
}
