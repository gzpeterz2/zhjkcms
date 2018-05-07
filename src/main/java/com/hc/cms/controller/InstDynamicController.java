package com.hc.cms.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hc.cms.po.InstDynamic;
import com.hc.cms.service.InstDynamicService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

@Controller
@RequestMapping("/instDynamic")
public class InstDynamicController {
	@Autowired
	private InstDynamicService instDynamicService;
	//分页查询
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Result selectByPage(QueryVo vo) throws Exception{
		Result<InstDynamic> result = instDynamicService.selectByPage(vo);
		return result;
	}
	@RequestMapping("/addDynamic.action")
	@ResponseBody
	public Map<String,String> addDynamic(InstDynamic instDynamic) throws Exception{
		instDynamicService.addDynamic(instDynamic);
		Map<String,String> map=new HashMap<>();
		if(instDynamic.getArt_id()==null){
			map.put("errorMsg", "添加资讯失败!");
		}
		return map;
	}

	@RequestMapping("/updateDynamic.action")
	@ResponseBody
	public Map<String,String> updateDynamic(InstDynamic instDynamic) throws Exception {
		
		System.out.println(instDynamic);
		instDynamicService.updateDynamic(instDynamic);
	
		Map<String,String> map=new HashMap<>();
		
		return map;		
	}
	
	@RequestMapping("/deleteDynamic.action")
	@ResponseBody
	public Map<String,String> deleteDynamic(String delIds) throws Exception{
		//System.out.println(delIds);
		String[] split = delIds.split(",");
		Integer[] ids=new Integer[split.length];
		for (int i = 0; i < split.length; i++) {
			ids[i]=Integer.parseInt(split[i]);
		}
		instDynamicService.deleteByIds(ids);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
	

}
