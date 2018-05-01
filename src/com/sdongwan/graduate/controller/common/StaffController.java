package com.sdongwan.graduate.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.model.Depart;
import com.sdongwan.graduate.model.Staff;
import com.sdongwan.graduate.service.StaffService;
import com.sdongwan.graduate.util.RequestUtil;

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
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("/console/staff/staffList");
	}
	
	@RequestMapping({ "add" })
	public ModelAndView add(HttpServletRequest request) {
		return new ModelAndView("/console/staff/staffAdd");
	}
	
	@RequestMapping({ "update" })
	public ModelAndView update(HttpServletRequest request) {
		return new ModelAndView("/console/staff/staffUpdate");
	}
	
	@ResponseBody
	@RequestMapping({ "staffList" })
	public Object staffList(HttpServletRequest request) {
		return staffService.getAll();
	}
	
	@ResponseBody
	@RequestMapping( {"getStaffById"} )
	public Object getStaffById (HttpServletRequest request) {
		int departId = RequestUtil.getInt(request, "staffId");
		return staffService.findById(departId);
	}
	
	
	@ResponseBody
	@RequestMapping( {"updateStaff"} )
	public Object updateStaff (HttpServletRequest request) {
		int staffId = RequestUtil.getInt(request, "staffId");
		String staffName = RequestUtil.getString(request, "staffName");
		int gender = RequestUtil.getInt(request, "gender");
		int married = RequestUtil.getInt(request, "married");
		String birthday = RequestUtil.getString(request, "birthday");
		String hometown = RequestUtil.getString(request, "hometown");
		String education = RequestUtil.getString(request, "education");
		String graduateSchool = RequestUtil.getString(request, "graduateSchool");
		String remark = RequestUtil.getString(request, "remark");
		String account = RequestUtil.getString(request, "account");
		int departId = RequestUtil.getInt(request, "departId");
		String salary = RequestUtil.getString(request, "salary");
		
		Staff staff = new Staff();
		staff.setStaffId(staffId);
		staff.setStaffName(staffName);
		staff.setGender(gender);
		staff.setMarried(married);
		staff.setBirthday(birthday);
		staff.setHometown(hometown);
		staff.setEducation(education);
		staff.setGraduateSchool(graduateSchool);
		staff.setRemark(remark);
		staff.setAccount(account);
		staff.setSalary(salary);
		
		try {
			staffService.updById(staff);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	
	@ResponseBody
	@RequestMapping( {"addStaff"} )
	public Object addStaff (HttpServletRequest request) {
		String staffName = RequestUtil.getString(request, "staffName");
		int gender = RequestUtil.getInt(request, "gender");
		int married = RequestUtil.getInt(request, "married");
		String birthday = RequestUtil.getString(request, "birthday");
		String hometown = RequestUtil.getString(request, "hometown");
		String education = RequestUtil.getString(request, "education");
		String graduateSchool = RequestUtil.getString(request, "graduateSchool");
		String remark = RequestUtil.getString(request, "remark");
		String account = RequestUtil.getString(request, "account");
		String password = RequestUtil.getString(request, "password");
		int departId = RequestUtil.getInt(request, "departId");
		int companyId = RequestUtil.getInt(request, "companyId");
		int jobId = RequestUtil.getInt(request, "jobId");
		String salary = RequestUtil.getString(request, "salary");
		String enterTime = RequestUtil.getString(request, "enterTime");
		
		Staff staff = new Staff();
		staff.setStaffName(staffName);
		staff.setGender(gender);
		staff.setMarried(married);
		staff.setBirthday(birthday);
		staff.setHometown(hometown);
		staff.setEducation(education);
		staff.setGraduateSchool(graduateSchool);
		staff.setPassword(password);
		staff.setRemark(remark);
		staff.setAccount(account);
		staff.setSalary(salary);
		staff.setDepartId(departId);
		staff.setJobId(jobId);
		staff.setEnterTime(enterTime);
		staff.setCompanyId(companyId);
		
		try {
			staffService.insert(staff);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	
	@ResponseBody
	@RequestMapping( {"delStaff"} )
	public Object delStaff (HttpServletRequest request) {
		int staffId = RequestUtil.getInt(request, "staffId");
		try {
			return staffService.delById(staffId);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	
}
