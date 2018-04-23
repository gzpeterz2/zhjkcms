package com.hc.cms.service;

import com.hc.cms.po.ChatPrintscreen;
import com.hc.cms.vo.QueryVo;
import com.hc.cms.vo.Result;

public interface ChatPrintscreenService {

	Result<ChatPrintscreen> selectByPage(QueryVo vo);

}
