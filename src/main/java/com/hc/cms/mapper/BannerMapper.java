package com.hc.cms.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.SelectProvider;

import com.hc.cms.po.Banner;
import com.hc.cms.vo.QueryVo;

public interface BannerMapper {
	public List<Banner> selectByLocation(String location) throws SQLException;

	public void insert(Banner banner) throws SQLException;

	public void update(Banner banner) throws SQLException;

	public void deleteByIds(Integer[] delIds);

	public List<String> selectByArr(Integer[] delIds);

	public List<Banner> selectByPage(QueryVo vo);

	public long selectCount();
}
