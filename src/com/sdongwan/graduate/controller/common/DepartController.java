package com.sdongwan.graduate.controller.common;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdongwan.graduate.model.Depart;
import com.sdongwan.graduate.service.DepartService;
import com.sdongwan.graduate.util.PageUtil;
import com.sdongwan.graduate.util.RequestUtil;

/**
* @author sdongwan 
* @version 创建时间：2018年4月23日 下午10:44:51
*/
@RequestMapping({ "/depart" })
@Controller
public class DepartController {
	
	@Resource
	private DepartService departService;
	
	@RequestMapping({ "list" })
	public ModelAndView list(HttpServletRequest request) {
		return new ModelAndView("/console/depart/departList");
	}
	
	@RequestMapping({ "add" })
	public ModelAndView add(HttpServletRequest request) {
		int maxDepartId = (int) departService.getOne("getMaxDepartId", null);
		Depart depart = new Depart();
		depart.setDepartId(maxDepartId+1);
		return new ModelAndView("/console/depart/departAdd").addObject("depart", depart);
	}
	
	@RequestMapping({ "update" })
	public ModelAndView update(HttpServletRequest request) {
		return new ModelAndView("/console/depart/departUpdate");
	}
	
	@ResponseBody
	@RequestMapping(value="getDepartByPage",produces = "application/json; charset=utf-8")
	public Object departList(HttpServletRequest request) {
		String companyName = RequestUtil.getString(request, "companyName");
		int pageIndex = RequestUtil.getInt(request, "pageIndex");
		int pageSize = RequestUtil.getInt(request, "pageSize");
		int begin = pageIndex*pageSize;
		int end = begin + pageSize;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("begin", begin);
		hashmap.put("end", end);
		hashmap.put("companyName", companyName);
		List<Depart> departs = (List<Depart>) departService.getList("getListByPage", hashmap);
		int count = (int) departService.getOne("getCount", null);
		String result = PageUtil.makeData(count, departs);
		return result;
	}
	
	@ResponseBody
	@RequestMapping( {"addDepart"} )
	public Object addDepart(HttpServletRequest request) {
		int departId = RequestUtil.getInt(request, "departId");
		int companyId = RequestUtil.getInt(request, "companyId");
		String departName = RequestUtil.getString(request, "departName");
		String remark = RequestUtil.getString(request, "remark");
		
		Depart depart = new Depart();
		depart.setCompanyId(companyId);
		depart.setDepartId(departId);
		depart.setDepartName(departName);
		depart.setRemark(remark);
		try {
			return departService.insert(depart);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@ResponseBody
	@RequestMapping( {"delDepart"} )
	public Object delDepart (HttpServletRequest request) {
		int departId = RequestUtil.getInt(request, "departId");
		try {
			return departService.delById(departId);
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@ResponseBody
	@RequestMapping( {"updateDepart"} )
	public Object updateDepart (HttpServletRequest request) {
		int departId = RequestUtil.getInt(request, "departId");
		String departName = RequestUtil.getString(request, "departName");
		String remark = RequestUtil.getString(request, "remark");
		
		Depart depart = new Depart();
		depart.setDepartId(departId);
		depart.setDepartName(departName);
		depart.setRemark(remark);
		try {
			departService.updById(depart);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
	}
	
	@ResponseBody
	@RequestMapping( {"getDepartById"} )
	public Object getDepartById (HttpServletRequest request) {
		int departId = RequestUtil.getInt(request, "departId");
		return departService.findById(departId);
	}
	
	@ResponseBody
	@RequestMapping( {"getDepartList"} )
	public Object getDepartList(HttpServletRequest request) {
		return departService.getList("getDepartNameAndId", null);
	}
}
