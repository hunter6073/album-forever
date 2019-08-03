package com.tedu.dao;

import java.util.List;

import com.tedu.classes.index_menu_album;

public interface indexMenuDao {
	public List<index_menu_album> getnewalbums();
	public List<index_menu_album> getdiscountrankings();
	public List<index_menu_album> getbestsellrankings();
	public List<index_menu_album> getmostwishedrankings();
}
