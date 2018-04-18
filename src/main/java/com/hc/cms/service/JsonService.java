package com.hc.cms.service;

import java.util.List;

import com.hc.cms.po.Banner;
import com.hc.cms.po.Succstudent;
import com.hc.cms.po.Video;
import com.hc.cms.po.InstDynamic;

public interface JsonService {
	public List<Succstudent> getSuccList() throws Exception;
	public List<Banner> getHomeBanner() throws Exception;
	public List<InstDynamic> getInstDynamic() throws Exception;
	public List<Video> getVideo()throws Exception;
}

