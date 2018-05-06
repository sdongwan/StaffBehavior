package com.sdongwan.graduate.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.model.Research;
import com.sdongwan.graduate.service.ResearchService;
import com.sdongwan.graduate.util.RequestUtil;

/**
* @author sdongwan 
* @version 创建时间：2018年4月29日 下午7:52:13
*/
@RequestMapping( {"/research"} ) 
@Controller
public class ResearchController {
	
	@Resource
	private ResearchService  researchService;
	
	
	@RequestMapping( { "list" } ) 
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("/console/research/researchList");
	}
	
	@RequestMapping( { "add" } ) 
	public ModelAndView add(HttpServletRequest request) {
		return new ModelAndView("/console/research/researchAdd");
	}
	
	@RequestMapping( { "update" } ) 
	public ModelAndView update(HttpServletRequest request) {
		return new ModelAndView("/console/research/researchUpdate");
	}
	
	@RequestMapping( { "analyze" } ) 
	public ModelAndView analyze(HttpServletRequest request) {
		return new ModelAndView("/console/researchAnalyze");
	}
	
	@ResponseBody
	@RequestMapping( { "listResearch" } ) 
	public Object listResearch(HttpServletRequest request) {
		return researchService.getAll();
	}
	
	@RequestMapping({ "addResearch" })
	@ResponseBody
	public Object addResearch(HttpServletRequest request) {
		String question = RequestUtil.getString(request, "question");
		int factorId = RequestUtil.getInt(request, "factorId");
		int validFlag = RequestUtil.getInt(request, "validFlag");
		
		Research research =new Research();
		research.setQuestion(question);
		research.setFactorId(factorId);
		research.setValidFlag(validFlag);
		
		try {
			return researchService.insert(research);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@ResponseBody
	@RequestMapping( {"updateResearch"} )
	public Object updateResearch (HttpServletRequest request) {
		int researchId = RequestUtil.getInt(request, "researchId");
		int factorId = RequestUtil.getInt(request, "factorId");
		int validFlag = RequestUtil.getInt(request, "validFlag");
		String question = RequestUtil.getString(request, "question");
		String remark = RequestUtil.getString(request, "remark");
		
		Research research =new Research();
		research.setQuestion(question);
		research.setResearchId(researchId);
		research.setFactorId(factorId);
		research.setValidFlag(validFlag);
		
		try {
			researchService.updById(research);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	

	@ResponseBody
	@RequestMapping( {"delResearch"} )
	public Object delFactor (HttpServletRequest request) {
		int researchId = RequestUtil.getInt(request, "researchId");
		try {
			return researchService.delById(researchId);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@ResponseBody
	@RequestMapping( {"getResearchById"} )
	public Object getFactorById (HttpServletRequest request) {
		int researchId = RequestUtil.getInt(request, "researchId");
		return researchService.findById(researchId);
	}
	
}
