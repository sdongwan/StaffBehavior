package com.sdongwan.graduate.controller.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
* @author sdongwan 
* @version 创建时间：2018年4月23日 下午10:44:51
*/
@RequestMapping({ "/depart" })
@Controller
public class DepartController {
	
	@RequestMapping({ "list" })
	public ModelAndView listStaff(HttpServletRequest request) {
		return new ModelAndView("/console/depart/departList");
	}
	
	@RequestMapping({ "add" })
	public ModelAndView addStaff(HttpServletRequest request) {
		return new ModelAndView("/console/depart/departAdd");
	}
	
	@RequestMapping({ "update" })
	public ModelAndView updateStaff(HttpServletRequest request) {
		return new ModelAndView("/console/depart/departUpdate");
	}
}
