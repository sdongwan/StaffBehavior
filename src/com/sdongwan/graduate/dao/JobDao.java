package com.sdongwan.graduate.dao;

import org.springframework.stereotype.Repository;

import com.sdongwan.graduate.dao.base.BaseDao;
import com.sdongwan.graduate.model.Job;

/**
 * 职位dao
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:32:22
 */
@Repository
public class JobDao extends BaseDao{

	@Override
	public String getNameSpace() {
		return Job.class.getName();
	}

}
