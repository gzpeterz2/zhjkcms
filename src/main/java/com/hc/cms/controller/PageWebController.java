package com.hc.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class PageWebController {

	@RequestMapping("/pageweb.action")
	public ModelAndView homePage() throws Exception {
		ModelAndView mv = new ModelAndView();
		// mv.addObject("homePage", homePage);
		mv.setViewName("page_web");
		
		return mv;
	}
}
