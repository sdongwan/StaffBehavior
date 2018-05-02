package com.sdongwan.graduate.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.model.Job;
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
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("/console/job/jobList");
	}
	
	@RequestMapping({ "add" })
	public ModelAndView add(HttpServletRequest request) {
		return new ModelAndView("/console/job/jobAdd");
	}
	
	@RequestMapping({ "update" })
	public ModelAndView update(HttpServletRequest request) {
		return new ModelAndView("/console/job/jobUpdate");
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
	
	@ResponseBody
	@RequestMapping( {"getJobById"} )
	public Object getDepartById (HttpServletRequest request) {
		int jobId = RequestUtil.getInt(request, "jobId");
		return jobService.findById(jobId);
	}
	
	@RequestMapping({ "addJob" })
	@ResponseBody
	public Object addJob(HttpServletRequest request) {
		String jobName = RequestUtil.getString(request, "jobName");
		int departId = RequestUtil.getInt(request, "departId");
		String createTime = RequestUtil.getString(request, "createTime");
		String remark = RequestUtil.getString(request, "remark");
		
		Job job = new Job();
		job.setJobName(jobName);
		job.setRemark(remark);
		job.setDepartId(departId);
		job.setCreateTime(createTime);
		
		try {
			return jobService.insert(job);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@ResponseBody
	@RequestMapping( {"updateJob"} )
	public Object updateJob (HttpServletRequest request) {
		int jobId = RequestUtil.getInt(request, "jobId");
		int departId = RequestUtil.getInt(request, "departId");
		String jobName = RequestUtil.getString(request, "jobName");
		String remark = RequestUtil.getString(request, "remark");
		
		Job job = new Job();
		job.setJobId(jobId);
		job.setJobName(jobName);
		job.setRemark(remark);
		job.setDepartId(departId);
		
		try {
			jobService.updById(job);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	

	@ResponseBody
	@RequestMapping( {"delJob"} )
	public Object delJob (HttpServletRequest request) {
		int jobId = RequestUtil.getInt(request, "jobId");
		try {
			return jobService.delById(jobId);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
}
