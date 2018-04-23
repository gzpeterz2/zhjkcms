package com.hc.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class PageWebController {

	@RequestMapping("/home.action")
	public ModelAndView homePage() throws Exception {
		ModelAndView mv = new ModelAndView();
		// mv.addObject("homePage", homePage);
		mv.setViewName("web");
		
		return mv;
	}
	
	@RequestMapping("/banner.action")
	public ModelAndView banner() throws Exception {
		ModelAndView mv = new ModelAndView();
		// mv.addObject("homePage", homePage);
		mv.setViewName("banner");
		
		return mv;
	}
	
	@RequestMapping("/video.action")
	public ModelAndView video() throws Exception {
		ModelAndView mv = new ModelAndView();
		// mv.addObject("homePage", homePage);
		mv.setViewName("video");
		
		return mv;
	}
}
