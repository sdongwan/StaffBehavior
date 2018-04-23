package com.sdongwan.graduate.dao;

import org.springframework.stereotype.Repository;

import com.sdongwan.graduate.dao.base.BaseDao;
import com.sdongwan.graduate.model.Staff;

/**
 * 员工dao
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:32:26
 */
@Repository
public class StaffDao extends BaseDao{

	@Override
	public String getNameSpace() {
		return Staff.class.getName();
	}
	

}
