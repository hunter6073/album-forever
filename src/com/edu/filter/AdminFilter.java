package com.edu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.edu.entity.Employee;
import com.edu.entity.User;

/**
 * 后台过滤器
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class AdminFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		response.setCharacterEncoding("utf-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String url = req.getServletPath();
		String contextPath = req.getContextPath();
		String extension = url.substring(url.lastIndexOf(".") + 1);
		
		HttpSession session = req.getSession(true);

		Employee e = (Employee) session.getAttribute("employee");
		System.out.println(url);
		System.out.println(contextPath);
		if (extension.equals("css") || extension.equals("js")
				|| extension.equals("xml") || extension.equals("properties")
				|| extension.equals("gif") || extension.equals("png")) {
			chain.doFilter(request, response);
		} else if (e == null && extension.equals("jsp")) {
			//session.setAttribute("filterUrl", url);
			res.sendRedirect(contextPath+"/admin_login.jsp");
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
