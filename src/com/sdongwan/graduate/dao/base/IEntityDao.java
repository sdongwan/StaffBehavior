package com.sdongwan.graduate.dao.base;
/**
 * 
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:32:03
 */
public interface IEntityDao {
	public void insert(Object entity);
	public void delById(int id);
	public void update(Object entity,Object paramsPK);
	public Object findById(int id);
	public Object findBySql(String sql,String params);
	void updateBySql(String sql, Object params);
}
