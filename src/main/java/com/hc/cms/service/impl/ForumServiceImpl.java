package com.hc.cms.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.ForumMapper;
import com.hc.cms.po.Forum;
import com.hc.cms.po.StudentStory;
import com.hc.cms.po.Succstudent;
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

	//更新论坛文章信息
	@Override
	public void update(Forum forum,String path) {
		Forum existforum=forumMapper.selectById(forum.getId());
		//新添加封面
		String cover = forum.getCover();
		//原封面
		String coverDb = existforum.getCover();
		//如果原封面为空，并且原封面与新添加封面不一样
		if(coverDb != null && !coverDb.equals(cover)){
			//获取原封面图片路径
			String filepath=path+coverDb.substring(5);
			File file = new File(filepath);
			if(file.exists()){
				//如果原封面图片存在，则删除
				file.delete();
			}
		}
		//设置日期时间格式
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = format.format(new Date());
		//每次重新设置编辑时间
		forum.setEdit_time(date);
		//更新学员故事
		forumMapper.update(forum);
	}
	
}
