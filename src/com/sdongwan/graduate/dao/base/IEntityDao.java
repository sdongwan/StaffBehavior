package com.sdongwan.graduate.dao.base;

import java.util.List;

/**
 * 
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:32:03
 */
public interface IEntityDao {
	 void insert(Object entity);
	 void delById(int id);
	 void update(Object entity,Object paramsPK);
	 Object findById(int id);
	 Object findBySql(String sql,String params);
	 void updateBySql(String sql, Object params);
	 List<Object> getAll();
}
