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

import com.hc.cms.po.CompanyIntro;
import com.hc.cms.po.Cooperative;
import com.hc.cms.po.Master;
import com.hc.cms.service.CompanyIntroService;
import com.hc.cms.service.CooperativeService;
import com.hc.cms.service.MasterService;
import com.hc.cms.util.UploadUtils;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
/**
 * 关于我们 模块Controller
 * @author Administrator
 *
 */
@Controller
public class AboutUs {

	@Autowired
	private CompanyIntroService companyIntroService;
	
	@Value("${COMPANY_PIC_UPLOAD_PATH}")
	private String COMPANY_PIC_UPLOAD_PATH;
	
	@Autowired
	private CooperativeService cooperativeService;
	
	@Value("${COOPERATIVE_LOGO_UPLOAD_PATH}")
	private String COOPERATIVE_LOGO_UPLOAD_PATH;
	
	@Autowired
	private MasterService masterService;
	
	@Value("${MASTER_PHOTOS_UPLOAD_PATH}")
	private String MASTER_PHOTOS_UPLOAD_PATH;
	
	/**
	 * 企业简介
	 */
	//分页查询公司简介信息
	@RequestMapping("/companyIntro/selectByPage")
	@ResponseBody
	public Result<CompanyIntro> selectByPage(QueryVo vo) throws Exception{
		Result<CompanyIntro> result = companyIntroService.selectByPage(vo);
		return result;
	}
	
	//添加公司简介信息
	@RequestMapping("/companyIntro/save")
	@ResponseBody
	public Map<String,String> saveCompanyIntro(CompanyIntro companyIntro,MultipartFile picture) throws Exception{
		//获取上传的文件名
		String filename = picture.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "companyIntro/" + UploadUtils.getRandomName(filename);
				File uploadPic = new File(COMPANY_PIC_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				picture.transferTo(uploadPic);
				companyIntro.setC_pic("/pic/" + newFileName);
				companyIntroService.save(companyIntro);
			}
		}
		Map<String,String> map=new HashMap<>();
		if(companyIntro.getC_id()==null){
			map.put("errorMsg", "添加失败!");
		}
		return map;
	}
	
	//更新公司简介信息
	@RequestMapping("/companyIntro/update")
	@ResponseBody 
	public Map<String,String> updateCompanyIntro(CompanyIntro companyIntro,MultipartFile picture) throws Exception{
		String filename = picture.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "companyIntro/" + UploadUtils.getRandomName(filename);
				File uploadPic = new File(COMPANY_PIC_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				picture.transferTo(uploadPic);
				companyIntro.setC_pic("/pic/" + newFileName);
			}
		}
		companyIntroService.update(companyIntro,COMPANY_PIC_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		return map;
	}
	
	//删除公司简介信息
	@RequestMapping("/companyIntro/delete")
	@ResponseBody
	public Map<String,String> deleteCompanyIntro(String delIds) throws Exception{
		String[] split = delIds.split(",");
		Integer[] ids=new Integer[split.length];
		for (int i = 0; i < split.length; i++) {
			ids[i]=Integer.parseInt(split[i]);
		}
		companyIntroService.delete(ids,COMPANY_PIC_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
	
	/**
	 * 合作企业
	 */
	//分页查询合作企业
	@RequestMapping("/cooperative/selectByPage")
	@ResponseBody
	public Result<Cooperative> selectByPageCooperative(QueryVo vo) throws Exception{
		Result<Cooperative> result = cooperativeService.selectByPage(vo);
		return result;
	}
	
	//添加合作企业
	@RequestMapping("/cooperative/save")
	@ResponseBody
	public Map<String,String> saveCooperative(Cooperative cooperative,MultipartFile logo) throws Exception{
		//获取上传的文件名
		String filename = logo.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "cooperative/" + UploadUtils.getRandomName(filename);
				File uploadPic = new File(COOPERATIVE_LOGO_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				logo.transferTo(uploadPic);
				cooperative.setC_logo("/pic/" + newFileName);
				cooperativeService.save(cooperative);
			}
		}
		Map<String,String> map=new HashMap<>();
		if(cooperative.getC_id()==null){
			map.put("errorMsg", "添加失败!");
		}
		return map;
	}
	
	//更新公司简介信息
	@RequestMapping("/cooperative/update")
	@ResponseBody 
	public Map<String,String> updateCooperative(Cooperative cooperative,MultipartFile logo) throws Exception{
		String filename = logo.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "cooperative/" + UploadUtils.getRandomName(filename);
				File uploadPic = new File(COOPERATIVE_LOGO_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				logo.transferTo(uploadPic);
				cooperative.setC_logo("/pic/" + newFileName);
			}
		}
		cooperativeService.update(cooperative,COOPERATIVE_LOGO_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		return map;
	}
	
	//删除公司简介信息
	@RequestMapping("/cooperative/delete")
	@ResponseBody
	public Map<String,String> deleteCooperative(String delIds) throws Exception{
		String[] split = delIds.split(",");
		Integer[] ids=new Integer[split.length];
		for (int i = 0; i < split.length; i++) {
			ids[i]=Integer.parseInt(split[i]);
		}
		cooperativeService.delete(ids,COOPERATIVE_LOGO_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
	/**
	 * 大咖简介
	 */
	//分页查询大咖信息
	@RequestMapping("/master/selectByPage")
	@ResponseBody
	public Result<Master> selectByPageMaster(QueryVo vo) throws Exception{
		Result<Master> result = masterService.selectByPage(vo);
		return result;
	}
	
	//添加大咖
	@RequestMapping("/master/save")
	@ResponseBody
	public Map<String,String> saveMaster(Master master,MultipartFile photos) throws Exception{
		//获取上传的文件名
		String filename = photos.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "master/" + UploadUtils.getRandomName(filename);
				File uploadPic = new File(MASTER_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				photos.transferTo(uploadPic);
				master.setM_photos("/pic/" + newFileName);
				masterService.save(master);
			}
		}
		Map<String,String> map=new HashMap<>();
		if(master.getM_id()==null){
			map.put("errorMsg", "添加失败!");
		}
		return map;
	}
	
	//更新大咖信息
	@RequestMapping("/master/update")
	@ResponseBody 
	public Map<String,String> updateMaster(Master master,MultipartFile photos) throws Exception{
		String filename = photos.getOriginalFilename();
		if (filename != null) {
			if (!filename.equals("")) {
				String newFileName = "master/" + UploadUtils.getRandomName(filename);
				File uploadPic = new File(MASTER_PHOTOS_UPLOAD_PATH + newFileName);
				if (!uploadPic.exists()) {
					uploadPic.mkdirs();
				}
				photos.transferTo(uploadPic);
				master.setM_photos("/pic/" + newFileName);
			}
		}
		masterService.update(master,MASTER_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		return map;
	}
	
	//删除大咖信息
	@RequestMapping("/master/delete")
	@ResponseBody
	public Map<String,String> deleteMaster(String delIds) throws Exception{
		String[] split = delIds.split(",");
		Integer[] ids=new Integer[split.length];
		for (int i = 0; i < split.length; i++) {
			ids[i]=Integer.parseInt(split[i]);
		}
		masterService.delete(ids,MASTER_PHOTOS_UPLOAD_PATH);
		Map<String,String> map=new HashMap<>();
		map.put("success", "true");
		map.put("delNums", ids.length+"");
		return map;
	}
}
