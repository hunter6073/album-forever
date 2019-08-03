package com.tedu.entity;

import java.sql.Date;

public class Album_info {

		private String album_name;
		private String album_singer;
		private String album_image;
		private String album_style;
		private Date album_publishtime;
		private float album_price;
		private String album_region;
		private String album_language;
		private String album_albumid;
		
		
		public String getAlbum_name() {
			return album_name;
		}
		public void setAlbum_name(String albumName) {
			album_name = albumName;
		}
		public String getAlbum_singer() {
			return album_singer;
		}
		public void setAlbum_singer(String albumSinger) {
			album_singer = albumSinger;
		}
		public String getAlbum_image() {
			return album_image;
		}
		public void setAlbum_image(String albumImage) {
			album_image = albumImage;
		}
		public void setAlbum_style(String album_style) {
			this.album_style = album_style;
		}
		public String getAlbum_style() {
			return album_style;
		}
		public void setAlbum_publishtime(Date album_publishtime) {
			this.album_publishtime = album_publishtime;
		}
		public Date getAlbum_publishtime() {
			return album_publishtime;
		}
		
		public void setAlbum_region(String album_region) {
			this.album_region = album_region;
		}
		public String getAlbum_region() {
			return album_region;
		}
		public void setAlbum_language(String album_language) {
			this.album_language = album_language;
		}
		public String getAlbum_language() {
			return album_language;
		}
	    
	
		public void setAlbum_albumid(String album_albumid) {
			this.album_albumid = album_albumid;
		}
		public String getAlbum_albumid() {
			return album_albumid;
		}
		public void setAlbum_price(float album_price) {
			this.album_price = album_price;
		}
		public float getAlbum_price() {
			return album_price;
		}
		


}
