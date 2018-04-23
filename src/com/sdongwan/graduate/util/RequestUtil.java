package com.sdongwan.graduate.util;

import javax.servlet.http.HttpServletRequest;

/**
* @author sdongwan 
* @version 创建时间：2018年4月22日 下午6:05:29
*/
public class RequestUtil {
	/**
	 * 获取String
	 * @param request
	 * @param param
	 * @return
	 */
	public static String getString (HttpServletRequest request,String param) {
		String value = request.getParameter(param);
		if (StringUtil.isEmpty(value)) {
			value = "";
		}
		return value;
	}
	
	/**
	 * 获取String
	 * @param request
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static String getString (HttpServletRequest request,String param,String defaultValue) {
		String value = request.getParameter(param);
		if (StringUtil.isEmpty(value)) {
			return defaultValue;
		}
		return value;
	}
	
	/**
	 * 获取int
	 * @param request
	 * @param param
	 * @return
	 */
	public static int getInt (HttpServletRequest request,String param) {
		return getInt(request,param,0);
	}
	
	/**
	 * 获取int
	 * @param request
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static int getInt (HttpServletRequest request,String param,int defaultValue) {
		String value = request.getParameter(param);
		if (StringUtil.isEmpty(value)) {
			return defaultValue;
		}
		return Integer.parseInt(value);
	}
	
	/**
	 * 获取boolean
	 * @param request
	 * @param param
	 * @return
	 */
	public static boolean getBoolean (HttpServletRequest request,String param) {
		return getBoolean(request,param,false);
	}
	
	/**
	 * 获取boolean
	 * @param request
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static boolean getBoolean (HttpServletRequest request,String param,boolean defaultValue) {
		String value = request.getParameter(param);
		if (StringUtil.isEmpty(value)) {
			return defaultValue;
		}
		
		if ("true".equals(value)) {
			return true;
		}
		
		if ("false".equals(value)) {
			return false;
		}
		
		return false;
	}
	
}
