package com.hc.cms.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.MasterMapper;
import com.hc.cms.po.Master;
import com.hc.cms.service.MasterService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

/**
 * 大咖管理Service实现类
 * @author Administrator
 *
 */
@Service
public class MasterServiceImpl implements MasterService {

	@Autowired
	private MasterMapper masterMapper;

	//添加大咖
	@Override
	public void save(Master master) {
		masterMapper.save(master);
	}

	//更新大咖信息
	@Override
	public void update(Master master, String path) {
		Master oldMaster=masterMapper.selectById(master.getM_id());
		String old_m_photos = oldMaster.getM_photos();
		String m_photos = master.getM_photos();
		if(old_m_photos != null && !old_m_photos.equals(m_photos)){
			String filepath=path+old_m_photos.substring(5);
			File file = new File(filepath);
			if(file.exists()){
				file.delete();
			}
		}
		masterMapper.update(master);
	}

	//批量删除大咖信息
	@Override
	public void delete(Integer[] ids, String path) {
		List<String> list = masterMapper.selectByArr(ids);
		for (String str : list) {
			if(str!=null){
				String filepath=path+str.substring(5);
				File file = new File(filepath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		masterMapper.deleteByArr(ids);
	}

	//分页查询大咖信息
	@Override
	public Result<Master> selectByPage(QueryVo vo) {
		Result<Master> result = new Result<Master>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<Master> list = masterMapper.selectByPage(vo);
		long count = masterMapper.selectCount();
		result.setTotal(count);
		result.setRows(list);
		return result;
	}
	
}
