package com.sdongwan.graduate.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sdongwan.graduate.dao.StaffDao;
import com.sdongwan.graduate.dao.base.IEntityDao;
import com.sdongwan.graduate.model.Staff;
import com.sdongwan.graduate.service.base.BaseService;
import com.sdongwan.graduate.util.BeanUtil;

/**
* @author sdongwan 
*/
@Service
public class StaffService extends BaseService {

	@Resource
	private StaffDao staffDao;
	
	@Override
	public IEntityDao getIEntityDao() {
		return staffDao;
	}
	
	/**
	 * 判断员工登陆账号密码是否正确
	 * @param account
	 * @param password
	 * @return
	 */
	public boolean isCanLogin (String account,String password) {
		Staff staff = (Staff) this.findBySql("findByAccount", account);
		if (BeanUtil.isEmpty(staff)) {
			return false;
		} 
		
		if (!password.equals(staff.getPassword())) {
			return false;
		}
		
		return true;
	}
	
	

}
