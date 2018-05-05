package com.hc.cms.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.CooperativeMapper;
import com.hc.cms.po.CompanyIntro;
import com.hc.cms.po.Cooperative;
import com.hc.cms.service.CooperativeService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
/**
 * 合作企业service实现类
 * @author Administrator
 *
 */
@Service
public class CooperativeServiceImpl implements CooperativeService {

	@Autowired
	private CooperativeMapper cooperativeMapper;

	//分页查询合作企业信息
	@Override
	public Result<Cooperative> selectByPage(QueryVo vo) {
		Result<Cooperative> result = new Result<Cooperative>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<Cooperative> list = cooperativeMapper.selectByPage(vo);
		long count = cooperativeMapper.selectCount();
		result.setTotal(count);
		result.setRows(list);
		return result;
	}
	//添加新合作企业
	@Override
	public void save(Cooperative cooperative) {
		cooperativeMapper.save(cooperative);
	}
	//更新合作企业信息
	@Override
	public void update(Cooperative cooperative, String path) {
		Cooperative oldCooperative=cooperativeMapper.selectById(cooperative.getC_id());
		String old_c_logo = oldCooperative.getC_logo();
		String c_logo = cooperative.getC_logo();
		if(old_c_logo != null && !old_c_logo.equals(c_logo)){
			String filepath=path+old_c_logo.substring(5);
			File file = new File(filepath);
			if(file.exists()){
				file.delete();
			}
		}
		cooperativeMapper.update(cooperative);
	}
	//批量删除合作企业
	@Override
	public void delete(Integer[] ids, String path) {
		List<String> list = cooperativeMapper.selectByArr(ids);
		for (String str : list) {
			if(str!=null){
				String filepath=path+str.substring(5);
				File file = new File(filepath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		cooperativeMapper.deleteByArr(ids);
	}
	
}
