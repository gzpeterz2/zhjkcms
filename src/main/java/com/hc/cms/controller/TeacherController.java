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

import com.hc.cms.po.Teacher;
import com.hc.cms.service.TeacherService;
import com.hc.cms.util.UploadUtils;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
/**
 * 师资力量控制模块
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	private TeacherService teacherService;
	
	@Value("${TEACHER_PHOTOS_UPLOAD_PATH}")
	private String TEACHER_PHOTOS_UPLOAD_PATH;
	
	//分页查询
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Result<Teacher> selectByPage(QueryVo vo) throws Exception{
		Result<Teacher> result = teacherService.selectByPage(vo);
		return result;
	}
	
	//添加新学员记录
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,String> save(Teacher teacher,MultipartFile photos) throws Exception{
		//获取上传的文件名
		String filename = photos.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "photos/" + UploadUtils.getRandomName(filename);
				System.out.println(newFileName);
				System.out.println(TEACHER_PHOTOS_UPLOAD_PATH);
				File uploadPic = new File(TEACHER_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				photos.transferTo(uploadPic);
				teacher.setT_photos("/pic/" + newFileName);
				teacherService.save(teacher);
			}
		}
		Map<String,String> map=new HashMap<>();
		if(teacher.getT_id()==null){
			map.put("errorMsg", "添加学员失败!");
		}
		return map;
	}
	
	//更新学员信息
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,String> update(Teacher teacher,MultipartFile photos) throws Exception{
		String filename = photos.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "photos/" + UploadUtils.getRandomName(filename);
				System.out.println(newFileName);
				File uploadPic = new File(TEACHER_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				photos.transferTo(uploadPic);
				teacher.setT_photos("/pic/" + newFileName);
			}
		}
		teacherService.update(teacher,TEACHER_PHOTOS_UPLOAD_PATH);
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
		teacherService.delete(ids,TEACHER_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
	
	
}
