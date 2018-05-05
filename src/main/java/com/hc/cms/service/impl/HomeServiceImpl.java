package com.hc.cms.service.impl;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.hc.cms.mapper.BannerMapper;
import com.hc.cms.po.Banner;
import com.hc.cms.po.HomePage;
import com.hc.cms.po.InstDynamic;
import com.hc.cms.service.HomeService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

@Service
@Transactional
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
		if (banner != null) {
//			banner.setLocation("HomePage");
			System.out.println(banner);
			bannerMapper.insert(banner);
		}
	}

	@Override
	public void deleteByIds(Integer[] delIds, String path) throws Exception {
		List<String> list = bannerMapper.selectByArr(delIds);
		for (String str : list) {
			if (str != null) {
				String filepath = path + str.substring(5);
				File file = new File(filepath);
				if (file.exists()) {
					file.delete();
				}
			}
		}
		bannerMapper.deleteByIds(delIds);
	}

	@Override
	public void update(Banner banner) throws Exception {
		bannerMapper.update(banner);
	}
	//分页查询轮播图
	@Override
	public Result<Banner> selectByPage(QueryVo vo) {
		Result<Banner> result = new Result<Banner>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<Banner> list = bannerMapper.selectByPage(vo);

		long count = bannerMapper.selectCount();
		result.setRows(list);
		result.setTotal(count);
		return result;

	}
}
