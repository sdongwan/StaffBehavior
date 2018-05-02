package com.sdongwan.graduate.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.model.Factor;
import com.sdongwan.graduate.model.Job;
import com.sdongwan.graduate.service.FactorService;
import com.sdongwan.graduate.util.RequestUtil;

/**
* @author sdongwan 
* @version 创建时间：2018年4月23日 下午10:44:51
*/
@RequestMapping({ "/factor" })
@Controller
public class FactorController {
	
	@Resource
	private FactorService factorService;
	
	@RequestMapping( { "factorList" } ) 
	public ModelAndView factorList(HttpServletRequest request) {
		return new ModelAndView("/console/factor/factorList");
	}
	
	@RequestMapping( { "factorAdd" } ) 
	public ModelAndView factorAdd(HttpServletRequest request) {
		return new ModelAndView("/console/factor/factorAdd");
	}
	
	@RequestMapping( { "factorUpdate" } ) 
	public ModelAndView factorUpdate(HttpServletRequest request) {
		return new ModelAndView("/console/factor/factorUpdate");
	}
	
	@ResponseBody
	@RequestMapping( { "list" } ) 
	public Object list(HttpServletRequest request) {
		return factorService.getAll();
	}
	
	
	@RequestMapping({ "addFactor" })
	@ResponseBody
	public Object addFactor(HttpServletRequest request) {
		String factorName = RequestUtil.getString(request, "factorName");
		String createTime = RequestUtil.getString(request, "createTime");
		String remark = RequestUtil.getString(request, "remark");
		
		Factor factor = new Factor();
		factor.setFactorName(factorName);
		factor.setRemark(remark);
		factor.setCreateTime(createTime);
		
		try {
			return factorService.insert(factor);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@ResponseBody
	@RequestMapping( {"updateFactor"} )
	public Object updateFactor (HttpServletRequest request) {
		int factorId = RequestUtil.getInt(request, "factorId");
		String factorName = RequestUtil.getString(request, "factorName");
		String createTime = RequestUtil.getString(request, "createTime");
		String remark = RequestUtil.getString(request, "remark");
		
		Factor factor = new Factor();
		factor.setFactorName(factorName);
		factor.setRemark(remark);
		factor.setCreateTime(createTime);
		factor.setFactorId(factorId);
		
		try {
			factorService.updById(factor);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	

	@ResponseBody
	@RequestMapping( {"delFactor"} )
	public Object delFactor (HttpServletRequest request) {
		int factorId = RequestUtil.getInt(request, "factorId");
		try {
			return factorService.delById(factorId);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@ResponseBody
	@RequestMapping( {"getFactorById"} )
	public Object getFactorById (HttpServletRequest request) {
		int factorId = RequestUtil.getInt(request, "factorId");
		return factorService.findById(factorId);
	}
}

