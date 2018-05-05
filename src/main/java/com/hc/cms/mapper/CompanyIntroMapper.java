package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.CompanyIntro;
import com.hc.cms.vo.QueryVo;

public interface CompanyIntroMapper {

	//添加新公司简介信息
	public void save(CompanyIntro companyIntro);
	//更新公司简介信息
	public void update(CompanyIntro companyIntro);
	//批量删除公司简介信息
	public void deleteByArr(Integer[] ids);
	//分页查询公司简介信息
	public List<CompanyIntro> selectByPage(QueryVo vo);
	//查询总记录数
	public long selectCount();
	//批量查询公司简介图片存放路径
	public List<String> selectByArr(Integer[] ids);
	//通过id查询公司简介信息
	public CompanyIntro selectById(Integer id);
	
}
