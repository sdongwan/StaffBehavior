package com.sdongwan.graduate.controller.console;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
* @author sdongwan 
* @version 创建时间：2018年4月23日 下午9:32:18
*/
@RequestMapping({ "/admin" })
@Controller
public class ConsoleController {
	
	/**
	 * 转页部门管理界面
	 * @param request
	 * @return
	 */
	@RequestMapping({ "depart" })
	public ModelAndView departManage(HttpServletRequest request) {
		return new ModelAndView("/console/adminDepart");
	}
	
	/**
	 * 转页部门管理界面
	 * @param request
	 * @return
	 */
	@RequestMapping({ "staff" })
	public ModelAndView staffManage(HttpServletRequest request) {
		return new ModelAndView("/console/adminStaff");
	}
	
	/**
	 * 转页职位管理界面
	 * @param request
	 * @return
	 */
	@RequestMapping({ "job" })
	public ModelAndView jobManage(HttpServletRequest request) {
		return new ModelAndView("/console/adminJob");
	}
	
	/**
	 * 转页部门管理界面
	 * @param request
	 * @return
	 */
	@RequestMapping({ "research" })
	public ModelAndView researchStats(HttpServletRequest request) {
		return new ModelAndView("/console/adminResearch");
	}
	
	/**
	 * 转页部门管理界面
	 * @param request
	 * @return
	 */
	@RequestMapping({ "changePassword" })
	public ModelAndView changePassword(HttpServletRequest request) {
		return new ModelAndView("/console/consoleChangePassword");
	}
	
	
	
}
