package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.Succstudent;
import com.hc.cms.vo.QueryVo;

public interface SuccstudentMapper {
	
	public List<Succstudent> selectAll() throws Exception;
	//添加新学员就业信息
	public void save(Succstudent st);
	//更新学员就业信息
	public void update(Succstudent st);
	//批量删除学员就业信息
	public void deleteByArr(Integer[] ids);
	//分页查询学员就业信息
	public List<Succstudent> selectByPage(QueryVo vo);
	//查询总记录数
	public long selectCount();
	//批量查询学员照片路径photos_src
	public List<String> selectByArr(Integer[] ids);
	
}
