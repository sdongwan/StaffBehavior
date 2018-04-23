package com.sdongwan.graduate.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sdongwan.graduate.dao.CompanyDao;
import com.sdongwan.graduate.dao.base.IEntityDao;
import com.sdongwan.graduate.service.base.BaseService;

/**
* @author sdongwan 
*/
@Service
public class CompanyService extends BaseService{

	@Resource
	private CompanyDao companyDao;
	
	@Override
	public IEntityDao getIEntityDao() {
		return companyDao;
	}

	

}
