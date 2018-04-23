package com.sdongwan.graduate.util;

import java.util.Collection;
import java.util.Map;

/**
* @author sdongwan 
* @version 创建时间：2018年4月22日 下午5:53:08
*/
public class BeanUtil {
	public static boolean isEmpty(Object o) {
		if (o == null) {
			return true;
		}
		
		if (o instanceof String) {
			if (((String) o).trim().length() == 0) {
				return true;
			}
		} else if (o instanceof Collection) {
			if (((Collection<?>) o).isEmpty()) {
				return true;
			}
		} else if (o.getClass().isArray()) {
			if (((Object[]) o).length == 0) {
				return false;
			}
		} else if (o instanceof Map) {
			if (((Map<?, ?>)o).isEmpty()) {
				return true;
			}
		} else if (o instanceof Long) {
		} else if (o instanceof Short) {
		} else {
			return false;
		}
		return false;
	}
}
