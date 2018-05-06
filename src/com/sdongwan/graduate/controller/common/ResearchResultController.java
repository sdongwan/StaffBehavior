package com.sdongwan.graduate.controller.common;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdongwan.graduate.model.Research;
import com.sdongwan.graduate.model.ResearchResult;
import com.sdongwan.graduate.service.ResearchResultService;
import com.sdongwan.graduate.service.ResearchService;
import com.sdongwan.graduate.util.RequestUtil;

/**
* @author sdongwan 
* @version 创建时间：2018年5月6日 下午2:12:00
*/
@RequestMapping( {"/researchResult"} ) 
@Controller
public class ResearchResultController {
	@Resource
	private ResearchService researchService;
	@Resource
	private ResearchResultService researchResultService;
	
	@RequestMapping({ "addResearchResult" })
	@ResponseBody
	public Object addResearchResult(HttpServletRequest request) {
		List<Research> researchList = (List<Research>) researchService.getAll();
		int staffId = RequestUtil.getInt(request, "staffId");
		try {
			for (Research research : researchList) {
				String researchReply = RequestUtil.getString(request, "researchReply"+research.getResearchId());
				ResearchResult researchResult = new ResearchResult();
				researchResult.setStaffId(staffId);
				researchResult.setResearchReply(researchReply);
				researchResult.setResearchId(research.getResearchId());
				researchResultService.insert(researchResult);
			}
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
}
