package com.hc.cms.service;

import com.hc.cms.po.CompanyIntro;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

/**
 * 公司简介service接口
 * @author Administrator
 *
 */
public interface CompanyIntroService {

	//添加公司简介信息
	public void save(CompanyIntro companyIntro);
	
	//更新公司简介信息
	public void update(CompanyIntro st, String path);
	
	//批量删除公司简介信息
	public void delete(Integer[] ids, String path);
	
	//分页查询公司简介信息
	public Result<CompanyIntro> selectByPage(QueryVo vo);
}
