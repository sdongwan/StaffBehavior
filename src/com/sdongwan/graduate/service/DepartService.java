package com.sdongwan.graduate.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sdongwan.graduate.dao.DepartDao;
import com.sdongwan.graduate.dao.base.IEntityDao;
import com.sdongwan.graduate.service.base.BaseService;

/**
* @author sdongwan 
*/
@Service
public class DepartService extends BaseService{
	
	@Resource
	private DepartDao departDao;
	
	@Override
	public IEntityDao getIEntityDao() {
		return departDao;
	}

}
