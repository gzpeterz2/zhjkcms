package com.hc.cms.service;

import com.hc.cms.po.User;

/**
 * 用户模块Service层接口
 * @author Administrator
 *
 */

public interface UserService {
	//通过用户名和密码查询用户
	User selectOne(User user);

}
