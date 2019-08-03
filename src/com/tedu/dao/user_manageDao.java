package com.tedu.dao;

import java.util.List;

import com.tedu.classes.user;


public interface user_manageDao {
	public List<user> getallusers();
	public List<user> getusersbyUsername(String value);
}
