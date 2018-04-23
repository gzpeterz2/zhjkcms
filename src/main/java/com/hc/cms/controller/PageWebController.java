package com.hc.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 页面跳转控制模块
 * @author Administrator
 *
 */
@Controller
public class PageWebController {

	//跳转登录页面
	@RequestMapping("/index.action")
	public String toLogin(){
		return "login";
	}
	
	//跳转系统首页
	@RequestMapping("/home.action")
	public String homePage() throws Exception {
		return "web";
	}
	
	//进入轮播图管理页面
	@RequestMapping("/banner.action")
	public String banner() throws Exception {
		return "banner";
	}
	//进入学员就业信息管理页面
	@RequestMapping("/employment.action")
	public String toEmployment() throws Exception {
		return "employment";
	}
	//进入聊天记录管理页面
	@RequestMapping("/chatPrintscreen.action")
	public String toChatPrintscreen() throws Exception {
		return "chatPrintscreen";
	}
	//进入学员故事管理页面
	@RequestMapping("/studentstory.action")
	public String toStudentstory() throws Exception {
		return "studentstory";
	}
}
