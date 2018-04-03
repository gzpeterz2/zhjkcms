package com.hc.cms.service;

import java.util.List;

import com.hc.cms.po.Banner;
import com.hc.cms.po.Succstudent;

public interface JsonService {
	public List<Succstudent> getSuccList() throws Exception;
	public List<Banner> getHomeBanner() throws Exception;
}
