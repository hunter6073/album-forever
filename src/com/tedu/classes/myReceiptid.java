package com.tedu.classes;

import java.util.List;

public class myReceiptid {
	private String receiptid;
	private String total;
	private List<myReceipt> receipt_album;
	
	@Override
	public String toString() {
		return "myReceiptid [receipt_album=" + receipt_album + ", receiptid="
				+ receiptid + ", total=" + total + "]";
	}
	public String getReceiptid() {
		return receiptid;
	}
	public void setReceiptid(String receiptid) {
		this.receiptid = receiptid;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public List<myReceipt> getReceipt_album() {
		return receipt_album;
	}
	public void setReceipt_album(List<myReceipt> receiptAlbum) {
		receipt_album = receiptAlbum;
	}

}
