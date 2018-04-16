package com.hc.cms.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hc.cms.po.Video;
import com.hc.cms.service.VideoService;

@Controller
public class VideoController {
	@Autowired
	private VideoService videoService;
	@RequestMapping("/addVideo")
	public String save(Model model,Video video,MultipartFile videopictrue) throws Exception{
		System.out.println(video);
		System.out.println(videopictrue);
		System.out.println(videopictrue.getOriginalFilename());
		
		String fileName = videopictrue.getOriginalFilename();
		if (fileName!=null &&!fileName.equals("")) {
			String newFileName=UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
			newFileName = newFileName.substring(0, 3) + "/" + newFileName;
			System.out.println(newFileName);
			File uploadPic = new File("d:/develop/upload/" + newFileName);
			if (!uploadPic.exists()) {
				uploadPic.mkdirs();
			}
			videopictrue.transferTo(uploadPic);
			video.setV_cover("pic/" + newFileName);
			videoService.addVideo(video);
			return "redirect:/pageweb.action";
		}
		
		return "error";
	}
	@RequestMapping("/deleteVideo")
	public String deleteVideo(Video video){
		if (video!=null&&video.getV_id()!=0) {
			videoService.deleteVideo(video);
			return "redirect:/pageweb.action";
		}
		return "error";
		
	}
}
