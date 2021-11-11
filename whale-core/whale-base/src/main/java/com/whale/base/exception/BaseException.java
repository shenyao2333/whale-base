package com.whale.base.exception;

import cn.hutool.core.util.StrUtil;
import com.whale.base.util.MessageUtil;

/**
 * @description 自定义异常
 */
public class BaseException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    /**
     * 错误码
     */
    private Integer code=500;

    /**
     * 错误消息
     */
    private String msg;

    /**
     * 错误码对应的参数
     */
    private String[] params;


    public BaseException(Integer code, String msg, String[] params) {
        this.code = code;
        this.msg = msg;
        this.params = params;
    }



    public BaseException(Integer code, String msg) {
        this(code, msg, null);
    }

    public BaseException(String msg) {
        this(-1, msg, null);
    }

    @Override
    public String getMessage() {
        return this.msg;
    }

    public Integer getCode() {
        return code;
    }

    public Object[] getParams() {
        return params;
    }

    public String setMessage() {
        return msg;
    }
}
