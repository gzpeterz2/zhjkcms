package com.hc.cms.mapper;

import java.util.List;

import com.hc.cms.po.ChatPrintscreen;
import com.hc.cms.vo.QueryVo;
/**
 * 聊天截图Dao
 * @author Administrator
 *
 */
public interface ChatPrintscreenMapper {
	
	public List<ChatPrintscreen> selectByPage(QueryVo vo);

	public long selectCount();
	
}
