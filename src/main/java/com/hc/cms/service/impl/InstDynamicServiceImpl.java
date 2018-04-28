package com.hc.cms.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hc.cms.service.InstDynamicService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
import com.hc.cms.mapper.InstDynamicMapper;
import com.hc.cms.po.InstDynamic;
import com.hc.cms.po.Succstudent;

public class InstDynamicServiceImpl implements InstDynamicService {
	@Autowired
	private InstDynamicMapper instDynamicMapper;
	
	//添加学院动态资讯
	@Override
	public int addDynamic(InstDynamic instDynamic) {
		//获取系统当前时间
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateform = sdf.format(d);
		//设置发布时间
		instDynamic.setPost_time(dateform);
		//设置浏览数
		instDynamic.setViews(0);
		return instDynamicMapper.insert(instDynamic);
	}

	@Override
	public int updateDynamic(InstDynamic instDynamic) {
		//获取系统当前时间
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateform = sdf.format(d);
		//设置发布时间
		instDynamic.setPost_time(dateform);
		
		return instDynamicMapper.updateByPrimaryKey(instDynamic);
	}

	/*@Override
	public List<InstDynamic> findByPage() {
		
		return instDynamicMapper.findByPage();
	}*/

	//分页查询资讯
	@Override
	public Result<InstDynamic> selectByPage(QueryVo vo) {
		Result<InstDynamic> result = new Result<InstDynamic>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<InstDynamic> list = instDynamicMapper.selectByPage(vo);
		System.out.println(list.get(0));
		long count = instDynamicMapper.selectCount();
		result.setRows(list);
		result.setTotal(count);
		return result;
	}

	@Override
	public int deleteById(Integer instid) {
		
		return 0;
	}

	@Override
	public void deleteByIds(String delIds) {
		
		instDynamicMapper.deleteByIds(delIds);
		
	}
	
}
