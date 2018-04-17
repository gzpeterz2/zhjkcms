package com.hc.cms.service;

import com.hc.cms.po.InstDynamic;

public interface InstDynamicService {
	//添加学院动态资讯
	int addDynamic(InstDynamic instDynamic);
	//更新资讯
	int updateDynamic(InstDynamic instDynamic);

}
