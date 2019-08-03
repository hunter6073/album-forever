package com.edu.entity;

import java.util.Date;

import org.springframework.stereotype.Component;


/**
 * 用户User类
 * @author Christin
 * Email:869641892@qq.com 
 * MP:18392150948
 */
@Component
public class User {
//  同步数据库名称，旧名称弃用
//	private String nickName;
//	private String email;
	
	/**
	 * 用户昵称
	 */
	private String username;	
	/**
	 * 用户邮箱
	 */
	private String mailaddress;
	/**
	 * 用户登录密码
	 */
	private String password;
	/**
	 * 用户上次登录时间
	 */
	private Date lastLoginTime;
	/**
	 * 用户上次登录IP
	 */
	private String lastLoginIp;
	/**
	 * 冻结
	 */
	private String freeze;
//	/**弃用
//	 * 用户身份 
//	 * 0为普通用户
//	 * 1位管理员
//	 */
//	private int administrator=0;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMailaddress() {
		return mailaddress;
	}
	public void setMailaddress(String mailaddress) {
		this.mailaddress = mailaddress;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	public String getFreeze() {
		return freeze;
	}
	public void setFreeze(String freeze) {
		this.freeze = freeze;
	}
	/**
	 * 没什么卵用的toString
	 */
	@Override
	public String toString() {
		return "User [freeze=" + freeze + ", lastLoginIp=" + lastLoginIp
				+ ", lastLoginTime=" + lastLoginTime + ", mailaddress="
				+ mailaddress + ", password=" + password + ", username="
				+ username + "]";
	}
	
	
	
//	public int getAdministrator() {
//	return administrator;
//}
//public void setAdministrator(int administrator) {
//	this.administrator = administrator;
//}
	
}
