package com.hc.cms.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hc.cms.mapper.BannerMapper;
import com.hc.cms.po.Banner;
import com.hc.cms.po.HomePage;
import com.hc.cms.service.HomeService;

public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private BannerMapper bannerMapper;

	@Override
	public HomePage getHomePage() throws SQLException {
		HomePage homePage = new HomePage();
		List<Banner> list = bannerMapper.selectByLocation("HomePage");
		homePage.setBigBanner1(list.get(0));
		homePage.setBigBanner2(list.get(1));
		homePage.setBigBanner3(list.get(2));
		return homePage;
	}

	@Override
	public void addHomeBanner(Banner banner) throws Exception {
		if(banner != null) {
			banner.setLocation("HomePage");
			System.out.println(banner);
			bannerMapper.insert(banner);
		}
	}
}
