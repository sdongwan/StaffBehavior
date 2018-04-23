package com.sdongwan.graduate.dao;

import org.springframework.stereotype.Repository;

import com.sdongwan.graduate.dao.base.BaseDao;
import com.sdongwan.graduate.model.Depart;

/**
 * 部门dao
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:31:44
 */
@Repository
public class DepartDao extends BaseDao{

	@Override
	public String getNameSpace() {
		return Depart.class.getName();
	}

}
