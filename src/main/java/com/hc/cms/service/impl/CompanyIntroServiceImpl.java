package com.hc.cms.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.CompanyIntroMapper;
import com.hc.cms.po.CompanyIntro;
import com.hc.cms.service.CompanyIntroService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
/**
 * 公司简介service实现类
 * @author Administrator
 *
 */
@Service
public class CompanyIntroServiceImpl implements CompanyIntroService {
	
	@Autowired
	private CompanyIntroMapper companyIntroMapper;
	
	//分页查询公司简介信息
	@Override
	public Result<CompanyIntro> selectByPage(QueryVo vo) {
		Result<CompanyIntro> result = new Result<CompanyIntro>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<CompanyIntro> list = companyIntroMapper.selectByPage(vo);
		long count = companyIntroMapper.selectCount();
		result.setTotal(count);
		result.setRows(list);
		return result;
	}

	//添加新公司简介信息
	@Override
	public void save(CompanyIntro companyIntro) {
		companyIntroMapper.save(companyIntro);
	}

	//更新公司简介信息
	@Override
	public void update(CompanyIntro companyIntro,String path) {
		CompanyIntro oldCompanyIntro=companyIntroMapper.selectById(companyIntro.getC_id());
		String old_c_pic = oldCompanyIntro.getC_pic();
		String c_pic = companyIntro.getC_pic();
		if(old_c_pic != null && !old_c_pic.equals(c_pic)){
			String filepath=path+old_c_pic.substring(5);
			File file = new File(filepath);
			if(file.exists()){
				file.delete();
			}
		}
		companyIntroMapper.update(companyIntro);
	}

	//批量删除公司简介信息
	@Override
	public void delete(Integer[] ids,String path) {
		List<String> list = companyIntroMapper.selectByArr(ids);
		for (String str : list) {
			if(str!=null){
				String filepath=path+str.substring(5);
				File file = new File(filepath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		companyIntroMapper.deleteByArr(ids);
	}
}
