package com.hc.cms.service;

import com.hc.cms.po.Video;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

public interface VideoService {

	void addVideo(Video video);


	void update(Video video);

	Result<Video> findByPage(QueryVo vo);

	void delete(Integer[] ids, String path);

	Video findById(Integer v_id);

}
