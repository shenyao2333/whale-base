package com.whale.security.entity;

import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * @author sy
 * @date 2020/3/10
 *
 * 扩展用户信息
 */
public class WhaleUser extends User {
	/**
	 * 用户ID
	 */
	@Getter
	private Integer id;
	/**
	 * 部门ID
	 */
	@Getter
	private Integer deptId;


	public WhaleUser(Integer id, Integer deptId, String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		this.id = id;
		this.deptId = deptId;
	}

	public boolean isAdmin() {
		return isAdmin(this.id);
	}

	public static boolean isAdmin(Integer id) {
		return id != null && 1 == id;
	}
}
