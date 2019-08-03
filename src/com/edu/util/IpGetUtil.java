package com.edu.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;


/**
 * 根据请求获取用户IP
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class IpGetUtil {
	/**
	 * 绕过反向代理软件，跟踪原始客户端请求IP
	 * @param request 页面请求
	 * @return 客户端真实IP
	 */
	public static String getIpAddress(HttpServletRequest request) {
		//反向代理
		String ip = request.getHeader("x-forwarded-for");
		//apache http服务器代理的请求头
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		//apache http服务器weblogic插件加的头
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		//部分代理服务器会加此请求头
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		
		//弃用，HTTP_X_FORWARDED_FOR可能获取到伪造的IP;
		//因为"HTTP_X_FORWARDED_FOR"这个值是通过获取HTTP头的"X_FORWARDED_FOR"属性取得.
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//		}
		
		//nginx代理一般会加此请求头
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		//无代理直接获取IP
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		//多级反向代理
		if(StringUtils.contains(ip, ",")){
			ip = StringUtils.substringBefore(ip, ",");
		}
		return ip;
	}
}
