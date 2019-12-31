package com.common.util;

import javax.servlet.http.HttpServletRequest;

public class IpCheck {

	public static String getUserIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWORDED-FOR");
		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		} 
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
