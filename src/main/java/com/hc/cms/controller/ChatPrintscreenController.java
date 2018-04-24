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

import com.hc.cms.po.ChatPrintscreen;
import com.hc.cms.po.Succstudent;
import com.hc.cms.service.ChatPrintscreenService;
import com.hc.cms.util.UploadUtils;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
/**
 * 聊天截图管理Controller
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/chatPrintscreen")
public class ChatPrintscreenController {
	
	@Autowired
	private ChatPrintscreenService chatPrintscreenService;
	@Value("${STUDENT_PHOTOS_UPLOAD_PATH}")
	private String STUDENT_PHOTOS_UPLOAD_PATH;
	
	
	//分页查询
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Result selectByPage(QueryVo vo) throws Exception{
		Result<ChatPrintscreen> result = chatPrintscreenService.selectByPage(vo);
		return result;
	}
	
	//添加新学员记录
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,String> save(ChatPrintscreen cp,MultipartFile chatPic) throws Exception{
		//获取上传的文件名
		String filename = chatPic.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "chatPrintscreen/" + UploadUtils.getRandomName(filename);
				System.out.println(newFileName);
				System.out.println(STUDENT_PHOTOS_UPLOAD_PATH);
				File uploadPic = new File(STUDENT_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				chatPic.transferTo(uploadPic);
				cp.setC_src("/pic/" + newFileName);
				chatPrintscreenService.save(cp);
			}
		}
		Map<String,String> map=new HashMap<>();
		if(cp.getC_id()==null){
			map.put("errorMsg", "添加图片失败!");
		}
		return map;
	}
	
	//更新图片
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,String> update(ChatPrintscreen cp,MultipartFile photos) throws Exception{
		String filename = photos.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "chatPrintscreen/" + UploadUtils.getRandomName(filename);
				System.out.println(newFileName);
				File uploadPic = new File(STUDENT_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				photos.transferTo(uploadPic);
				cp.setC_src("/pic/" + newFileName);
			}
		}
		chatPrintscreenService.update(cp,STUDENT_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		return map;
	}
	
	//删除图片
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,String> delete(String delIds) throws Exception{
		String[] split = delIds.split(",");
		Integer[] ids=new Integer[split.length];
		for (int i = 0; i < split.length; i++) {
			ids[i]=Integer.parseInt(split[i]);
		}
		chatPrintscreenService.delete(ids,STUDENT_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
}
