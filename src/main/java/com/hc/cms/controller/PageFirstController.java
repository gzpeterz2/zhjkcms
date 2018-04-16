package com.hc.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageFirstController {

	//跳转后台管理首页
	@RequestMapping("/pagefirst.action")
	public String toPageFirst(){
		return "page_first";
	}
	
}
