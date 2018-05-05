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

import com.hc.cms.po.Succstudent;
import com.hc.cms.service.SuccstudentService;
import com.hc.cms.util.UploadUtils;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

/**
 * 学员信息管理Controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/succstudent")
public class SuccstudentController {

	@Autowired
	private SuccstudentService succstudentService;
	@Value("${STUDENT_PHOTOS_UPLOAD_PATH}")
	private String STUDENT_PHOTOS_UPLOAD_PATH;
	
	//分页查询
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Result<Succstudent> selectByPage(QueryVo vo) throws Exception{
		Result<Succstudent> result = succstudentService.selectByPage(vo);
		return result;
	}
	
	//添加新学员记录
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,String> save(Succstudent st,MultipartFile photos) throws Exception{
		//获取上传的文件名
		String filename = photos.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "succstudent/" + UploadUtils.getRandomName(filename);
				File uploadPic = new File(STUDENT_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				photos.transferTo(uploadPic);
				st.setPhotos_src("/pic/" + newFileName);
				succstudentService.save(st);
			}
		}
		Map<String,String> map=new HashMap<>();
		if(st.getId()==null){
			map.put("errorMsg", "添加学员失败!");
		}
		return map;
	}
	
	//更新学员信息
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,String> update(Succstudent st,MultipartFile photos) throws Exception{
		String filename = photos.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "succstudent/" + UploadUtils.getRandomName(filename);
				File uploadPic = new File(STUDENT_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				photos.transferTo(uploadPic);
				st.setPhotos_src("/pic/" + newFileName);
			}
		}
		succstudentService.update(st,STUDENT_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		return map;
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
		succstudentService.delete(ids,STUDENT_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
}
