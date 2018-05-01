package com.sdongwan.graduate.service.base;

import java.util.List;

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
	
	public Object insert(Object entity){
		getIEntityDao().insert(entity);
		return ok;
	}
	
	public Object delById(int id){
		getIEntityDao().delById(id);
		return ok;
	}
	
	public Object updById(Object param) {
		getIEntityDao().updById(param);
		return ok;
	}
	
	public Object updBySql(String sql, Object param) {
		getIEntityDao().updateBySql(sql, param);
		return ok;
	}
	
	public Object findById(int id) {
		return getIEntityDao().findById(id);
	}

	public Object findBySql(String sql , String params) {
		return getIEntityDao().findBySql(sql, params);
	}
	
	public Object getAll() {
		return getIEntityDao().getAll();
	}
	
	public Object getOne(String sql,Object params) {
		return getIEntityDao().findBySql(sql, params);
	}
	
	public List<?> getList(String sql,Object params) {
		return (List<?>) getIEntityDao().getList(sql, params);
	}
}
