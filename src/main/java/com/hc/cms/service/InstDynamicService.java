package com.hc.cms.service;

import com.hc.cms.po.InstDynamic;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

public interface InstDynamicService {
	//添加学院动态资讯
	int addDynamic(InstDynamic instDynamic);
	//更新资讯
	int updateDynamic(InstDynamic instDynamic);
/*	//分页查询
	List<InstDynamic> findByPage();*/
	
	//按id删除
	int deleteById(Integer instid);
	
	Result<InstDynamic> selectByPage(QueryVo vo);
	
	void deleteByIds(Integer[] delIds);

}
