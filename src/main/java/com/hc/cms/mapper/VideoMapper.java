package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.Video;

public interface VideoMapper {

	void insert(Video video);

	List<Video> selectAll();

	void delete(Video video);

}
