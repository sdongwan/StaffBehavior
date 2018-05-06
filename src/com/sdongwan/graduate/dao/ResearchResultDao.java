package com.sdongwan.graduate.dao;

import org.springframework.stereotype.Repository;

import com.sdongwan.graduate.dao.base.BaseDao;
import com.sdongwan.graduate.model.ResearchResult;

/**
* @author sdongwan 
* @version 创建时间：2018年5月6日 下午3:01:12
*/
@Repository
public class ResearchResultDao extends BaseDao{

	@Override
	public String getNameSpace() {
		return ResearchResult.class.getName();
	}
}
