package com.sdongwan.graduate.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.service.JobService;
import com.sdongwan.graduate.util.RequestUtil;

/**
* @author sdongwan 
* @version 创建时间：2018年4月29日 下午1:49:53
*/
@RequestMapping( {"/job"} ) 
@Controller
public class JobController {
	
	@Resource
	private JobService jobService;
	
	@RequestMapping({ "list" })
	public ModelAndView listStaff(HttpServletRequest request) {
		return new ModelAndView("/console/job/jobList");
	}
	
	@RequestMapping({ "add" })
	public ModelAndView addStaff(HttpServletRequest request) {
		return new ModelAndView("/console/job/jobAdd");
	}
	
	@ResponseBody
	@RequestMapping({ "jobList" })
	public Object jobList(HttpServletRequest request) {
		return jobService.getAll();
	}
	
	@ResponseBody
	@RequestMapping({ "getJobNameAndId" })
	public Object getJobNameAndId(HttpServletRequest request) {
		int departId = RequestUtil.getInt(request, "departId");
		return jobService.getList("getjobNameAndId", departId);
	}
	
}
