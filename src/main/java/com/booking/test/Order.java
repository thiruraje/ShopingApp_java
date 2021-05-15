package com.booking.test;

import java.util.ArrayList;
import java.util.Date;
public class Order {
	private Customer customer;
	private ArrayList<Product> products;
	private Integer totalAmount;
	private Integer finalAmt;
	private Boolean isDiscount = false;
	private Date orderDate;
	public Order(Customer customer, ArrayList<Product> products, Integer totalAmount, Integer finalAmt,
			Boolean isDiscount, Date orderDate) {
		super();
		this.customer = customer;
		this.products = products;
		this.totalAmount = totalAmount;
		this.finalAmt = finalAmt;
		this.isDiscount = isDiscount;
		this.orderDate = orderDate;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public ArrayList<Product> getProducts() {
		return products;
	}
	public void setProducts(ArrayList<Product> products) {
		this.products = products;
	}
	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Integer getFinalAmt() {
		return finalAmt;
	}
	public void setFinalAmt(Integer finalAmt) {
		this.finalAmt = finalAmt;
	}
	public Boolean getIsDiscount() {
		return isDiscount;
	}
	public void setIsDiscount(Boolean isDiscount) {
		this.isDiscount = isDiscount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
