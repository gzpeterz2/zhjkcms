package com.hc.cms.service;

import com.hc.cms.po.Succstudent;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

/**
 * 学员就业信息模块
 * @author Administrator
 *
 */
public interface SuccstudentService {
	//添加新学员就业信息
	public void save(Succstudent st);
	
	//更新学员就业信息
	public void update(Succstudent st, String path);
	
	//批量删除学员
	public void delete(Integer[] ids, String path);
	
	//分页查询学员信息
	public Result<Succstudent> selectByPage(QueryVo vo);
}
