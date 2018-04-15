package com.hc.cms.mapper;

import com.hc.cms.po.InstDynamic;

public interface InstDynamicMapper {
    int deleteByPrimaryKey(Integer artId);

    int insert(InstDynamic record);

    int insertSelective(InstDynamic record);

    InstDynamic selectByPrimaryKey(Integer artId);

    int updateByPrimaryKeySelective(InstDynamic record);

    int updateByPrimaryKeyWithBLOBs(InstDynamic record);

    int updateByPrimaryKey(InstDynamic record);
}