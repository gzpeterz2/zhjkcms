package com.hc.cms.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hc.cms.po.StudentStory;
import com.hc.cms.service.StudentStoryService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

@Controller
@RequestMapping("/story")
public class StudentStoryController {

	@Autowired
	private StudentStoryService studentStoryService;
	
	//分页查询学员故事
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Result<StudentStory> selectByPage(QueryVo vo) throws Exception{
		Result<StudentStory> result = studentStoryService.selectByPage(vo);
		return result;
	}
	
	//添加或更新学员故事
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,String> update(StudentStory studentStory){
		Map<String,String> map=new HashMap<>();
		try {
			studentStoryService.update(studentStory);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "1");
			return map;
		}
		map.put("success", null);
		return map;
	}
	
}
