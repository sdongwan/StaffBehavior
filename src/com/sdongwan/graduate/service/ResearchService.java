package com.sdongwan.graduate.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sdongwan.graduate.dao.ResearchDao;
import com.sdongwan.graduate.dao.base.IEntityDao;
import com.sdongwan.graduate.service.base.BaseService;

/**
* @author sdongwan 
*/
@Service
public class ResearchService extends BaseService {
	
	@Resource
	private ResearchDao researchDao;

	@Override
	public IEntityDao getIEntityDao() {
		return researchDao;
	}

}
