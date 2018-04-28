package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.StudentStory;
import com.hc.cms.vo.QueryVo;

public interface StudentStroyMapper {

	List<StudentStory> selectByPage(QueryVo vo);

	long selectCount();

	void update(StudentStory studentStory);

	StudentStory selectById(Integer id);

}
