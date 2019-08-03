package com.edu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.edu.entity.User;
import com.edu.util.IpGetUtil;


/**
 * 访问需要登录页面的拦截器
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj)throws Exception{
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		if(u == null){
			response.sendRedirect("login.jsp");
			return false;
		}
		
		return true;
	}
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView modelAndView)throws Exception{
		
	}
	
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception ex)throws Exception{
		
	}
}
