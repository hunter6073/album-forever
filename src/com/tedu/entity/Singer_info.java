package com.tedu.entity;

public class Singer_info {
	
	private String singer_name;
	private String singer_image;
	private String singer_intro;
	private String singer_type;
	private String singer_keyword;
	public String getSinger_name() {
		return singer_name;
	}
	public void setSinger_name(String singerName) {
		singer_name = singerName;
	}
	public String getSinger_image() {
		return singer_image;
	}
	public void setSinger_image(String singerImage) {
		singer_image = singerImage;
	}
	public void setSinger_intro(String singer_intro) {
		this.singer_intro = singer_intro;
	}
	public String getSinger_intro() {
		return singer_intro;
	}
	public void setSinger_type(String singer_type) {
		this.singer_type = singer_type;
	}
	public String getSinger_type() {
		return singer_type;
	}
	@Override
	public String toString() {
		return "Singer_info [singer_image=" + singer_image + ", singer_intro="
				+ singer_intro + ", singer_name=" + singer_name
				+ ", singer_type=" + singer_type + "]";
	}
	public void setSinger_keyword(String singer_keyword) {
		this.singer_keyword = singer_keyword;
	}
	public String getSinger_keyword() {
		return singer_keyword;
	}



}
