package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.Cooperative;
import com.hc.cms.vo.QueryVo;

public interface CooperativeMapper {
	//添加合作企业
	public void save(Cooperative cooperative);
	//更新合作企业信息
	public void update(Cooperative cooperative);
	//批量删除合作企业
	public void deleteByArr(Integer[] ids);
	//分页查询合作企业信息
	public List<Cooperative> selectByPage(QueryVo vo);
	//查询总记录数
	public long selectCount();
	//批量查询合作企业logo存放路径
	public List<String> selectByArr(Integer[] ids);
	//通过id查询合作企业信息
	public Cooperative selectById(Integer id);
}
