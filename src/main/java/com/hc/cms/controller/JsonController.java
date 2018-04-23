package com.hc.cms.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hc.cms.po.Banner;
import com.hc.cms.po.Succstudent;
import com.hc.cms.po.Video;
import com.hc.cms.po.InstDynamic;
import com.hc.cms.service.JsonService;

@Controller
@RequestMapping("/json")
public class JsonController {
	
	@Autowired
	private JsonService jsonService;
	
	@RequestMapping("/succstudent.action")
	public @ResponseBody List<Succstudent> succstudentList() throws Exception {
		List<Succstudent> list = jsonService.getSuccList();
		return list;
	}

	@RequestMapping("/homeBanner.action")
	public @ResponseBody List<Banner> getHomeBanner() throws Exception {
		List<Banner> list = jsonService.getHomeBanner();
		return list;
	}
	@RequestMapping("/instDynamic.action")
	public @ResponseBody List<InstDynamic> getDynamic() throws Exception {
		List<InstDynamic> list = jsonService.getInstDynamic();
		return list;
	}
	
	@RequestMapping("/findvideo.action")
	public @ResponseBody List<Video> getVideo()throws Exception {
		List<Video> list=jsonService.getVideo();
		return list;
	}
}

