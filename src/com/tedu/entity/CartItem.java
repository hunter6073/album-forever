package com.tedu.entity;

import org.springframework.stereotype.Component;

@Component
public class CartItem {
	private String cartid;
	private String albumid;
	private String username;
	private int number;
	private String albumname;
	private String price;
	private String storage;
	private String albumimage;
	public String getCartId() {
		return cartid;
	}
	public void setCartId(String cartId) {
		this.cartid = cartId;
	}
	public String getAlbumid() {
		return albumid;
	}
	public void setAlbumid(String albumid) {
		this.albumid = albumid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getCartid() {
		return cartid;
	}
	public void setCartid(String cartid) {
		this.cartid = cartid;
	}
	public String getAlbumname() {
		return albumname;
	}
	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStorage() {
		return storage;
	}
	public void setStorage(String storage) {
		this.storage = storage;
	}
	public void setAlbumimage(String albumimage) {
		this.albumimage = albumimage;
	}
	public String getAlbumimage() {
		return albumimage;
	}
	
	
	
}
