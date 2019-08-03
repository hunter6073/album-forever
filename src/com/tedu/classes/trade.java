package com.tedu.classes;

public class trade {
	  String albumid;
 	   int val;
 	   float price;
 	   String receiptid;
 	   String albumname;
 	   public trade(){}
	public trade(String albumid, int val, float price, String receiptid) {
		super();
		this.albumid = albumid;
		this.val = val;
		this.price = price;
		this.receiptid = receiptid;
	}
	public String getAlbumid() {
		return albumid;
	}
	public void setAlbumid(String albumid) {
		this.albumid = albumid;
	}
	public int getVal() {
		return val;
	}
	public void setVal(int val) {
		this.val = val;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getReceiptid() {
		return receiptid;
	}
	public void setReceiptid(String receiptid) {
		this.receiptid = receiptid;
	}
	public String getAlbumname() {
		return albumname;
	}
	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}
	
	
 	   
}
