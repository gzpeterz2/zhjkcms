package com.hc.cms.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hc.cms.po.Banner;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@RequestMapping("/addBanner")
	public ModelAndView addBanner(Banner banner, MultipartFile pictureFile) throws Exception {
		System.out.println(banner);
		System.out.println(pictureFile);
		System.out.println(pictureFile.getOriginalFilename());
		ModelAndView mv = new ModelAndView();

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
				mv.setViewName("success");
				return mv;
			}
		}
		mv.setViewName("error");
		return mv;
	}
}
