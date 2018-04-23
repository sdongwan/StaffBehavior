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
		JSONObject jsonObject3_1 =new JSONObject();
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
			
			jsonObject3.put("id", "4");
			jsonObject3.put("text", "系统设置");
			
			jsonObject3_1.put("id", "5");
			jsonObject3_1.put("url", "logout");
			jsonObject3_1.put("pid", "4");
			jsonObject3_1.put("text", "退出系统");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		jsonArray.put(jsonObject);
		jsonArray.put(jsonObject1);
		jsonArray.put(jsonObject2);
		jsonArray.put(jsonObject3);
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
		JSONObject jsonObject3 =new JSONObject();
		
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
			
			jsonObject3.put("id", "3");
			jsonObject3.put("url", "update");
			jsonObject3.put("text", "修改员工信息");
			jsonObject3.put("pid", "0");
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		jsonArray.put(jsonObject);
		jsonArray.put(jsonObject1);
		jsonArray.put(jsonObject2);
		jsonArray.put(jsonObject3);
		
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
		JSONObject jsonObject3 =new JSONObject();
		
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
			
			jsonObject3.put("id", "3");
			jsonObject3.put("url", "update");
			jsonObject3.put("text", "修改部门信息");
			jsonObject3.put("pid", "0");
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		jsonArray.put(jsonObject);
		jsonArray.put(jsonObject1);
		jsonArray.put(jsonObject2);
		jsonArray.put(jsonObject3);
		
		String data=jsonArray.toString();
		System.out.println("data: "+data);
		return data;
	}
	
}
