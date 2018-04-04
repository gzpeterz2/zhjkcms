package com.hc.cms.service;

import com.hc.cms.po.Banner;
import com.hc.cms.po.HomePage;

public interface HomeService {
	public HomePage getHomePage() throws Exception;
	public void addHomeBanner(Banner banner) throws Exception;
}
