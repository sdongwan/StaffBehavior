package com.sdongwan.graduate.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sdongwan.graduate.dao.SysUserDao;
import com.sdongwan.graduate.dao.base.IEntityDao;
import com.sdongwan.graduate.model.SysUser;
import com.sdongwan.graduate.service.base.BaseService;
import com.sdongwan.graduate.util.BeanUtil;

/**
* @author sdongwan 
*/
@Service
public class SysUserService extends BaseService{

	@Resource
	private SysUserDao sysUserDao;
	
	@Override
	public IEntityDao getIEntityDao() {
		return sysUserDao;
	}
	
	/**
	 * 后台管理系统登陆业务判断
	 * @param account
	 * @param password
	 * @return
	 */
	public boolean isCanLogin (String account,String password) {
		SysUser sysUser = (SysUser) this.findBySql("findByAccount", account);
		if (BeanUtil.isEmpty(sysUser)) {
			return false;
		} 
		
		if (!password.equals(sysUser.getPassword())) {
			return false;
		}
		
		return true;
	}
	
	/**
	 * 修改用户密码
	 * @param account
	 * @param passwd
	 * @param newPasswd
	 * @return
	 */
	public Object changePasswd (String account,String passwd,String newPasswd) {
		SysUser sysUser = (SysUser) this.findBySql("findByAccount", account);
		if (!BeanUtil.isEmpty(sysUser)) {
			if (sysUser.getPassword().equals(passwd)) {
				HashMap<String, Object> hashmap = new HashMap<String, Object>();
				hashmap.put("account", account);
				hashmap.put("newpassword", newPasswd);
				sysUserDao.updateBySql("updateByAccountAndPasswd", hashmap);
				return ok;
			}
		}
		return error;
	}

}
