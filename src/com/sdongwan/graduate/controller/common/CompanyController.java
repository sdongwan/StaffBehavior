package com.sdongwan.graduate.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdongwan.graduate.service.CompanyService;

/**
* @author sdongwan 
* @version 创建时间：2018年4月23日 下午10:44:51
*/
@RequestMapping({ "/company" })
@Controller
public class CompanyController {
	
	@Resource
	private CompanyService companyService;
	
	@ResponseBody
	@RequestMapping( {"getAll"} )
	public Object getAll(HttpServletRequest request) {
		return companyService.getAll();
	}
}
