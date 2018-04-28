package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.Teacher;
import com.hc.cms.vo.QueryVo;

public interface TeacherMapper {

	List<Teacher> selectByPage(QueryVo vo);

	long selectCount();

	void save(Teacher teacher);

	Teacher selectById(Integer t_id);

	void update(Teacher teacher);

	List<String> selectByArr(Integer[] ids);

	void deleteByArr(Integer[] ids);

}
