package com.tedu.entity;

import org.springframework.stereotype.Component;
@Component
public class OrderItem {
	private int id;
	private String receiptid;
	private String albumid;
	private String albumname;
	private float price;
	private String number;
	private String albumimage;
	private float subTotal;
	private float total;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setAlbumid(String albumid) {
		this.albumid = albumid;
	}
	public String getAlbumid() {
		return albumid;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getNumber() {
		return number;
	}
	public void setReceiptid(String receiptid) {
		this.receiptid = receiptid;
	}
	public String getReceiptid() {
		return receiptid;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getPrice() {
		return price;
	}
	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}
	public String getAlbumname() {
		return albumname;
	}
	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}
	public float getSubTotal() {
		return subTotal;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public float getTotal() {
		return total;
	}
	public void setAlbumimage(String albumimage) {
		this.albumimage = albumimage;
	}
	public String getAlbumimage() {
		return albumimage;
	}
	
}
