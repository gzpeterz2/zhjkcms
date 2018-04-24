package com.hc.cms.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	public Map<String,String> addDynamic(InstDynamic instDynamic) throws Exception{
		instDynamicService.addDynamic(instDynamic);
		Map<String,String> map=new HashMap<>();
		if(instDynamic.getArtId()==null){
			map.put("errorMsg", "添加资讯失败!");
		}
		return map;
	}
	
	@RequestMapping("/deleteDynamic.action")
	public String deleteDynamic(Model model, @RequestParam("instid") Integer instid) {
		System.out.println(instid);
		int code = instDynamicService.deleteById(instid);
		if (code == 1) {

			return "redirect:/pageweb.action";
		}
		return "error";
	}

	@RequestMapping("/fileupload.action")
	public @ResponseBody String uploads(HttpServletRequest request, @RequestParam("myFileName") MultipartFile file) {
		String url = null;
		try {
			// url = 只要能上传文件，并且返回文件在服务器上的相对路径即可。
			System.out.println(file);
			System.out.println(file.getOriginalFilename());
			String filename = file.getOriginalFilename();
			if (filename != null) {
				if (!filename.equals("")) {
					// 获取唯一文件名
					String uuidName = UploadUtils.getUUIDName(filename);
					String path = "d:/develop/upload/" + uuidName;
					File uploadPic = new File(path);
					if (!uploadPic.exists()) {
						uploadPic.mkdirs();
					}
					file.transferTo(uploadPic);

					url = path;
				}

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return request.getContextPath() + url;
	}

	@RequestMapping("/updateDynamic.action")
	public String updateDynamic(Model model, InstDynamic instDynamic) {

		System.out.println(instDynamic);
		int code = instDynamicService.updateDynamic(instDynamic);
		if (code == 1) {

			return "redirect:/pageweb.action";
		}
		return "error";

	}

}
