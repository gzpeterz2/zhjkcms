package com.hc.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 论坛设置模块Controller层
 * @author Administrator
 *
 */
@Controller
public class PageForumsController {

	@RequestMapping("/pageforums")
	public String toPage(){
		return "page_forums";
	}
	
}
