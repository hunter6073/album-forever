package com.edu.entity;

/**
 * 员工Employee类
 * @author Christin
 * Email:869641892@qq.com 
 * MP:18392150948
 */
public class Employee {
	/**
	 * 员工ID
	 */
	private String personid;
	/**
	 * 员工名字
	 */
	private String name;
	/**
	 * 员工性别
	 */
	private String sex;
	/**
	 * 员工年龄
	 */
	private int age;
	/**
	 * 员工用户名
	 */
	private String username;
	/**
	 * 员工密码
	 */
	private String password;
	/**
	 * 员工职位
	 */
	private String role;
	
	public String getPersonid() {
		return personid;
	}
	public void setPersonid(String personid) {
		this.personid = personid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	/**
	 * 没什么卵用的toString
	 */
	@Override
	public String toString() {
		return "Employee [age=" + age + ", name=" + name + ", password="
				+ password + ", personid=" + personid + ", role=" + role
				+ ", sex=" + sex + ", username=" + username + "]";
	}
	
	
}
