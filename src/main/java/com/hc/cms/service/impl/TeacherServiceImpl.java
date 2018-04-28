package com.hc.cms.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.TeacherMapper;
import com.hc.cms.po.Teacher;
import com.hc.cms.service.TeacherService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherMapper teacherMapper;
	
	//分页查询老师信息
	@Override
	public Result<Teacher> selectByPage(QueryVo vo) {
		Result<Teacher> result = new Result<Teacher>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<Teacher> list = teacherMapper.selectByPage(vo);
		long count = teacherMapper.selectCount();
		result.setTotal(count);
		result.setRows(list);
		return result;
	}
	
	//添加新老师信息
	@Override
	public void save(Teacher teacher) {
		teacherMapper.save(teacher);
	}

	//更新老师信息
	@Override
	public void update(Teacher teacher, String path) {
		Teacher ss=teacherMapper.selectById(teacher.getT_id());
		String photos_src = ss.getT_photos();
		String t_photos = teacher.getT_photos();
		if(photos_src!=null && !t_photos.equals(photos_src)){
			String filepath=path+photos_src.substring(5);
			File file = new File(filepath);
			if(file.exists()){
				file.delete();
			}
		}
		teacherMapper.update(teacher);
	}

	//批量删除老师信息
	@Override
	public void delete(Integer[] ids, String path) {
		List<String> list = teacherMapper.selectByArr(ids);
		for (String str : list) {
			if(str!=null){
				String filepath=path+str.substring(5);
				File file = new File(filepath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		teacherMapper.deleteByArr(ids);
	}
	
}
