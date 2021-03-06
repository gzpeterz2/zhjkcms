package com.hc.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.BannerMapper;
import com.hc.cms.mapper.SuccstudentMapper;
import com.hc.cms.mapper.InstDynamicMapper;
import com.hc.cms.mapper.VideoMapper;

import com.hc.cms.po.Banner;
import com.hc.cms.po.Succstudent;
import com.hc.cms.po.InstDynamic;
import com.hc.cms.po.Video;

import com.hc.cms.service.JsonService;
@Service
public class JsonServiceImpl implements JsonService {
	@Autowired
	private SuccstudentMapper succstudentMapper;
	
	@Autowired
	private BannerMapper bannerMapper;
	
	@Autowired
	private InstDynamicMapper instDynamicMapper;
	
	@Autowired
	private VideoMapper videoMapper;
	
	@Override
	public List<Succstudent> getSuccList() throws Exception {
		return succstudentMapper.selectAll();
	}

	@Override
	public List<Banner> getHomeBanner() throws Exception {
		return bannerMapper.selectByLocation("HomePage");
	}

	@Override
	public List<InstDynamic> getInstDynamic() throws Exception {
		
		return instDynamicMapper.selectAll();
	}
	
}

