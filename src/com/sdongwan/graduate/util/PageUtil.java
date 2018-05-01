package com.sdongwan.graduate.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
* @author sdongwan 
* @version 创建时间：2018年5月1日 下午2:29:52
*/
public class PageUtil {
	
	public static String makeData(int total,Object data) {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(data);     
		jsonObject.put("total", total);
		jsonObject.put("data", jsonArray);
		return jsonObject.toString();
	}
}
