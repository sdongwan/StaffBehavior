package com.sdongwan.graduate.dao;

import org.springframework.stereotype.Repository;

import com.sdongwan.graduate.dao.base.BaseDao;
import com.sdongwan.graduate.model.SysUser;

/**
 * 系统用户dao
 * 
 * @author      宋东皖
 * @date        2018年4月21日 下午1:32:34
 */
@Repository
public class SysUserDao extends BaseDao{

	@Override
	public String getNameSpace() {
		return SysUser.class.getName();
	}
}
