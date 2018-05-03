package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.Forum;
import com.hc.cms.vo.QueryVo;
/**
 * 数据库论坛table dao层接口
 * @author Administrator
 *
 */
public interface ForumMapper {

	//分页查询论文
	List<Forum> selectByPage(QueryVo vo);
	//查询总记录数
	long selectCount();
	//根据id查询封面
	List<String> selectByArr(Integer[] ids);
	//批量删除论文
	void deleteByArr(Integer[] ids);
	//更新论坛文章信息
	void update(Forum forum);
	//通过id查找文章
	Forum selectById(Integer id);

}
