package com.tedu.classes;

public class item extends product {
	public int storage;
	public int discount;
	public float price;
	public int sold;
	public item(){super();}
	public item(int storage, int discount, float price, int sold) {
		super();
		this.storage = storage;
		this.discount = discount;
		this.price = price;
		this.sold = sold;
	}
	public int getStorage() {
		return storage;
	}
	public void setStorage(int storage) {
		this.storage = storage;
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
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}

}
