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
	
	//分页查询图片
	public List<ChatPrintscreen> selectByPage(QueryVo vo);
	//查询总记录数
	public long selectCount();
	//新增图片
	public void save(ChatPrintscreen cp);
	//通过id查询单张图片
	public ChatPrintscreen selectById(Integer c_id);
	//更新图片
	public void update(ChatPrintscreen cp);
	//批量查询图片链接
	public List<String> selectByArr(Integer[] ids);
	//批量删除图片
	public void deleteByArr(Integer[] ids);
	
}
