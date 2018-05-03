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

import com.hc.cms.po.Forum;
import com.hc.cms.po.StudentStory;
import com.hc.cms.service.ForumService;
import com.hc.cms.util.UploadUtils;
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
	
	//删除论坛文章
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
	//编辑论坛文章信息
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,String> update(Forum forum,MultipartFile coverpic){
		String filename = coverpic.getOriginalFilename();
		Map<String,String> map=new HashMap<>();
		try {
			if (filename != null) {
				if (!filename.equals("")) {
					String newFileName = "photos/" + UploadUtils.getRandomName(filename);
					File uploadPic = new File(FORUM_PHOTOS_UPLOAD_PATH + newFileName);
					if (!uploadPic.exists()) {
						uploadPic.mkdirs();
					}
					coverpic.transferTo(uploadPic);
					forum.setCover("/pic/" + newFileName);
				}
			}
			forumService.update(forum,FORUM_PHOTOS_UPLOAD_PATH);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", "1");
			return map;
		}
		map.put("success", null);
		return map;
	}
}
