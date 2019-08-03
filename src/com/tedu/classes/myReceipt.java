package com.tedu.classes;

public class myReceipt {
	private String albumid;
	private String albumname;
	private String number;
	
	@Override
	public String toString() {
		return "myReceipt [albumid=" + albumid + ", albumname=" + albumname
				+ ", number=" + number + "]";
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
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	
}
