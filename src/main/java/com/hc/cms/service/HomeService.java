package com.hc.cms.service;

import com.hc.cms.po.Banner;
import com.hc.cms.po.HomePage;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

public interface HomeService {
	public HomePage getHomePage() throws Exception;
	public void addHomeBanner(Banner banner) throws Exception;
	public void deleteByIds(Integer[] delIds, String path) throws Exception;
	public void update(Banner banner) throws Exception;
	public Result<Banner> selectByPage(QueryVo vo);
}

