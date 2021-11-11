package com.whale.security.util;

import com.whale.base.constant.CommonConstants;
import com.whale.base.util.StrUtil;
import com.whale.security.entity.WhaleUser;
import lombok.experimental.UtilityClass;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author sy
 * @date 2020/3/10
 * @description 安全工具类
 */
@UtilityClass
public class SecurityUtil {

	/**
	 * 获取Authentication
	 */
	public Authentication getAuthentication() {
		return SecurityContextHolder.getContext().getAuthentication();
	}

	/**
	 * 获取用户
	 */
	public WhaleUser getUser() {
		Authentication authentication = getAuthentication();
		Object principal = authentication.getPrincipal();
		if (principal instanceof WhaleUser) {
			return (WhaleUser) principal;
		}
		return null;
	}

	/**
	 * 获取用户角色信息
	 *
	 * @return 角色集合
	 */
	public List<Integer> getRoles() {
		Authentication authentication = getAuthentication();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		List<Integer> roleIds = new ArrayList<>();
		authorities.stream()
				.filter(granted -> StrUtil.startWith(granted.getAuthority(), CommonConstants.ROLE))
				.forEach(granted -> {
					String id = StrUtil.removePrefix(granted.getAuthority(), CommonConstants.ROLE);
					roleIds.add(Integer.parseInt(id));
				});
		return roleIds;
	}

	public static void main(String[] args) {
		System.out.println(new BCryptPasswordEncoder().encode("123456"));
	}
}
