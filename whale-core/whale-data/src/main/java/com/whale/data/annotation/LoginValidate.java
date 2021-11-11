package com.whale.data.annotation;

import java.lang.annotation.*;

/**
 * @Author: sy
 * @Date: Created by 2021/7/29 17:45
 * @description:  登录校验
 */
@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface LoginValidate {
}
