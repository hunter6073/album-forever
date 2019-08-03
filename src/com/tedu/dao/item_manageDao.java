package com.tedu.dao;

import java.util.List;

import com.tedu.classes.item;
import com.tedu.classes.product;
import com.tedu.classes.smartsearchclass;


public interface item_manageDao {
	public List<item>getallitem();
	public List<item>getitembyId(String value);
	public List<item>orderallitembyId(String key,String value);
	public void insertnewitem(item i);
	public void updateitem(item i);
	public void deleteitem(String albumid);
	public List<smartsearchclass> smartsearchalbum(String value);
	public List<smartsearchclass> smartsearchsinger(String search);
	public List<smartsearchclass> smartsearchsong(String search);
	public int getcountbystyle(String style);
	public int getcountbylanguage(String language);
}
