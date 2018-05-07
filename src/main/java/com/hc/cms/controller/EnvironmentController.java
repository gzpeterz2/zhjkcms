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
import com.hc.cms.po.Enviroment;
import com.hc.cms.service.EnviromentService;
import com.hc.cms.service.HomeService;
import com.hc.cms.util.UploadUtils;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

@Controller
@RequestMapping("/environment")
public class EnvironmentController {

	@Autowired
	private EnviromentService environmentService;
	@Value("${STUDENT_PHOTOS_UPLOAD_PATH}")
	private String STUDENT_PHOTOS_UPLOAD_PATH;
	//分页查询
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Result selectByPage(QueryVo vo) throws Exception{
		Result<Enviroment> result = environmentService.selectByPage(vo);
		System.out.println(result.getRows());
		return result;
	}
	@RequestMapping("/add.action")
	@ResponseBody
	public Map<String,String> add(Enviroment environment,MultipartFile srcName) throws Exception{
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
				environment.setPic("/pic/" + newFileName);
				environmentService.add(environment);
			}
		}
		Map<String,String> map=new HashMap<>();
		if(environment.getId()==null){
			map.put("errorMsg", "添加失败!");
		}
		return map;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,String> update(Enviroment environment,MultipartFile srcName) throws Exception{
		String filename = srcName.getOriginalFilename();
//		System.out.println(banner.getId());
		if (filename != null) {
			if (!filename.equals("")) {
				String filepath=STUDENT_PHOTOS_UPLOAD_PATH+environment.getPic().substring(5);
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
				environment.setPic("/pic/" + newFileName);
			}
		}
		environmentService.update(environment,STUDENT_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		return map;
	}
	
	@RequestMapping("/delete.action")
	@ResponseBody
	public Map<String,String> delete(String delIds) throws Exception{
		String[] split = delIds.split(",");
		Integer[] ids=new Integer[split.length];
		for (int i = 0; i < split.length; i++) {
			ids[i]=Integer.parseInt(split[i]);
		}
		environmentService.deleteByIds(ids,STUDENT_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
	
}
