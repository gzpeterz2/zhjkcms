package com.hc.cms.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.VideoMapper;
import com.hc.cms.po.Succstudent;
import com.hc.cms.po.Video;
import com.hc.cms.service.VideoService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
@Service
public class VideoServiceImpl implements VideoService {
	@Autowired
	private VideoMapper videoMapper;

	@Override
	public Result<Video> findByPage(QueryVo vo) {
		Result<Video> ret = new Result<Video>();
		int page=vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<Video> list = videoMapper.findByPage(vo);
		long count = videoMapper.selectCount();
		ret.setTotal(count);
		ret.setRows(list);
		return ret;
	}

	@Override
	public void addVideo(Video video) {
		if (video != null) {
			videoMapper.insert(video);
		}

	}

	@Override
	public void update(Video video) {
		System.out.println("Service  video:" + video);
		videoMapper.update(video);
	}

	@Override
	public void delete(Integer[] ids, String path) {
		List<String> list = videoMapper.findCoverByIdArr(ids);
		for (String str : list) {
			if(str!=null){
				String filepath=path+str.substring(4);
				File file = new File(filepath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		videoMapper.deleteByIdArr(ids);
	}

	@Override
	public Video findById(Integer v_id) {
		Video video=videoMapper.findById(v_id);
		return video;
	}

}
