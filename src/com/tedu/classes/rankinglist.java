package com.tedu.classes;

import java.util.List;

public class rankinglist {
	    public String listname;
	    public List<index_menu_album> songlist;
		public rankinglist(String listname, List<index_menu_album> songlist) {
			super();
			this.listname = listname;
			this.songlist = songlist;
		}
		public String getListname() {
			return listname;
		}
		public void setListname(String listname) {
			this.listname = listname;
		}
		public List<index_menu_album> getSonglist() {
			return songlist;
		}
		public void setSonglist(List<index_menu_album> songlist) {
			this.songlist = songlist;
		}
	    

}
