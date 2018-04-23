package com.sdongwan.graduate.controller.system;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.service.StaffService;
import com.sdongwan.graduate.util.RequestUtil;

/**
* @author sdongwan 
* @version 创建时间：2018年4月22日 上午11:01:19
*/
@Controller
@RequestMapping({ "/system" })
public class SystemController {
	
	@Resource
	private StaffService staffService;
	
	/**
	 * 转页到登陆页面
	 * @param request
	 * @return
	 */
	@RequestMapping({ "login" })
	public ModelAndView login(HttpServletRequest request) {
		return new ModelAndView("/system/systemLogin");
	}
	
	/**
	 * 退出系统登陆
	 * @param request
	 * @return
	 */
	@RequestMapping({ "logout" })
	public ModelAndView logout(HttpServletRequest request) {
		return new ModelAndView("redirect:"+"/system/login.do");
	}
	
	/**
	 * 转页到问卷调查界面
	 * @param request
	 * @return
	 */
	@RequestMapping({ "research" })
	public ModelAndView research(HttpServletRequest request) {
		String account = RequestUtil.getString(request, "account");
		String password = RequestUtil.getString(request, "password");
		boolean flag=staffService.isCanLogin(account, password);
		System.out.println("flag "+flag);
		if (!flag) {
			return new ModelAndView("/system/systemLogin");
		}
		return new ModelAndView("/system/systemResearch");
	}
}
