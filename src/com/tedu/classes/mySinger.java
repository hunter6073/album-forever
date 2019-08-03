package com.tedu.classes;

public class mySinger {
	private String name;
	private String singer;
	private String type;
	private String intro;
	private String image;
	private String songname;
	private String song;
	
	
	@Override
	public String toString() {
		return "mySinger [image=" + image + ", intro=" + intro + ", name="
				+ name + ", singer=" + singer + ", songname=" + songname
				+ ", type=" + type + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSongname() {
		return songname;
	}
	public void setSongname(String songname) {
		this.songname = songname;
	}
	public String getSong() {
		return song;
	}
	public void setSong(String song) {
		this.song = song;
	}
	
	
}
