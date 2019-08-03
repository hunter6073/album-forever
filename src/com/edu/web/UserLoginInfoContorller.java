package com.edu.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.entity.Employee;
import com.edu.entity.User;
import com.edu.service.UserService;
import com.edu.util.CookieUtil;
import com.edu.util.MailUtil;

/**
 * 控制层 UserLoginInfoContorller类
 * 
 * @author Christin Email:869641892@qq.com MP:18392150948
 */
@Controller
public class UserLoginInfoContorller {

	// 注入UserService
	@Resource
	public UserService service;

	/**
	 * 用户登录
	 * 
	 * @param username
	 *            用户邮箱
	 * @param password
	 *            用户密码
	 * @param request
	 *            页面请求
	 * @param response
	 *            页面响应
	 * @return 查找不到相应信息留在登录页面，查找到则跳转到主页，如果用户为管理员则跳转到登录页面
	 */
	@RequestMapping("/login_form.form")
	public String login(String username, String password,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String filterUrl = (String) session.getAttribute("filterUrl");

		User user = service.user_login(username, password);

		if (user == null) {
			request.setAttribute("userNotFound", "用户名或密码错误");
			return "login";
		} else if("0".equals(user.getFreeze())){
			if (filterUrl == null || "".equals(filterUrl)) {
				service.updateUser(user, request);
				session.setAttribute("user", user);
				CookieUtil.addCookie(response, "EMAIL", username, 60 * 60 * 24);
				CookieUtil.addCookie(response, "PASSWORD", password,
						60 * 60 * 24);
				return "redirect:ddbx.form";
			} else {
				service.updateUser(user, request);
				session.setAttribute("user", user);
				CookieUtil.addCookie(response, "EMAIL", username, 60 * 60 * 24);
				CookieUtil.addCookie(response, "PASSWORD", password,
						60 * 60 * 24);
				return "redirect:" + filterUrl;
			}
		}else{
			service.updateUser(user, request);
			request.setAttribute("userNotFound", "账户已被冻结，请到邮箱激活");
			MailUtil.sendActiveEmail(username);
			return "login";
		}
	}

	/**
	 * 用户登出
	 * 
	 * @param request
	 *            页面请求
	 * @param response
	 *            页面响应
	 * @return 返回到登录页面
	 */
	@RequestMapping("/user_logout.form")
	public String logout(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();

		// 删除cookie
		CookieUtil.delCookieByName(request, "EMAIL", response);
		CookieUtil.delCookieByName(request, "PASSWORD", response);
		// 清空session
		session.removeAttribute("user");
		session.invalidate();

		return "redirect:login.jsp";
	}
	
	@RequestMapping("/admin_logout.form")
	public String adminlogout(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		// 清空session
		session.removeAttribute("employee");
		session.invalidate();

		return "redirect:admin_login.jsp";
	}
	

	/**
	 * 根据cookie信息自动登录
	 * 
	 * @param EMAIL
	 *            获取到的邮箱
	 * @param PASSWORD
	 *            获取到的密码
	 * @param request
	 *            页面请求
	 * @param response
	 *            页面响应
	 * @return 登录失败留在登录页面，登录成功跳转至主页，管理员则跳转至管理员登录页面
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/cookie_login.form")
	@ResponseBody
	public String cookieLogin(String EMAIL, String PASSWORD,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String filterUrl = (String) session.getAttribute("filterUrl");
		String username = CookieUtil.decryptString(EMAIL);
		String password = CookieUtil.decryptString(PASSWORD);
		System.out.println(username);
		System.out.println(password);

		User user = service.user_login(username, password);

		if (user == null) {
			session.invalidate();
			CookieUtil.delCookieByName(request, "EMAIL", response);
			CookieUtil.delCookieByName(request, "PASSWORD", response);
			
			System.out.println("用户名或密码错误");
			
			return "login.jsp";
		} else {
			if (filterUrl == null || "".equals(filterUrl)) {
				System.out.println("快速登录成功");
				service.updateUser(user, request);
				session.setAttribute("user", user);
				System.out.println(user.getUsername() + " ");

				return "ddbx.form";
			}else{
				service.updateUser(user, request);
				session.setAttribute("user", user);

				return filterUrl;
			}
		}
	}

	/**
	 * 管理员登录
	 * 
	 * @param admin_username
	 *            管理员邮箱
	 * @param admin_password
	 *            管理员密码
	 * @param request
	 *            页面请求
	 * @return 登录成功跳转至后台页面，登录失败留在当前页面，普通用户则跳转至普通用户登录页面
	 */
	@RequestMapping("/admin_login_form.form")
	public String adminLogin(String admin_username, String admin_password,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		Employee emp = service.admin_login(admin_username, admin_password);

		if (emp == null) {
			request.setAttribute("userNotFound", "用户名或密码错误");
			return "admin_login";
		} else {
			session.setAttribute("employee", emp);
			return "backStage";
		}
	}

	/**
	 * 用户注册
	 * 
	 * @param username
	 *            用户邮箱
	 * @param nickname
	 *            用户昵称
	 * @param password
	 *            用户密码
	 * @param request
	 *            页面请求
	 * @return 注册成功跳转至登录页面，非法操作则清空session并跳回至注册页面
	 */
	@RequestMapping("/regist_form.form")
	public String regist(String username, String nickname, String password,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object check = session.getAttribute("$5r+A5rS756CB6aqM6K+B");

		if (check != null) {
			String verify = check.toString();
			if (("$5oiQ5Yqf").equals(verify)) {
				if (service.user_regist(username, nickname, password, request)) {
					System.out.println("A new user regist");
					session.invalidate();
					return "redirect:login.jsp";
				} else {
					session.invalidate();
					return "redirect:regist.jsp";
				}
			} else {
				session.invalidate();
				return "redirect:regist.jsp";
			}
		} else {
			session.invalidate();
			return "redirect:regist.jsp";
		}
	}

	/**
	 * 邮箱重复性校验
	 * 
	 * @param ajax_username
	 *            接收前端ajax传递的用户名
	 * @param response
	 *            页面响应
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/regist_username.form")
	public void checkUsername(String ajax_username, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter ajax_out = response.getWriter();
		if (service.email_check(ajax_username)) {
			ajax_out.print("该邮箱已被注册");
		} else {

		}
	}

	/**
	 * 昵称重复性校验
	 * 
	 * @param ajax_nickname
	 *            接收前端ajax传递的昵称
	 * @param response
	 *            页面响应
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/regist_nickname.form")
	public void checkNickname(String ajax_nickname, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter ajax_out = response.getWriter();
		if (service.nickname_check(ajax_nickname)) {
			ajax_out.print("该昵称已被使用");
		} else {

		}
	}

	/**
	 * 发送激活码邮件
	 * 
	 * @param ajax_order
	 *            接收激活码的邮箱地址
	 * @param response
	 *            页面响应
	 * @param request
	 *            页面请求
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/send_email.form")
	public void sendEmail(String ajax_order, HttpServletResponse response,
			HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter ajax_out = response.getWriter();
		String vcode = service.sendVcode(ajax_order);

		if (!("").equals(vcode)) {
			System.out.println("success");
			ajax_out.print("邮件发送成功,请查收。如果找不到可以检查垃圾箱中邮件");
			session.setAttribute("vcode", vcode);
		} else {
			System.out.println("fail");
			ajax_out.print("邮件发送失败,请验证邮箱是否存在");
		}
	}

	/**
	 * 检验用户输入激活码是否正确
	 * 
	 * @param ajax_code
	 *            用户输入的激活码
	 * @param request
	 *            页面请求
	 * @param response
	 *            页面响应
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/verify_code.form")
	public void verifyCode(String ajax_code, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter ajax_out = response.getWriter();
		
		if(session.getAttribute("vcode")==null){
			ajax_out.print("fail");
		}else{
			// 获取session中的正确激活码
			String service_code = session.getAttribute("vcode").toString();
			if (service.code_check(ajax_code, service_code)) {
				// 告知后续操作激活码已经验证
				session.setAttribute("$5r+A5rS756CB6aqM6K+B", "$5oiQ5Yqf");
				ajax_out.print("success");
			} else {
				ajax_out.print("fail");
			}
		}
		
		

		
	}

	/**
	 * 判断邮箱是否注册
	 * 
	 * @param ajax_username
	 *            用户邮箱
	 * @param response
	 *            页面响应
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/check_username.form")
	public void findEmail(String ajax_username, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter ajax_out = response.getWriter();
		if (!service.email_check(ajax_username)) {
			ajax_out.print("该邮箱尚未注册");
		}
	}

	/**
	 * 修改密码
	 * 
	 * @param username
	 *            用户邮箱
	 * @param password
	 *            用户新密码
	 * @param request
	 *            页面请求
	 * @return 修改成功跳转至登录页面，非法操作则清空session并跳回至修改密码页面
	 */
	@RequestMapping("/lost_form.form")
	public String changePassword(String username, String password,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object check = session.getAttribute("$5r+A5rS756CB6aqM6K+B");

		if (check != null) {
			String verify = check.toString();
			if (("$5oiQ5Yqf").equals(verify)) {
				service.changePwd(username, password, request);
				System.out.println("A user change password");
				session.invalidate();
				return "redirect:login.jsp";
			} else {
				session.invalidate();
				return "redirect:lostpassword.jsp";
			}
		} else {
			session.invalidate();
			return "redirect:lostpassword.jsp";
		}
	}
	
	/**
	 * 解冻用户
	 * @param email	用户邮箱	
	 * @param time	发送邮件时间
	 * @param request 页面请求
	 * @return
	 */
	@RequestMapping("/unFreeze.form")
	public String unFreezeUser(String email, String time, HttpServletRequest request){
//		System.out.println(email);
//		System.out.println(time);
		
		if(service.unFreeze(email, time, request)){
			return "active_success";
		}
		return "active_fail";
	}
}
