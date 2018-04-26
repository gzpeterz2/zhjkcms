package com.hc.cms.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.filefilter.DelegateFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hc.cms.po.Video;
import com.hc.cms.service.VideoService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

/**
 * 
 * @author HX
 *
 *         视频模块Controller
 */
@Controller
@RequestMapping("/video")
public class VideoController {
	@Autowired
	private VideoService videoService;
	@Value("${STUDENT_PHOTOS_UPLOAD_PATH}")
	private String STUDENT_PHOTOS_UPLOAD_PATH;

	@RequestMapping("/findByPage")
	@ResponseBody
	public Result findByPage(QueryVo vo) {
		Result<Video> ret = videoService.findByPage(vo);
		return ret;
	}


	@RequestMapping("/addVideo")
	@ResponseBody
	public String save(Model model, Video video, MultipartFile videopictrue) throws Exception {
		System.out.println(video);
		System.out.println(videopictrue);
		System.out.println(videopictrue.getOriginalFilename());

		String fileName = videopictrue.getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			String newFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
			newFileName = newFileName.substring(0, 3) + "/" + newFileName;
			System.out.println(newFileName);
			File uploadPic = new File(STUDENT_PHOTOS_UPLOAD_PATH + newFileName);
			if (!uploadPic.exists()) {
				uploadPic.mkdirs();
			}
			videopictrue.transferTo(uploadPic);
			video.setV_cover("pic/" + newFileName);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
			video.setV_date(date);
			videoService.addVideo(video);
			return "success";
		}

		return "error";
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteVideo(String delIds) {
		System.out.println(delIds);
		String[] split = delIds.split(",");
		Integer[] ids = new Integer[split.length];
		for (int i = 0; i < split.length; i++) {
			ids[i] = Integer.parseInt(split[i]);
		}
		videoService.delete(ids, STUDENT_PHOTOS_UPLOAD_PATH);
		Map<String, String> map = new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length + "");
		return map;

	}

	@RequestMapping("/findById")
	@ResponseBody
	public Video findById(String id) {
		Integer v_id = Integer.parseInt(id);
		Video video=videoService.findById(v_id);
		return video;

	}

	@RequestMapping("/update")
	@ResponseBody
	public String update(Video video, MultipartFile videopictrue) throws Exception {
		String fileName = videopictrue.getOriginalFilename();
		Video video2 = videoService.findById(video.getV_id());
		if (fileName != null && !fileName.equals("")) {
			//获取uuid文件名 并存放到指定目录
			String newFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
			newFileName = newFileName.substring(0, 3) + "/" + newFileName;
			System.out.println(newFileName);
			File uploadPic = new File(STUDENT_PHOTOS_UPLOAD_PATH + newFileName);
			if (!uploadPic.exists()) {
				uploadPic.mkdirs();
			}
			videopictrue.transferTo(uploadPic);
			video.setV_cover("pic/" + newFileName);
			//删除原图片
			String oldFile = video2.getV_cover();
			System.out.println(oldFile);
			String oldFileName = oldFile.substring(4);
			System.out.println(oldFileName);
			File olduploadPic = new File(STUDENT_PHOTOS_UPLOAD_PATH + oldFileName);
			if (olduploadPic.exists()&&olduploadPic.delete()) {
				
			}else{
				return "error";
			}
			videoService.update(video);
			
		}else{
			video.setV_cover(video2.getV_cover());
			videoService.update(video);
		}
		return "success";
	}
}
