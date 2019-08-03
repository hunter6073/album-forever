package com.ssm.comm;

import java.sql.Date;

public class Albums {
	
	private String albumid;
	private String albumname;
	private String singer;
	private String language;
	private String style;
	private String region;
	private String publishcompany;
	private String albumimage;
	private String intro;
	private int storage;
	private int sold;
	private int wished;
	private int commcount;
	public int getCommcount() {
		return commcount;
	}
	public void setCommcount(int commcount) {
		this.commcount = commcount;
	}
	private int discount;
	private float price;
	private Date publishtime;
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
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
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
	public String getAlbumimage() {
		return albumimage;
	}
	public void setAlbumimage(String albumimage) {
		this.albumimage = albumimage;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getStorage() {
		return storage;
	}
	public void setStorage(int storage) {
		this.storage = storage;
	}
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}
	public int getWished() {
		return wished;
	}
	public void setWished(int wished) {
		this.wished = wished;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Date getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(Date publishtime) {
		this.publishtime = publishtime;
	}
	@Override
	public String toString() {
		return "Albums [albumid=" + albumid + ", albumimage=" + albumimage
				+ ", albumname=" + albumname + ", discount=" + discount
				+ ", intro=" + intro + ", language=" + language + ", price="
				+ price + ", publishcompany=" + publishcompany
				+ ", publishtime=" + publishtime + ", region=" + region
				+ ", singer=" + singer + ", sold=" + sold + ", storage="
				+ storage + ", style=" + style + ", wished=" + wished + "]";
	}
	
	

}
