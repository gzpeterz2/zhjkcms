package com.hc.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hc.cms.po.ChatPrintscreen;
import com.hc.cms.service.ChatPrintscreenService;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;
/**
 * 聊天截图管理Controller
 * @author Administrator
 *
 */
@Controller
public class ChatPrintscreenController {
	
	@Autowired
	private ChatPrintscreenService chatPrintscreenService;
	//分页查询
	@RequestMapping("/selectByPage")
	@ResponseBody
	public Result selectByPage(QueryVo vo) throws Exception{
		Result<ChatPrintscreen> result = chatPrintscreenService.selectByPage(vo);
		return result;
	}
	
}
