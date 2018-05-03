package com.hc.cms.service;

import com.hc.cms.po.Forum;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

public interface ForumService {
	//分页查询
	Result<Forum> selectByPage(QueryVo vo);
	//批量删除论文
	void delete(Integer[] ids, String path);
	//更新论坛文章信息
	void update(Forum forum, String path);

}
