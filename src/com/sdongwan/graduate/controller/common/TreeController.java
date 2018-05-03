package com.sdongwan.graduate.controller.common;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* @author sdongwan 
* @version 创建时间：2018年4月22日 下午11:21:53
*/
@RequestMapping({ "/tree" })
@Controller
public class TreeController {
	
	@RequestMapping( value = {"treeMenu"} ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String treeMenu(HttpServletRequest request) {
		org.json.JSONArray jsonArray =new org.json.JSONArray();
		JSONObject jsonObject =new JSONObject();
		JSONObject jsonObject1 =new JSONObject();
		JSONObject jsonObject2 =new JSONObject();
		JSONObject jsonObject3 =new JSONObject();
		JSONObject jsonObject4 =new JSONObject();
		JSONObject jsonObject3_1 =new JSONObject();
		JSONObject jsonObject3_2 =new JSONObject();
		try {
			jsonObject.put("id", "1");
			jsonObject.put("url", "depart");
			jsonObject.put("text", "部门管理");
			
			jsonObject1.put("id", "2");
			jsonObject1.put("url", "staff");
			jsonObject1.put("text", "员工管理");
			
			jsonObject2.put("id", "3");
			jsonObject2.put("url", "research");
			jsonObject2.put("text", "调查统计");
			
			jsonObject4.put("id", "4");
			jsonObject4.put("url", "job");
			jsonObject4.put("text", "职位管理");
			
			jsonObject3.put("text", "系统设置");
			jsonObject3.put("id", "5");
			
			jsonObject3_2.put("id", "6");
			jsonObject3_2.put("url", "changePassword");
			jsonObject3_2.put("pid", "5");
			jsonObject3_2.put("text", "修改密码");
			
			jsonObject3_1.put("id", "7");
			jsonObject3_1.put("url", "logout");
			jsonObject3_1.put("pid", "5");
			jsonObject3_1.put("text", "退出系统");
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		jsonArray.put(jsonObject);
		jsonArray.put(jsonObject1);
		jsonArray.put(jsonObject2);
		jsonArray.put(jsonObject4);
		jsonArray.put(jsonObject3);
		jsonArray.put(jsonObject3_2);
		jsonArray.put(jsonObject3_1);
		
		String data=jsonArray.toString();
		System.out.println("data: "+data);
		return data;
	}
	
	@RequestMapping( value = {"staffTree"} ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object staffTree (HttpServletRequest request) {
		org.json.JSONArray jsonArray =new org.json.JSONArray();
		JSONObject jsonObject =new JSONObject();
		JSONObject jsonObject1 =new JSONObject();
		JSONObject jsonObject2 =new JSONObject();
		try {
			
			jsonObject.put("id", "0");
			jsonObject.put("text", "员工管理");
			
			jsonObject1.put("id", "1");
			jsonObject1.put("url", "list");
			jsonObject1.put("pid", "0");
			jsonObject1.put("text", "员工列表");
			
			jsonObject2.put("id", "2");
			jsonObject2.put("url", "add");
			jsonObject2.put("pid", "0");
			jsonObject2.put("text", "添加员工");
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		jsonArray.put(jsonObject);
		jsonArray.put(jsonObject1);
		jsonArray.put(jsonObject2);
		
		String data=jsonArray.toString();
		System.out.println("data: "+data);
		return data;
	}
	
	@RequestMapping( value = {"departTree"} ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object departTree (HttpServletRequest request) {
		org.json.JSONArray jsonArray =new org.json.JSONArray();
		JSONObject jsonObject =new JSONObject();
		JSONObject jsonObject1 =new JSONObject();
		JSONObject jsonObject2 =new JSONObject();
		try {
			
			jsonObject.put("id", "0");
			jsonObject.put("text", "部门管理");
			
			jsonObject1.put("id", "1");
			jsonObject1.put("url", "list");
			jsonObject1.put("pid", "0");
			jsonObject1.put("text", "部门列表");
			
			jsonObject2.put("id", "2");
			jsonObject2.put("url", "add");
			jsonObject2.put("pid", "0");
			jsonObject2.put("text", "添加部门");
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		jsonArray.put(jsonObject);
		jsonArray.put(jsonObject1);
		jsonArray.put(jsonObject2);
		
		String data=jsonArray.toString();
		return data;
	}
	
	@RequestMapping( value = {"jobTree"} ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object jobTree (HttpServletRequest request) {
		org.json.JSONArray jsonArray =new org.json.JSONArray();
		JSONObject jsonObject =new JSONObject();
		JSONObject jsonObject1 =new JSONObject();
		JSONObject jsonObject2 =new JSONObject();
		try {
			
			jsonObject.put("id", "0");
			jsonObject.put("text", "职位管理");
			
			jsonObject1.put("id", "1");
			jsonObject1.put("url", "list");
			jsonObject1.put("pid", "0");
			jsonObject1.put("text", "职位列表");
			
			jsonObject2.put("id", "2");
			jsonObject2.put("url", "add");
			jsonObject2.put("pid", "0");
			jsonObject2.put("text", "添加职位");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		jsonArray.put(jsonObject);
		jsonArray.put(jsonObject1);
		jsonArray.put(jsonObject2);
		
		String data=jsonArray.toString();
		return data;
	}
	
	@RequestMapping( value = {"factorTree"} ,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object factorTree (HttpServletRequest request) {
		org.json.JSONArray jsonArray =new org.json.JSONArray();
		JSONObject jsonObject =new JSONObject();
		JSONObject jsonObject1 =new JSONObject();
		JSONObject jsonObject2 =new JSONObject();
		JSONObject jsonObject3 =new JSONObject();
		JSONObject jsonObject4 =new JSONObject();
		try {
			
			jsonObject.put("id", "0");
			jsonObject.put("text","员工行为分析");
			
			jsonObject1.put("id", "1");
			jsonObject1.put("url", "/research/list.do");
			jsonObject1.put("pid", "0");
			jsonObject1.put("text", "问题列表");
			
			jsonObject2.put("id", "2");
			jsonObject2.put("url", "/factor/list.do");
			jsonObject2.put("pid", "0");
			jsonObject2.put("text", "因素管理");
			
			jsonObject3.put("id", "3");
			jsonObject3.put("url", "/research/add.do");
			jsonObject3.put("pid", "0");
			jsonObject3.put("text", "添加问题");
			
			
			jsonObject4.put("id", "4");
			jsonObject4.put("url", "add");
			jsonObject4.put("pid", "0");
			jsonObject4.put("text", "统计分析");
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		jsonArray.put(jsonObject);
		jsonArray.put(jsonObject1);
		jsonArray.put(jsonObject2);
		jsonArray.put(jsonObject3);
		jsonArray.put(jsonObject4);
		
		String data=jsonArray.toString();
		return data;
	}
	
}
