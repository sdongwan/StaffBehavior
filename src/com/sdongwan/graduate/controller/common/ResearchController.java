package com.sdongwan.graduate.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.service.ResearchService;

/**
* @author sdongwan 
* @version 创建时间：2018年4月29日 下午7:52:13
*/
@RequestMapping( {"/research"} ) 
@Controller
public class ResearchController {
	
	@Resource
	private ResearchService  researchService;
	
	
	@RequestMapping( { "researchList" } ) 
	public ModelAndView researchList(HttpServletRequest request) {
		return new ModelAndView("/console/research/researchList");
	}
	
	@RequestMapping( { "researchAdd" } ) 
	public ModelAndView researchAdd(HttpServletRequest request) {
		return new ModelAndView("/console/research/researchAdd");
	}
	
	@RequestMapping( { "researchUpdate" } ) 
	public ModelAndView researchUpdate(HttpServletRequest request) {
		return new ModelAndView("/console/research/researchUpdate");
	}
	
	
	@ResponseBody
	@RequestMapping( { "list" } ) 
	public Object list(HttpServletRequest request) {
		return researchService.getAll();
	}
	
	
	
}
