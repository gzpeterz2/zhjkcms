package com.hc.cms.service.impl;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.EnvironmentMapper;
import com.hc.cms.po.Banner;
import com.hc.cms.po.Enviroment;
import com.hc.cms.po.Succstudent;
import com.hc.cms.service.EnviromentService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
@Service
public class EnviromentServiceImpl implements EnviromentService {
	@Autowired
	private EnvironmentMapper enviromentMapper;
	@Override
	public List<Enviroment> getList() throws SQLException {
		
		return enviromentMapper.selectAll();
	}
	@Override
	public Result<Enviroment> selectByPage(QueryVo vo) throws SQLException {
		Result<Enviroment> result = new Result<Enviroment>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<Enviroment> list = enviromentMapper.selectByPage(vo);
		System.out.println(list);
		long count = enviromentMapper.getTotalCount();
		result.setRows(list);
		result.setTotal(count);
		return result;
		
	}
	@Override
	public void add(Enviroment environment) {
		if (environment != null) {
//			banner.setLocation("HomePage");
			System.out.println(environment);
			enviromentMapper.insert(environment);
		}
		
	}
	@Override
	public void update(Enviroment environment,String path) {
		Enviroment e =enviromentMapper.selectById(environment.getId());
		String p1 = e.getPic();
		String p2 = environment.getPic();
		if(p1!=null && !p2.equals(p1)){
			String filepath=path+p1.substring(5);
			File file = new File(filepath);
			if(file.exists()){
				file.delete();
			}
		}
		enviromentMapper.update(environment);
	}
	@Override
	public void deleteByIds(Integer[] ids, String path) {
		List<String> list = enviromentMapper.selectByArr(ids);
		for (String str : list) {
			if (str != null) {
				String filepath = path + str.substring(5);
				File file = new File(filepath);
				if (file.exists()) {
					file.delete();
				}
			}
		}
		enviromentMapper.deleteByIds(ids);
		
	}

}
