package com.edu.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.tedu.dao.UserDAO;
import com.edu.entity.Employee;
import com.edu.entity.User;
import com.edu.util.CookieUtil;
import com.edu.util.EncryptUtil;
import com.edu.util.IpGetUtil;
import com.edu.util.MailUtil;
import com.edu.util.base64.BASE64Encoder;


/**
 * 业务层
 * UserService类
 * 
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
@Service
public class UserService {
	//注入UserDAO
	@Resource
	private UserDAO dao = null;

	//由于要复用User类，所以此处不进行注入
	private User user;
	private Employee employee;

	/**
	 * 用户登录
	 * @param email 用户邮箱
	 * @param password 用户密码
	 * @return 查找到相应用户则返回User，否则返回null
	 */
	public User user_login(String email, String password) {
		user = new User();
		user.setMailaddress(email);
		password = EncryptUtil.md5Encrypt(password);
		user.setPassword(password);
		User login = dao.findByLogin(user);
	
		if (login == null) {
			return null;
		} else {
			Date nowDate = new Date();
			Date lastDate = login.getLastLoginTime();
			
			long interval = (nowDate.getTime()-lastDate.getTime())/1000;
			System.out.println("interval:"+interval);
			
			if(interval>(60*60*24*30*6)){
				
				login.setFreeze("1");
				
			}
			
			return login;
		}
	}
	
	/**
	 * 管理员登录
	 * @param personid 	员工号	
	 * @param password	员工密码
	 * @return	员工类
	 */
	public Employee admin_login(String personid, String password){
		employee = new Employee();
		employee.setPersonid(personid);
		password = CookieUtil.encryptString(password);
		employee.setPassword(password);
		Employee login = dao.findByAdminLogin(employee);
		
		if(login == null){
			return null;
		}else {
			return login;
		}
	}
	
	/**
	 * 用户注册
	 * @param email 用户邮箱
	 * @param nickname 用户昵称
	 * @param password 用户密码
	 * @param request 页面请求
	 * @return 如果用户注册成功（即邮箱以及昵称没有重复）返回true，否则返回false
	 */
	public boolean user_regist(String email, String nickname, String password,
			HttpServletRequest request) {

		if (!email_check(email) && !nickname_check(nickname)) {
			user = new User();
			user.setUsername(nickname);
			user.setMailaddress(email);
			password = EncryptUtil.md5Encrypt(password);
			user.setPassword(password);
			user.setLastLoginTime(new Date());
			String ip = IpGetUtil.getIpAddress(request);
			user.setLastLoginIp(ip);
			user.setFreeze("0");
			
			dao.insertUser(user);
			dao.insertAddressInfo(nickname);
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 用户邮箱重复性校验
	 * @param email 用户邮箱
	 * @return 如果有重复的邮箱返回true，否则返回false
	 */
	public boolean email_check(String email) {
		user = new User();
		user = dao.findByEmail(email);

		if (user == null) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 查找某邮箱的用户
	 * @param email	邮箱
	 * @return	用户
	 */
	public User email_find(String email){
		user = new User();
		user = dao.findByEmail(email);
		
		if(user == null){
			return null;
		}else{
			return user;
		}
	}

	/**
	 * 用户昵称重复性校验
	 * @param nickname 用户昵称
	 * @return 如果有重复的昵称返回true，否则返回false
	 */
	public boolean nickname_check(String nickname) {
		user = new User();
		user = dao.findByName(nickname);

		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 向用户邮箱发送激活码
	 * @param toAddress 用户邮箱
	 * @return 返回发送的激活码
	 */
	public String sendVcode(String toAddress) {
		String vcode = MailUtil.sendCodeEmail(toAddress);

		if (!vcode.equals("")) {
			return vcode;
		} else {
			return "";
		}
	}

	/**
	 * 校验用户填写的激活码和发送的激活码是否相同
	 * @param user_code 用户填写的激活码
	 * @param service_code 服务器发送的激活码
	 * @return 如果相同返回true，否则返回false
	 */
	public boolean code_check(String user_code, String service_code) {
		if (user_code.equals(service_code)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 修改用户密码
	 * @param email 用户邮箱
	 * @param password 用户密码
	 * @param request 页面请求
	 */
	public void changePwd(String email, String password,
			HttpServletRequest request) {
		user = new User();
		user = dao.findByEmail(email);

		password = EncryptUtil.md5Encrypt(password);
		user.setPassword(password);
		user.setLastLoginTime(new Date());
		String ip = IpGetUtil.getIpAddress(request);
		user.setLastLoginIp(ip);
		user.setFreeze("0");

		dao.updateUserByEmail(user);
	}

	/**
	 * 更新用户信息
	 * @param u 用户User类
	 * @param request 页面请求
	 */
	public void updateUser(User u, HttpServletRequest request) {
		user = u;

		user.setLastLoginTime(new Date());
		String ip = IpGetUtil.getIpAddress(request);
		user.setLastLoginIp(ip);

		dao.updateUserByEmail(user);
	}
	
	/**
	 * 解冻用户
	 * @param email	用户邮箱
	 * @param time	解冻邮件发送日期
	 * @param request	页面请求
	 * @return	是否解冻成功
	 */
	public boolean unFreeze(String email, String time, HttpServletRequest request){
		String userEmail = CookieUtil.decryptString(email);
		String sTime = CookieUtil.decryptString(time);
		User user = email_find(userEmail);
		if(user == null){
			return false;
		}
		Date nowTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date dTime = sdf.parse(sTime);
			long interval = (nowTime.getTime()-dTime.getTime())/1000;
			
			if(interval>60*60*24){
				return false;
			}else{
				user.setFreeze("0");
				updateUser(user, request);
				return true;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
