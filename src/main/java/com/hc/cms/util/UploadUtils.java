package com.hc.cms.util;

import java.util.Random;
import java.util.UUID;

/**
 * 文件上传的工具类
 * 
 * @author Administrator
 */
public class UploadUtils {
	/**
	 * 传入文件的名称 ，返回唯一的名称 
	 * 例如：gril.jsp 返回 sds.jpg
	 * @return
	 */
	public static String getUUIDName(String fileName) {
		int index = fileName.lastIndexOf(".");
		String lastName = fileName.substring(index,fileName.length());
		System.out.println(fileName);
		//唯一的字符串
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid+lastName;
	}
	
	public static String getRandomName(String filename){
		//取扩展名
		String expanded_name = filename.substring(filename.lastIndexOf("."), filename.length());
		long millis=System.currentTimeMillis();
		Random random=new Random();
		int end=random.nextInt(999);
		//不足三位数前面补0
		String str=millis+String.format("%03d", end)+expanded_name;
		return str;
	}
	
	public static void main(String[] args) {
		System.out.println(getRandomName("girl.jsp"));
	}
}
