package com.hc.cms.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.ChatPrintscreenMapper;
import com.hc.cms.po.ChatPrintscreen;
import com.hc.cms.po.Succstudent;
import com.hc.cms.service.ChatPrintscreenService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
@Service
public class ChatPrintscreenServiceImpl implements ChatPrintscreenService {

	@Autowired
	private ChatPrintscreenMapper chatPrintscreenMapper;

	//分页查询聊天图片
	@Override
	public Result<ChatPrintscreen> selectByPage(QueryVo vo) {
		Result<ChatPrintscreen> result = new Result<ChatPrintscreen>();
		int page = vo.getPage();
		page=(page-1)*vo.getRows();
		vo.setPage(page);
		List<ChatPrintscreen> list = chatPrintscreenMapper.selectByPage(vo);
		long count = chatPrintscreenMapper.selectCount();
		result.setTotal(count);
		result.setRows(list);
		return result;
	}
	//添加图片
	@Override
	public void save(ChatPrintscreen cp) {
		chatPrintscreenMapper.save(cp);
	}
	
	//更新图片
	@Override
	public void update(ChatPrintscreen cp, String path) {
		ChatPrintscreen ss=chatPrintscreenMapper.selectById(cp.getC_id());
		String c_src = ss.getC_src();
		if(c_src!=null){
			String filepath=path+c_src.substring(5);
			File file = new File(filepath);
			if(file.exists()){
				file.delete();
			}
		}
		chatPrintscreenMapper.update(cp);
	}
	@Override
	public void delete(Integer[] ids, String path) {
		List<String> list = chatPrintscreenMapper.selectByArr(ids);
		for (String str : list) {
			if(str!=null){
				String filepath=path+str.substring(5);
				File file = new File(filepath);
				if(file.exists()){
					file.delete();
				}
			}
		}
		chatPrintscreenMapper.deleteByArr(ids);
	}
	
}
