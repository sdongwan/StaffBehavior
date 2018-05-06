package com.sdongwan.graduate.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sdongwan.graduate.dao.ResearchResultDao;
import com.sdongwan.graduate.dao.base.IEntityDao;
import com.sdongwan.graduate.service.base.BaseService;

/**
* @author sdongwan 
* @version 创建时间：2018年5月6日 下午3:02:37
*/
@Service
public class ResearchResultService  extends BaseService{

	@Resource
	private ResearchResultDao researchResultDao;
	
	@Override
	public IEntityDao getIEntityDao() {
		return researchResultDao;
	}
}
