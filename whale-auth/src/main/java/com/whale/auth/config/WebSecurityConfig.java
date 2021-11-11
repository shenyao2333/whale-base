package com.whale.auth.config;


import com.whale.auth.service.impl.WhaleUserDetailServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @author sy
 * @date 2020/3/10
 * @description 认证相关配置
 */
@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final WhaleUserDetailServiceImpl userDetailService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailService).passwordEncoder(passwordEncoder());
    }

    /***设置不拦截规则*/
    @Override
    public void configure(WebSecurity web) {
        web.ignoring().antMatchers("/static/**", "/druid/**", "/ip2region/**",
                "/processes", "/profile/**", "/stencilset.json"
                , "/editor-app/**", "/modeler.html", "/favicon.ico","/api/**",
                "/swagger-ui.html", "/doc.html", "/webjars/**", "/v2/**", "/swagger-resources/**",
                "/camunda/**");
    }
}
