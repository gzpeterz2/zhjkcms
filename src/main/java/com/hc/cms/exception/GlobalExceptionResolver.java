package com.hc.cms.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
/**
 * 全局异常处理
 * @author Administrator
 *
 */
public class GlobalExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest req, HttpServletResponse resp, Object arg2,
			Exception eq) {
		String msg="";
		if(eq instanceof MyException){
			msg = ((MyException)eq).getMessage();
		}else{
			msg = "系统异常，请稍后重试";
		}
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg",msg);
		mv.setViewName("error");
		return mv;
	}

}
