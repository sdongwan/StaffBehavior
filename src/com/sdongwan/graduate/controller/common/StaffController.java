package com.sdongwan.graduate.controller.common;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.model.Staff;
import com.sdongwan.graduate.service.StaffService;

/**
* @author sdongwan 
* @version 创建时间：2018年4月23日 下午10:44:51
*/
@RequestMapping({ "/staff" })
@Controller
public class StaffController {
	
	@Resource
	private StaffService staffService;
	
	@RequestMapping({ "list" })
	public ModelAndView listStaff(HttpServletRequest request) {
		return new ModelAndView("/console/staff/staffList");
	}
	
	@RequestMapping({ "add" })
	public ModelAndView addStaff(HttpServletRequest request) {
		return new ModelAndView("/console/staff/staffAdd");
	}
	
	@RequestMapping({ "update" })
	public ModelAndView updateStaff(HttpServletRequest request) {
		return new ModelAndView("/console/staff/staffUpdate");
	}
	
	@ResponseBody
	@RequestMapping({ "staffList" })
	public Object staffList(HttpServletRequest request) {
		List<Staff> staffs = (List<Staff>) staffService.getAll();
		
		return staffs;
	}
}
