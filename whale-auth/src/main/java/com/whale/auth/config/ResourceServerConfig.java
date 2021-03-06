package com.whale.auth.config;

import com.whale.auth.filter.CaptchaFilter;
import com.whale.auth.handler.WhaleAuthenticationEntryPoint;
import com.whale.base.config.GlobalConfig;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.error.OAuth2AuthenticationEntryPoint;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author sy
 * @date 2020/3/10
 * @description 资源服务器配置
 */
@Configuration
@EnableResourceServer
@AllArgsConstructor
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class ResourceServerConfig extends ResourceServerConfigurerAdapter implements WebMvcConfigurer {

    private final RedisTemplate<String, Object> redisTemplate;
    private final WhaleAuthenticationEntryPoint whaleAuthenticationEntryPoint;


    @Override
    @SneakyThrows
    public void configure(HttpSecurity http) {
        http
            // CRSF禁用，因为不使用session
            .csrf().disable()
            .authorizeRequests()
            .antMatchers(
                    "/oauth/**", "/common/**", "/cms/article/doc/**", "/activiti/service/**", "/activiti/task/track/**", "/captcha/**",
                    "/toolkit/dataset/api/**", "/activiti/process/resource", "/activiti/IInitiatedProcess/tracking", "/actuator/**").permitAll()
            .anyRequest().authenticated()
            .and().addFilterBefore(new CaptchaFilter(redisTemplate), UsernamePasswordAuthenticationFilter.class);
        //让X-frame-options失效,去除iframe限制
        http.headers().frameOptions().disable();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        /** 本地文件上传路径 */
        registry.addResourceHandler("/profile/**").addResourceLocations("file:" + GlobalConfig.getProfile() + "/");
    }

    @Override
    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
        resources.authenticationEntryPoint(whaleAuthenticationEntryPoint);
        super.configure(resources);
    }

}

