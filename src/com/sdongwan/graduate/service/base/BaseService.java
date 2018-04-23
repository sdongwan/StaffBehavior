package com.sdongwan.graduate.service.base;

import org.springframework.transaction.annotation.Transactional;

import com.sdongwan.graduate.dao.base.IEntityDao;

/**
 * 
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:37:59
 */
@Transactional(rollbackFor = Exception.class)
public abstract class BaseService {
	protected static final String ok="ok";
	protected static final String error="error";
	
	public abstract IEntityDao getIEntityDao();
	
	public void insert(Object entity){
		getIEntityDao().insert(entity);
	}
	
	public void delById(int id){
		getIEntityDao().delById(id);
	}
	
	public void update(Object entity,int id) {
		getIEntityDao().update(entity, id);
	}
	
	public Object findById(int id) {
		return getIEntityDao().findById(id);
	}

	public Object findBySql(String sql , String params) {
		return getIEntityDao().findBySql(sql, params);
	}
}
