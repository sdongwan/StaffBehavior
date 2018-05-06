package com.sdongwan.graduate.controller.system;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.model.Research;
import com.sdongwan.graduate.model.Staff;
import com.sdongwan.graduate.service.ResearchService;
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
	
	@Resource
	private ResearchService researchService;
	
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
	
	@RequestMapping({ "toResearch" })
	public ModelAndView toResearch(HttpServletRequest request) {
		String account = RequestUtil.getString(request, "account");
		Staff staff = (Staff) staffService.findBySql("findByAccount", account);
		List<Research> researchList = (List<Research>) researchService.getAll();
		return new ModelAndView("/system/systemResearch")
				.addObject("staff", staff)
				.addObject("researchList", researchList);
	}
	
	/**
	 * 转页到问卷调查界面
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping({ "research" })
	public Object research(HttpServletRequest request) {
		String account = RequestUtil.getString(request, "account");
		String password = RequestUtil.getString(request, "password");
		boolean flag=staffService.isCanLogin(account, password);
		if (!flag) {
			return "account and password wrong";
		}
		return "ok";
	}
}
