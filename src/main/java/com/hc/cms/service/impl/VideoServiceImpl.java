package com.hc.cms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.hc.cms.mapper.VideoMapper;
import com.hc.cms.po.Video;
import com.hc.cms.service.VideoService;

public class VideoServiceImpl implements VideoService {
	@Autowired
	private VideoMapper videoMapper;
	@Override
	public void addVideo(Video video) {
		if (video!=null) {
			videoMapper.insert(video);
		}
		
	}
	@Override
	public void deleteVideo(Video video) {
		videoMapper.delete(video);
	}
	@Override
	public void update(Video video) {
		System.out.println("Service  video:"+video);
		videoMapper.update(video);
	}

}
