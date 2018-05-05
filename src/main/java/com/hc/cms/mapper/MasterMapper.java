package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.Master;
import com.hc.cms.vo.QueryVo;

public interface MasterMapper {
	//添加大咖简介信息
	public void save(Master master);
	//更新大咖简介信息
	public void update(Master master);
	//批量删除大咖简介信息
	public void deleteByArr(Integer[] ids);
	//分页查询大咖简介信息
	public List<Master> selectByPage(QueryVo vo);
	//查询总记录数
	public long selectCount();
	//批量查询大咖照片存放路径
	public List<String> selectByArr(Integer[] ids);
	//通过id查询大咖简介信息
	public Master selectById(Integer id);
}
