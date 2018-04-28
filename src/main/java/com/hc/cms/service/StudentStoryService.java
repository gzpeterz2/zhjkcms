package com.hc.cms.service;

import com.hc.cms.po.StudentStory;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

public interface StudentStoryService {

	//分页查询学员故事
	Result<StudentStory> selectByPage(QueryVo vo);
	
	//更新学员故事
	void update(StudentStory studentStory) throws Exception;

}
