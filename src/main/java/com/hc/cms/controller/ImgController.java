package com.hc.cms.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hc.cms.utils.UploadUtils;

@Controller
@RequestMapping("/img")
public class ImgController {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping(value = "/upload.action", method = RequestMethod.POST)
	@ResponseBody
	public Object UpLoadImg(@RequestParam(value = "myFileName") MultipartFile mf) {
		String filename = mf.getOriginalFilename();
		String realPath = request.getSession().getServletContext().getRealPath("img");
		
		 String url = null;
	        try {
	            //url = 只要能上传文件，并且返回文件在服务器上的相对路径即可。
	    		if(filename != null){
	    			if(!filename.equals("")){
	    				//获取唯一文件名
	    				String uuidName = UploadUtils.getUUIDName(filename);
	    				
	    				String path = "d:/develop/upload/";
	    				File pic = new File(path);
	    				if (!pic.exists()) {
	    					pic.mkdirs();
	    				}
	    				
	    				File uploadPic = new File(realPath,uuidName);
	    				mf.transferTo(uploadPic);
	    				url = uuidName;
	    				
	    				
	    				
	    				File p = new File(realPath);
	    				System.out.println("---------"+p.listFiles()+"=========");
	    				FileUtils.copyDirectory(p, pic);
	    			}
	    			
	    		}
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	
		
//		// 获取源文件
//		String[] names = filename.split("\\.");//
//		String tempNum = (int) (Math.random() * 100000) + "";
//		String uploadFileName = tempNum + System.currentTimeMillis() + "." + names[names.length - 1];
//		System.out.println(uploadFileName+"uploadFileName");
		//File targetFile = new File(realPath, url);// 目标文件

		// 开始从源文件拷贝到目标文件

		
		// 传图片一步到位
//		try {
//			mf.transferTo(targetFile);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("data", "http://localhost:8080/zhjkcms/img/" + url);// 这里应该是项目路径
//		map.put("data", "d:/develop/upload/" + url);// 这里应该是项目路径
		return map;// 将图片地址返回
	}
}