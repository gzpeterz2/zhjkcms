package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.InstDynamic;

public interface InstDynamicMapper {
    int deleteByPrimaryKey(Integer artId);
  //添加学院动态资讯
    int insert(InstDynamic record);

    int insertSelective(InstDynamic record);

    InstDynamic selectByPrimaryKey(Integer artId);

    int updateByPrimaryKeySelective(InstDynamic record);

    int updateByPrimaryKeyWithBLOBs(InstDynamic record);

    int updateByPrimaryKey(InstDynamic record);
    
	List<InstDynamic> findByPage();
}