package com.sdongwan.graduate.dao;

import org.springframework.stereotype.Repository;

import com.sdongwan.graduate.dao.base.BaseDao;
import com.sdongwan.graduate.model.Factor;

/**
 * 因素dao
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:32:13
 */
@Repository
public class FactorDao extends BaseDao{

	@Override
	public String getNameSpace() {
		return Factor.class.getName();
	}

}
