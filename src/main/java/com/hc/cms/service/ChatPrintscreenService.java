package com.hc.cms.service;

import com.hc.cms.po.ChatPrintscreen;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

public interface ChatPrintscreenService {

	Result<ChatPrintscreen> selectByPage(QueryVo vo);

	void save(ChatPrintscreen cp);

	void update(ChatPrintscreen cp, String path);

	void delete(Integer[] ids, String path);

}
