package com.sdongwan.graduate.util;
/**
* @author sdongwan 
* @version 创建时间：2018年4月22日 下午5:53:18
*/
public class StringUtil {
	
	public static boolean isEmpty(String str) {
		if (str == null)
			return true;
		if (str.trim().equals(""))
			return true;
		return false;
	}

}
