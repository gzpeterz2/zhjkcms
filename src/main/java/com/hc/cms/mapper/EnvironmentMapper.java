package com.hc.cms.mapper;

import java.sql.SQLException;
import java.util.List;

import com.hc.cms.po.Banner;
import com.hc.cms.po.Enviroment;
import com.hc.cms.po.Succstudent;
import com.hc.cms.vo.QueryVo;

public interface EnvironmentMapper {

	public int getTotalCount() throws SQLException;
	
	public List<Enviroment> selectAll() throws SQLException;

	public List<Enviroment> selectByPage(QueryVo vo);

	public void insert(Enviroment environment);

	public Enviroment selectById(Integer id);

	public void update(Enviroment environment);

	public List<String> selectByArr(Integer[] ids);

	public void deleteByIds(Integer[] ids);
}
