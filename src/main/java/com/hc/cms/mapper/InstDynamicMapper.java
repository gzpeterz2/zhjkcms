package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.InstDynamic;
import com.hc.cms.vo.QueryVo;

public interface InstDynamicMapper {
    int deleteByPrimaryKey(Integer artId);
    //添加学院动态资讯
    int insert(InstDynamic record);

    int insertSelective(InstDynamic record);

    InstDynamic selectByPrimaryKey(Integer artId);


    int updateByPrimaryKey(InstDynamic record);
	
	List<InstDynamic> selectByPage(QueryVo vo);
	
	long selectCount();
	
	List<InstDynamic> selectAll();
	
	void deleteByIds(String delIds);
	
}