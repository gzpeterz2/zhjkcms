package com.hc.cms.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.StudentStroyMapper;
import com.hc.cms.po.StudentStory;
import com.hc.cms.service.StudentStoryService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

@Service
public class StudentStoryServiceImpl implements StudentStoryService {

	@Autowired
	private StudentStroyMapper studentStoryMapper;
	
	//分页查询学员故事
	@Override
	public Result<StudentStory> selectByPage(QueryVo vo) {
		Result<StudentStory> result = new Result<StudentStory>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<StudentStory> list = studentStoryMapper.selectByPage(vo);
		long count = studentStoryMapper.selectCount();
		result.setTotal(count);
		result.setRows(list);
		return result;
	}
	
	//更新学员故事
	@Override
	public void update(StudentStory studentStory) throws Exception {
		//设置日期时间格式
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = format.format(new Date());
		StudentStory exist = studentStoryMapper.selectById(studentStory.getId());
		//如果开始的编辑时间为空，则设置编辑时间，否则编辑时间为初始的编辑时间
		if(exist.getEdit_time()==null || exist.getEdit_time().equals("")){
			//设置编辑时间
			studentStory.setEdit_time(date);
		}else{
			studentStory.setEdit_time(exist.getEdit_time());
		}
		//每次更新重新设置发布时间
		studentStory.setPost_time(date);
		//更新学员故事
		studentStoryMapper.update(studentStory);
	}

}
