package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.Forum;
import com.hc.cms.vo.QueryVo;

public interface ForumMapper {

	//分页查询论文
	List<Forum> selectByPage(QueryVo vo);
	//查询总记录数
	long selectCount();
	//根据id查询封面
	List<String> selectByArr(Integer[] ids);
	//批量删除论文
	void deleteByArr(Integer[] ids);

}
