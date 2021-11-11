package com.whale.auth.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Set;

/**
 * @author sy
 * @date 2020/3/10
 * @description 用户信息
 */
@Data
public class SysUser implements Serializable {
    /**
     * 主键ID
     */
    private Integer id;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 昵称
     */
    private String nickName;
    /**
     * 密码
     */
    private String password;
    /**
     * 机构编号
     */
    private Integer deptId;
    /**
     * 状态
     */
    private String status;

    /**
     * 权限列表
     */
    private Set<String> permsList;

    private Set<Integer> roleIdList;

    public boolean isAdmin() {
        return isAdmin(this.id);
    }




    public static boolean isAdmin(Integer id) {
        return id != null && 1 == id;
    }
}
