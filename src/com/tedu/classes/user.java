package com.tedu.classes;

import java.text.SimpleDateFormat;
import java.util.Date;


public class user {
	    public String usermail;
	    public String username;
		public String password;
		public String name;
		public String recentphone;
		public String recentaddress;
		public Date lastlogintime;
		public String formatedtime;
		public String lastloginip;
		public user(){}
		public user(String usermail, String username, String password,
				String name, String recentphone, String recentaddress,
				Date lastlogintime, String lastloginip) {
			super();
			this.usermail = usermail;
			this.username = username;
			this.password = password;
			this.name = name;
			this.recentphone = recentphone;
			this.recentaddress = recentaddress;
			this.lastlogintime = lastlogintime;
			this.lastloginip = lastloginip;
		

		}
		public String getUsermail() {
			return usermail;
		}
		public void setUsermail(String usermail) {
			this.usermail = usermail;
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
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getRecentphone() {
			return recentphone;
		}
		public void setRecentphone(String recentphone) {
			this.recentphone = recentphone;
		}
		public String getRecentaddress() {
			return recentaddress;
		}
		public void setRecentaddress(String recentaddress) {
			this.recentaddress = recentaddress;
		}
		public Date getLastlogintime() {
			return lastlogintime;
		}
		public void setLastlogintime(Date lastlogintime) {
			this.lastlogintime = lastlogintime;
		}
		public String getLastloginip() {
			return lastloginip;
		}
		public void setLastloginip(String lastloginip) {
			this.lastloginip = lastloginip;
		}
		public String getFormatedtime() {
			SimpleDateFormat pdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String formatedtime = pdf.format(lastlogintime);
			return formatedtime;
		}
		public void setFormatedtime(String formatedtime) {
			this.formatedtime = formatedtime;
		}
		
		
}
