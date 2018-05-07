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
	@RequestMapping("/index")
	public String toLogin(){
		return "login";
	}
	
	//跳转系统首页
	@RequestMapping("/home")
	public String homePage() throws Exception {
		return "web";
	}
	
	//进入轮播图管理页面
	@RequestMapping("/banner")
	public String banner() throws Exception {
		return "banner";
	}
	
	//进入资讯管理页面
	@RequestMapping("/dynamic")
	public String dynamic() throws Exception {
		return "dynamic";
	}
	//进入学员就业信息管理页面
	@RequestMapping("/employment")
	public String toEmployment() throws Exception {
		return "employment";
	}
	//进入聊天记录管理页面
	@RequestMapping("/chatPrintscreen")
	public String toChatPrintscreen() throws Exception {
		return "chatPrintscreen";
	}
	//进入学员故事管理页面
	@RequestMapping("/studentstory")
	public String toStudentstory() throws Exception {
		return "studentstory";
	}
	//进入师资力量管理页面
	@RequestMapping("/teachers")
	public String toTeachers() throws Exception {
		return "teachers";
	}
	//进入论坛设置页面
	@RequestMapping("/forum")
	public String toForum() throws Exception {
		return "forum";
	}
	//进入企业介绍管理页面
	@RequestMapping("/company")
	public String toCompany() throws Exception {
		return "company";
	}
	//进入合作企业管理页面
	@RequestMapping("/cooperative")
	public String toCooperative() throws Exception {
		return "cooperative";
	}
	//进入大咖管理页面
	@RequestMapping("/master")
	public String toMaster() throws Exception {
		return "master";
	}
	//进入教学视频管理页面
	@RequestMapping("/video.action")
	public ModelAndView video() throws Exception {
		ModelAndView mv = new ModelAndView();
		// mv.addObject("homePage", homePage);
		mv.setViewName("video");
		
		return mv;
	}
	
	//进入论坛设置页面
	@RequestMapping("/environment.action")
	public String toEnvironment() throws Exception {
		return "environment";
	}
}
