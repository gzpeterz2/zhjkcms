package com.hc.cms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hc.cms.po.User;
import com.hc.cms.service.UserService;

/**
 * 用户模块
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	//登录系统
	@RequestMapping("/login")
	public String toLogin(User user,HttpSession session) throws Exception{
		User existUser=userService.selectOne(user);
		if(existUser == null){
			session.setAttribute("msg", "用户名或密码错误");
			return "redirect:/index.action";
		}else{
			session.removeAttribute("msg");
			session.setAttribute("existUser", existUser);
			return "redirect:/home.action";
		}
	}
	
	//退出登录
	@RequestMapping("/exit")
	public String exit(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/index.action";
	}
}
