package com.sdongwan.graduate.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdongwan.graduate.service.SysUserService;
import com.sdongwan.graduate.util.RequestUtil;

/**
* @author sdongwan 
* @version 创建时间：2018年4月23日 下午10:44:51
*/
@RequestMapping({ "/sysUser" })
@Controller
public class SysUserController {
	
	@Resource
	private SysUserService sysUserService;
	
	/**
	 * 修改SysUser密码
	 * @param request
	 * @return
	 */
	@RequestMapping("changePasswd")
	@ResponseBody
	public Object changePasswd (HttpServletRequest request) {
		String account = RequestUtil.getString(request, "account");
		String passwd = RequestUtil.getString(request, "password");
		String newPasswd = RequestUtil.getString(request, "newpassword");
		try {
			return  sysUserService.changePasswd(account, passwd, newPasswd);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
}
