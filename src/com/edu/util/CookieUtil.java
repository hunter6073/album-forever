package com.edu.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.util.base64.BASE64Decoder;
import com.edu.util.base64.BASE64Encoder;

/**
 * Cookie操作方法类
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class CookieUtil {
	
	/**
	 * 插入一个新cookie
	 * @param response 页面应答
	 * @param name
	 *            cookie名字
	 * @param value
	 *            cookie值
	 * @param maxAge
	 *            cookie生命周期 以秒为单位
	 */
	public static void addCookie(HttpServletResponse response, String name,
			String value, int maxAge) {
		Cookie cookie = new Cookie(name, encryptString(value));
		cookie.setPath("/");
		if (maxAge > 0) {
			cookie.setMaxAge(maxAge);
		}
		response.addCookie(cookie);
	}

	/**
	 * 读取浏览器的Cookie
	 * @param request 页面请求
	 * @return 返回存储所有cookie的Map
	 */
	private static Map<String, Cookie> ReadCookieMap(HttpServletRequest request) {
		Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (Cookie cookie : cookies) {
				cookieMap.put(cookie.getName(), cookie);
			}
		}
		return cookieMap;
	}

	/**
	 * 根据cookie名称获取cookie
	 * @param request 页面请求
	 * @param name
	 *            cookie名字
	 * @return 获取到的cookie
	 */
	public static Cookie getCookieByName(HttpServletRequest request, String name) {
		Map<String, Cookie> cookieMap = ReadCookieMap(request);

		if (cookieMap.containsKey(name)) {
			Cookie cookie = (Cookie) cookieMap.get(name);
			return cookie;
		} else {
			return null;
		}
	}

	/**
	 * 根据cookie名称删除cookie
	 * @param request 页面请求
	 * @param name cookie名称
	 * @param response 页面应答
	 */
	public static void delCookieByName(HttpServletRequest request, String name, HttpServletResponse response){
		Map<String, Cookie> cookieMap = ReadCookieMap(request);
		
		if(cookieMap.containsKey(name)){
			Cookie cookie = (Cookie) cookieMap.get(name);
			//cookie值设为空
			cookie.setValue(null);
			//cookie生命周期设为0秒
			cookie.setMaxAge(0);
			cookie.setPath("/");
			System.out.println(cookie.getName()+"：Cookie已被删除");
			response.addCookie(cookie);
		}
	}
	
	/**
	 * 加密字符串
	 * @param s 待加密字符串
	 * @return 加密后的字符串
	 */
	public static String encryptString(final String s) {
		String result = null;
		byte[] b = null;
		try {
			b = s.getBytes("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		result = new BASE64Encoder().encode(b);
		//将标准base64的加密补全位'='用'$'代替
		//result = result.replace('=', '$');
		return result;
	}

	/**
	 * 解密字符串
	 * @param s 待解密的字符串
	 * @return 解密后的字符串
	 */
	public static String decryptString(final String s) {
		//String decode = s.replace('$', '=');
		String decode = s;
		BASE64Decoder decoder = new BASE64Decoder();
		String result = null;
		byte[] b = null;
		try {
			b = decoder.decodeBuffer(decode);
			result = new String(b, "utf-8");
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public static void main(String[] args) {
		String s = "123456";
		String en = encryptString(s);
		System.out.println(en);
		System.out.println(decryptString(en));
	}
}
