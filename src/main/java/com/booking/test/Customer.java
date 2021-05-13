package com.booking.test;

public class Customer {
	private String cusName;
	private String cusEmail;
	private String cusMobile;
	private String cusPass;
	public Customer(String cusName, String cusEmail, String cusMobile, String cusPass) {
		super();
		this.cusName = cusName;
		this.cusEmail = cusEmail;
		this.cusMobile = cusMobile;
		this.cusPass = cusPass;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getCusEmail() {
		return cusEmail;
	}
	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}
	public String getCusMobile() {
		return cusMobile;
	}
	public void setCusMobile(String cusMobile) {
		this.cusMobile = cusMobile;
	}
	public String getCusPass() {
		return cusPass;
	}
	public void setCusPass(String cusPass) {
		this.cusPass = cusPass;
	}
	
	
	
	

}
