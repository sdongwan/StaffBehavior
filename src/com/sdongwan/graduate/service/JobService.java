package com.sdongwan.graduate.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sdongwan.graduate.dao.JobDao;
import com.sdongwan.graduate.dao.base.IEntityDao;
import com.sdongwan.graduate.service.base.BaseService;

/**
* @author sdongwan 
*/
@Service
public class JobService extends BaseService{
	
	@Resource
	private JobDao jobDao;
	
	@Override
	public IEntityDao getIEntityDao() {
		return jobDao;
	}

}
