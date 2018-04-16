package com.hc.cms.mapper;

import com.hc.cms.po.User;

/**
 * 用户模块Dao层
 * @author Administrator
 *
 */
public interface UserMapper {
	
	//通过用户名和密码查询用户
	public User selectOne(User user);
	
}
