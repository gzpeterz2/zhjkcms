package com.hc.cms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hc.cms.mapper.UserMapper;
import com.hc.cms.po.User;
import com.hc.cms.service.UserService;
/**
 * 用户模块Service层实现类
 * @author Administrator
 *
 */
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	//通过用户名和密码查询用户
	@Override
	public User selectOne(User user) {
		return userMapper.selectOne(user);
	}
	
	
	
}
