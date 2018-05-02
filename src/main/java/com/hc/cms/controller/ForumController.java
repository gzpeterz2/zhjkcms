package com.hc.cms.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hc.cms.po.Forum;
import com.hc.cms.service.ForumService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
/**
 * 论坛设置
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/forum")
public class ForumController {
	
	@Autowired
	private ForumService forumService;
	@Value("${FORUM_PHOTOS_UPLOAD_PATH}")
	private String FORUM_PHOTOS_UPLOAD_PATH;
	
	//分页查询
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Result<Forum> selectByPage(QueryVo vo) throws Exception{
		Result<Forum> result = forumService.selectByPage(vo);
		return result;
	}
	
	//删除学员信息
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,String> delete(String delIds) throws Exception{
		String[] split = delIds.split(",");
		Integer[] ids=new Integer[split.length];
		for (int i = 0; i < split.length; i++) {
			ids[i]=Integer.parseInt(split[i]);
		}
		forumService.delete(ids,FORUM_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
	
}
