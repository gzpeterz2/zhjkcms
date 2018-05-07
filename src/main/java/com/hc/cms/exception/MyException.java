package com.hc.cms.exception;
/**
 * 自定义异常类
 * @author Administrator
 *
 */
public class MyException extends Exception{

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
