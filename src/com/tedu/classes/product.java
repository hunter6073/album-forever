package com.tedu.classes;

import java.text.SimpleDateFormat;
import java.util.Date;

public class product {
	public String albumid;
	public String albumname;
	public String singer;
	public String language;
	public String style;
	public String region;
	public String publishcompany;
	public Date publishtime;
	public String time;
	public String intro;
	public float price;
	public int wished;
	public String picture;
	public product(){}
	public product(String albumid, String albumname, String singer, String language,String style,
			String region, String publishcompany, String intro, float price,
			int wished, String picture,Date publishtime) {
		super();
		this.albumid = albumid;
		this.albumname = albumname;
		this.singer = singer;
		this.style = style;
		this.language = language;
		this.region = region;
		this.publishcompany = publishcompany;
		this.intro = intro;
		this.price = price;
		this.wished = wished;
		this.picture = picture;
		this.publishtime = publishtime;
	}
	public String getAlbumid() {
		return albumid;
	}
	public void setAlbumid(String albumid) {
		this.albumid = albumid;
	}
	public String getAlbumname() {
		return albumname;
	}
	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getPublishcompany() {
		return publishcompany;
	}
	public void setPublishcompany(String publishcompany) {
		this.publishcompany = publishcompany;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getWished() {
		return wished;
	}
	public void setWished(int wished) {
		this.wished = wished;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public Date getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(Date publishtime) {
		this.publishtime = publishtime;
	}
	public String getTime() {
		SimpleDateFormat pdf = new SimpleDateFormat("yyyy-MM-dd");
		String formatedtime = pdf.format(publishtime);
		return formatedtime;
	}








}
