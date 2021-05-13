package com.booking.test;

public class Product {
	private String proName;
	private String proCategory;
	private String proColor;
	private String proId;
	private String proImg;
	
	public Product(String proName, String proCategory, String proColor, String proId, String proImg) {
		this.proName = proName;
		this.proCategory = proCategory;
		this.proColor = proColor;
		this.proId = proId;
		this.proImg = proImg;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProCategory() {
		return proCategory;
	}
	public void setProCategory(String proCategory) {
		this.proCategory = proCategory;
	}
	public String getProColor() {
		return proColor;
	}
	public void setProColor(String proColor) {
		this.proColor = proColor;
	}
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	
	
	
	

}
