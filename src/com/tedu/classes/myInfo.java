package com.tedu.classes;

public class myInfo {
	private String userName;
	private String phone;
	private String address;
	private String receivename;
	private String postalCode;
	private String mailAddress;
	
	@Override
	public String toString() {
		return "myInfo [address=" + address + ", mailAddress=" + mailAddress
				+ ", phone=" + phone + ", postalCode=" + postalCode
				+ ", receivename=" + receivename + ", userName=" + userName
				+ "]";
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReceivename() {
		return receivename;
	}
	public void setReceivename(String receivename) {
		this.receivename = receivename;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getMailAddress() {
		return mailAddress;
	}
	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}
	
	
	
}
