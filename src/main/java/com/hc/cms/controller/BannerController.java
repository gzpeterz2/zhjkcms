package com.hc.cms.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hc.cms.po.Banner;
import com.hc.cms.service.HomeService;
import com.hc.cms.util.UploadUtils;

@Controller
@RequestMapping("/home")
public class BannerController {

	@Autowired
	private HomeService homeService;
	@Value("${STUDENT_PHOTOS_UPLOAD_PATH}")
	private String STUDENT_PHOTOS_UPLOAD_PATH;

	@RequestMapping("/addBanner.action")
	@ResponseBody
	public Map<String,String> addBanner(Banner banner,MultipartFile srcName) throws Exception{
		//获取上传的文件名
		String filename = srcName.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = UploadUtils.getRandomName(filename);
				System.out.println(newFileName);
				System.out.println(STUDENT_PHOTOS_UPLOAD_PATH);
				File uploadPic = new File(STUDENT_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				srcName.transferTo(uploadPic);
				banner.setSrc("/pic/" + newFileName);
				homeService.addHomeBanner(banner);
			}
		}
		Map<String,String> map=new HashMap<>();
		if(banner.getId()==null){
			map.put("errorMsg", "添加轮播图失败!");
		}
		return map;
	}
	
	@RequestMapping("/updateBanner")
	@ResponseBody
	public Map<String,String> update(Banner banner,MultipartFile srcName) throws Exception{
		String filename = srcName.getOriginalFilename();
//		System.out.println(banner.getId());
		if (filename != null) {
			if (!filename.equals("")) {
				String filepath=STUDENT_PHOTOS_UPLOAD_PATH+banner.getSrc().substring(5);
				File file = new File(filepath);
				if(file.exists()){
					file.delete();
				}
				String newFileName = UploadUtils.getRandomName(filename);
				File uploadPic = new File(STUDENT_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				srcName.transferTo(uploadPic);
				banner.setSrc("/pic/" + newFileName);
			}
		}
		homeService.update(banner);
		Map<String,String> map=new HashMap<>();
		return map;
	}
	
	@RequestMapping("/deleteBanner.action")
	@ResponseBody
	public Map<String,String> delete(String delIds) throws Exception{
		String[] split = delIds.split(",");
		Integer[] ids=new Integer[split.length];
		for (int i = 0; i < split.length; i++) {
			ids[i]=Integer.parseInt(split[i]);
		}
		homeService.deleteByIds(ids,STUDENT_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
	
}
