package com.whale.biz.system.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author shenyao
 * @date 2020/5/24
 * @description
 */
@Data
public class UserVo implements Serializable {

    /**
     * 用户ID
     */
    private Integer id;

    /**
     * 昵称
     */
    private String nickName;
}

