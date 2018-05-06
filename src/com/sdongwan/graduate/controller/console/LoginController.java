package com.sdongwan.graduate.controller.console;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.service.SysUserService;
import com.sdongwan.graduate.util.RequestUtil;

/**
* @author sdongwan 
* @version 创建时间：2018年4月22日 下午9:26:39
*/
@RequestMapping({ "/console" })
@Controller
public class LoginController {
	
	@Resource
	private SysUserService sysUserService;
	
	/**
	 * 转页到登陆页面
	 * @param request
	 * @return
	 */
	@RequestMapping({ "login" })
	public ModelAndView login(HttpServletRequest request) {
		return new ModelAndView("/console/consoleLogin");
	}
	
	/**
	 * 退出系统登陆
	 * @param request
	 * @return
	 */
	@RequestMapping({ "logout" })
	public ModelAndView logout(HttpServletRequest request) {
		return new ModelAndView("redirect:"+"/console/login.do");
	}
	
	
	/**
	 * 退出系统登陆
	 * @param request
	 * @return
	 */
	@RequestMapping({ "toHome" })
	public ModelAndView toHome(HttpServletRequest request) {
		return new ModelAndView("/console/consoleHome");
	}
	
	/**
	 * 转页到后台管理系统首页面
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping({ "home" })
	public Object home(HttpServletRequest request) {
		String account = RequestUtil.getString(request, "account");
		String password = RequestUtil.getString(request, "password");
		boolean flag=sysUserService.isCanLogin(account, password);
		if (!flag) {
			return "account or password wrong";
		}
		return "ok";
	}
}
