package com.tedu.classes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class receipt {
	    public String r_id;
	    public String username;
		public String address;
		public String receivename;
		public String phone;
		public String status;
		public String postalcode;
		public List<trade> albumtrade;
		public Date date;
		public String time;
		public receipt(){}
		public receipt(String rId, String username, String address,
				String receivename, String phone, String status, 
				String postalcode, List<trade> albumtrade) {
			super();
			r_id = rId;
			this.username = username;
			this.address = address;
			this.receivename = receivename;
			this.phone = phone;
			this.status = status;
			this.postalcode = postalcode;
			this.albumtrade = albumtrade;
		}
		public String getR_id() {
			return r_id;
		}
		public void setR_id(String rId) {
			r_id = rId;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getReceivename() {
			return receivename;
		}
		public void setReceivename(String receivename) {
			this.receivename = receivename;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}

		public String getPostalcode() {
			return postalcode;
		}
		public void setPostalcode(String postalcode) {
			this.postalcode = postalcode;
		}
		public List<trade> getAlbumtrade() {
			return albumtrade;
		}
		public void setAlbumtrade(List<trade> albumtrade) {
			this.albumtrade = albumtrade;
		}
		
		
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			if(date!=null)
			{
				this.date = date;
			}
			
		}
		public String getTime() {
			if(date!=null)
			{
				SimpleDateFormat pdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String formatedtime = pdf.format(date);
				return formatedtime;
			}
			else
			{
				return null;
			}
		}
	
		
		
}
