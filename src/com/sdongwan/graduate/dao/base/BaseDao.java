package com.sdongwan.graduate.dao.base;

import org.mybatis.spring.SqlSessionTemplate;

/**
 * 
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:31:57
 */
public  abstract class BaseDao implements IEntityDao {
	
	protected SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public abstract String getNameSpace();

	@Override
	public void insert(Object entity) {
		String addStatement = this.getNameSpace()+".add";
		sqlSessionTemplate.insert(addStatement, entity);
	}

	@Override
	public void delById(int id) {
		String delStatement = this.getNameSpace()+".delById";
		this.sqlSessionTemplate.delete(delStatement, id);
	}

	@Override
	public void update(Object entity, Object paramsPK) {
		String updateStatement = this.getNameSpace()+".update";
		sqlSessionTemplate.update(updateStatement, paramsPK);
	}

	@Override
	public Object findById(int id) {
		String findStatement = this.getNameSpace()+".findById";
		return sqlSessionTemplate.selectOne(findStatement, id);
	}

	@Override
	public Object findBySql(String sql, String params) {
		String findStatement = this.getNameSpace()+"."+sql;
		return sqlSessionTemplate.selectOne(findStatement, params);
	};
	
	

}
