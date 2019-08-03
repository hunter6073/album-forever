package com.tedu.classes;

import java.util.Date;

public class smartsearchclass extends product{
	String song;
	public smartsearchclass(){super();}
	public smartsearchclass(String song) {
		super();
		this.song = song;
	}
	public String getSong() {
		return song;
	}
	public void setSong(String song) {
		this.song = song;
	}
	public smartsearchclass(String albumid, String albumname, String singer,
			String language, String style, String region,
			String publishcompany, String intro, float price, int wished,
			String picture, Date publishtime, String song) {
		super(albumid, albumname, singer, language, style, region,
				publishcompany, intro, price, wished, picture, publishtime);
		this.song = song;
	}
	@Override
	public String toString() {
		return "smartsearchclass [song=" + song + ", albumid=" + albumid
				+ ", albumname=" + albumname + ", intro=" + intro
				+ ", language=" + language + ", picture=" + picture
				+ ", price=" + price + ", publishcompany=" + publishcompany
				+ ", publishtime=" + publishtime + ", region=" + region
				+ ", singer=" + singer + ", style=" + style + ", wished="
				+ wished + ", getSong()=" + getSong() + ", getAlbumid()="
				+ getAlbumid() + ", getAlbumname()=" + getAlbumname()
				+ ", getIntro()=" + getIntro() + ", getLanguage()="
				+ getLanguage() + ", getPicture()=" + getPicture()
				+ ", getPrice()=" + getPrice() + ", getPublishcompany()="
				+ getPublishcompany() + ", getPublishtime()="
				+ getPublishtime() + ", getRegion()=" + getRegion()
				+ ", getSinger()=" + getSinger() + ", getStyle()=" + getStyle()
				+ ", getWished()=" + getWished() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	

}
