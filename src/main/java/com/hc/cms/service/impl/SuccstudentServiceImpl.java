package com.hc.cms.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.SuccstudentMapper;
import com.hc.cms.po.Succstudent;
import com.hc.cms.service.SuccstudentService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

@Service
public class SuccstudentServiceImpl implements SuccstudentService{

	@Autowired
	private SuccstudentMapper succstudentMapper;
	
	//分页查询学员就业信息
	@Override
	public Result<Succstudent> selectByPage(QueryVo vo) {
		Result<Succstudent> result = new Result<Succstudent>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<Succstudent> list = succstudentMapper.selectByPage(vo);
		long count = succstudentMapper.selectCount();
		result.setTotal(count);
		result.setRows(list);
		return result;
	}

	//添加新学员就业信息
	@Override
	public void save(Succstudent st) {
		succstudentMapper.save(st);
	}

	//更新学员就业信息
	@Override
	public void update(Succstudent st) {
		succstudentMapper.update(st);
	}

	//批量删除学员就业信息
	@Override
	public void delete(Integer[] ids,String path) {
		List<String> list = succstudentMapper.selectByArr(ids);
		for (String str : list) {
			if(str!=null){
				String filepath=path+str.substring(5);
				File file = new File(filepath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		succstudentMapper.deleteByArr(ids);
	}


}
