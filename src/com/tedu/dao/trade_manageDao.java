package com.tedu.dao;

import java.util.List;

import com.tedu.classes.trade;

public interface trade_manageDao {
public List<trade> getalltrade();
public void deletetrade(String r_id);
}
