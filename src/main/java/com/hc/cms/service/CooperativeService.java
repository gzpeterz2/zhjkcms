package com.hc.cms.service;

import com.hc.cms.po.Cooperative;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
/**
 * 合作企业管理service接口
 * @author Administrator
 *
 */
public interface CooperativeService {
	//分页查询合作企业信息
	Result<Cooperative> selectByPage(QueryVo vo);
	//添加新合作企业
	void save(Cooperative cooperative);
	//更新合作企业信息
	void update(Cooperative cooperative, String path);
	//批量删除合作企业
	void delete(Integer[] ids, String path);

}
