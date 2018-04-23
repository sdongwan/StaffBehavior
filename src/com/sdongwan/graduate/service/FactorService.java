package com.sdongwan.graduate.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sdongwan.graduate.dao.FactorDao;
import com.sdongwan.graduate.dao.base.IEntityDao;
import com.sdongwan.graduate.service.base.BaseService;

/**
* @author sdongwan 
*/
@Service
public class FactorService extends BaseService {
	
	@Resource
	private FactorDao factorDao;

	@Override
	public IEntityDao getIEntityDao() {
		return factorDao;
	}

}
