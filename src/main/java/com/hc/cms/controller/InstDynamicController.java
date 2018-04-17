package com.hc.cms.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hc.cms.po.Banner;
import com.hc.cms.po.InstDynamic;
import com.hc.cms.service.InstDynamicService;
import com.hc.cms.util.UploadUtils;

@Controller
@RequestMapping("/instDynamic")
public class InstDynamicController {
	@Autowired
	private InstDynamicService instDynamicService;
	
	@RequestMapping("/addDynamic.action")
	public String addDynamic(Model model, InstDynamic instDynamic){
		System.out.println(instDynamic);
		int code = instDynamicService.addDynamic(instDynamic);
		if(code == 1){
			
			return "test";		
		}
		return "error";
	}
	@RequestMapping("/fileupload")
	public String fileUpload(Model model, MultipartFile pictureFile) throws Exception{
		
		System.out.println(pictureFile);
		System.out.println(pictureFile.getOriginalFilename());
		String filename = pictureFile.getOriginalFilename();
		if(filename != null){
			if(!filename.equals("")){
				//获取唯一文件名
				String uuidName = UploadUtils.getUUIDName(filename);
				File uploadPic = new File("d:/develop/upload/" + uuidName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				pictureFile.transferTo(uploadPic);
				
				return "";
			}
			
		}
		
		return "error";
		
	}
	@RequestMapping("/updateDynamic.action")
	public String updateDynamic(Model model, InstDynamic instDynamic){
		
		System.out.println(instDynamic);
		int code = instDynamicService.updateDynamic(instDynamic);
		if(code == 1){
			
			return "test";
		}
		return "error";
		
	}
	
	
}
