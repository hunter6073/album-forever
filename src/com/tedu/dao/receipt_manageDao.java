package com.tedu.dao;

import java.util.List;

import com.tedu.classes.receipt;

public interface receipt_manageDao {
	public List<receipt> getallreceipt();
	public void deletereceipt(String r_id);
	public List<receipt> getreceiptbyId(String value);
}
