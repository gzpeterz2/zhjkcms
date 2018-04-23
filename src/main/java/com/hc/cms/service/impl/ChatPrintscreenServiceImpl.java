package com.hc.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hc.cms.mapper.ChatPrintscreenMapper;
import com.hc.cms.po.ChatPrintscreen;
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
	
}
