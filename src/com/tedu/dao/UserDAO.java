package com.tedu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.edu.entity.Employee;
import com.edu.entity.User;

/**
 * 持久层
 * 用户接口类
 * 
 * @author Christin 
 * Email:869641892@qq.com 
 * MP:18392150948
 */
@Repository
public interface UserDAO {

	/**
	 * 根据用户输入的邮箱和密码进行登录验证
	 * 
	 * @param u
	 *            用户信息User类
	 * @return 如果根据提供的User在数据库中查找到相应的User则返回
	 */
	public User findByLogin(User u);

	/**
	 * 根据管理员输入的人员编号和密码进行登录验证
	 * @param e 管理员信息Employee类
	 * @return 如果根据提供的Employee在数据库中查找到相应的Employee则返回
	 */
	public Employee findByAdminLogin(Employee e);
	
	/**
	 * 通过邮箱对该用户信息进行更新（主要是更新登录IP以及登陆时间）
	 * 
	 * @param u
	 *            用户信息User类
	 */
	public void updateUserByEmail(User u);

	/**
	 * 根据邮箱查找用户
	 * 
	 * @param email
	 *            邮箱地址
	 * @return 如果查找到邮箱为email的用户则返回该用户
	 */
	public User findByEmail(String email);

	/**
	 * 根据昵称查找用户
	 * 
	 * @param nickName
	 *            用户昵称
	 * @return 如果查找到昵称为nickName的用户则返回该用户
	 */
	public User findByName(String nickName);

	/**
	 * 将用户u的信息插入到数据库中
	 * 
	 * @param u
	 *            用户信息User类
	 */
	public void insertUser(User u);

	/**
	 * 向用户收货地址表中插入数据
	 * @param nickName 用户昵称
	 */
	public void insertAddressInfo(String nickName);
	// 弃置函数
	// public void setSecretKey(SecretKey k);
	// public User findByLogin(String email,String password);
	// public String getSecretKey();
	// public boolean isAdministrator(User u);
}
