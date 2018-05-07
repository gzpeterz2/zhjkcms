package com.hc.cms.service;

import java.sql.SQLException;
import java.util.List;

import com.hc.cms.po.Banner;
import com.hc.cms.po.Enviroment;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

public interface EnviromentService {
	
	public List<Enviroment> getList() throws SQLException;

	public Result<Enviroment> selectByPage(QueryVo vo) throws SQLException;

	public void add(Enviroment environment);

	public void update(Enviroment environment,String path);

	public void deleteByIds(Integer[] ids, String sTUDENT_PHOTOS_UPLOAD_PATH);
}
