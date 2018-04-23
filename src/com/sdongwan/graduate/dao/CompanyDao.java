package com.sdongwan.graduate.dao;

import org.springframework.stereotype.Repository;

import com.sdongwan.graduate.dao.base.BaseDao;
import com.sdongwan.graduate.model.Company;

/**
 * 	公司dao
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:29:12
 */
@Repository
public class CompanyDao extends BaseDao{
	@Override
	public String getNameSpace() {
		return Company.class.getName();
	}
}
