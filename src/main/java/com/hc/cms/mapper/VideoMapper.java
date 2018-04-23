package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.Video;
import com.hc.cms.vo.QueryVo;
/**
 * 
 * @author HX
 *
 *视频模块Mapper
 */
public interface VideoMapper {

	void insert(Video video);

	void delete(Video video);

	void update(Video video);

	long selectCount();

	List<Video> findByPage(QueryVo vo);

	List<String> findCoverByIdArr(Integer[] ids);

	void deleteByIdArr(Integer[] ids);

	Video findById(Integer v_id);

}
