package com.hc.cms.service;

import com.hc.cms.po.Teacher;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

public interface TeacherService {

	Result<Teacher> selectByPage(QueryVo vo);

	void save(Teacher teacher);

	void update(Teacher teacher, String path);

	void delete(Integer[] ids, String path);

}
