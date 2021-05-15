package com.booking.test;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;

public class AdminMain extends HttpServlet {
	
	public ArrayList<Customer> getCustomers(){
		return DB.customerList;		
	}
	
	public ArrayList<Order> getOrders(String mobile){
		ArrayList<Order> orderArr=new ArrayList<Order>();
		for(Order ord:DB.orders) {
			if(ord.getCustomer().getCusMobile().equals(mobile)) {
				orderArr.add(ord);		
			}			
		}
		return orderArr;
	}

}
