package com.hc.cms.mapper;

import java.sql.SQLException;
import java.util.List;

import com.hc.cms.po.Banner;

public interface BannerMapper {
	public List<Banner> selectByLocation(String location) throws SQLException;
}
