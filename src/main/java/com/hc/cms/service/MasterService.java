package com.hc.cms.service;

import com.hc.cms.po.Master;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

/**
 * 大咖管理Service接口
 * @author Administrator
 *
 */
public interface MasterService {
	//添加大咖
	public void save(Master master);
	
	//更新大咖信息
	public void update(Master master, String path);
	
	//批量删除大咖信息
	public void delete(Integer[] ids, String path);
	
	//分页查询大咖信息
	public Result<Master> selectByPage(QueryVo vo);
}
