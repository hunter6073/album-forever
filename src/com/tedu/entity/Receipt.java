package com.tedu.entity;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Receipt {
	private String receiptid;
	private String username;
	private String status;
	private Date pdate;
	private float total;
	private List<OrderItem> order;
	public String getReceiptid() {
		return receiptid;
	}
	public void setReceiptid(String receiptid) {
		this.receiptid = receiptid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public void setOrder(List<OrderItem> order) {
		this.order = order;
	}
	public List<OrderItem> getOrder() {
		return order;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public float getTotal() {
		return total;
	}
}
