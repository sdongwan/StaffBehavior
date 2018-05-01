package com.sdongwan.graduate.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.service.FactorService;

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
}
