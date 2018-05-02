package com.hc.cms.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.ForumMapper;
import com.hc.cms.po.Forum;
import com.hc.cms.service.ForumService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

@Service
public class ForumServiceImpl implements ForumService {

	@Autowired
	private ForumMapper forumMapper;

	//分页查询
	@Override
	public Result<Forum> selectByPage(QueryVo vo) {
		Result<Forum> result = new Result<Forum>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<Forum> list = forumMapper.selectByPage(vo);
		long count = forumMapper.selectCount();
		result.setTotal(count);
		result.setRows(list);
		return result;
	}

	//批量删除论文
	@Override
	public void delete(Integer[] ids, String path) {
		List<String> list = forumMapper.selectByArr(ids);
		for (String str : list) {
			if(str!=null){
				String filepath=path+str.substring(5);
				File file = new File(filepath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		forumMapper.deleteByArr(ids);
	}
	
}
