package com.hc.cms.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hc.cms.po.Banner;
import com.hc.cms.service.HomeService;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	@RequestMapping("/addBanner")
	public String addBanner(Model model, Banner banner, MultipartFile pictureFile) throws Exception {
		System.out.println(banner);
		System.out.println(pictureFile);
		System.out.println(pictureFile.getOriginalFilename());

		String fileName = pictureFile.getOriginalFilename();
		if (fileName != null) {
			if (!fileName.equals("")) {
				String newFileName =
					UUID.randomUUID().toString() + fileName.
					substring(fileName.lastIndexOf("."));
				newFileName = newFileName.substring(0, 3) + "/" + newFileName;
				System.out.println(newFileName);
				File uploadPic = new File("d:/develop/upload/" + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				pictureFile.transferTo(uploadPic);
				banner.setSrc("/pic/" + newFileName);
				homeService.addHomeBanner(banner);
				return "redirect:/pageweb.action";
			}
		}
		return "error";
	}
	
	@RequestMapping("/deleteBanner.action")
	public String deleteDynamic(Model model,@RequestParam("imgid") Integer imgid) throws Exception{
		System.out.println(imgid);
		int code = homeService.deleteById(imgid);
		if(code == 1){
			
			return "redirect:/pageweb.action";		
		}
		return "error";
	}
}

