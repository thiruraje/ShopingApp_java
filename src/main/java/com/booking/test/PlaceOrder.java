package com.booking.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlaceOrder extends HttpServlet {
	public void doPost( HttpServletRequest request, HttpServletResponse response)  
	        throws ServletException, IOException 
	{		
		String cardName = request.getParameter("cname");
		String cardNumber = request.getParameter("cnum");
		String cardDate = request.getParameter("exp");
		String cardCvv = request.getParameter("cvv");
		
		String promoCode = request.getParameter("promo_code");
		Integer totalAmount=0;
		Integer shippingAmount=100;
		Boolean isDiscount =false;
		Integer finalAmt=0;
		AddCart obj = new AddCart();
		Customer cusObj=(Customer) request.getSession().getAttribute("currentCustomer");

		if(promoCode.equals("1207")) {
			totalAmount=obj.getTotalAmount(cusObj);
			finalAmt = (totalAmount+shippingAmount) - ((totalAmount+shippingAmount)/10);
			isDiscount=true;
		}else {
			totalAmount=obj.getTotalAmount(cusObj);
			finalAmt = (totalAmount+shippingAmount);
			
		}

		if(DB.orders.add(new Order(cusObj,DB.cartDetails.get(cusObj.getCusMobile()),(totalAmount+shippingAmount)
				,finalAmt,isDiscount,new Date(System.currentTimeMillis())))) {
			DB.cartDetails.remove(cusObj.getCusMobile());
			response.sendRedirect("jsp/Customer/home.jsp");	
		}
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		out.println(DB.orders);
		
				
	}
	
	public ArrayList<Order> getOrders(Customer cus){
		ArrayList<Order> orderArr=new ArrayList<Order>();
		for(Order ord:DB.orders) {
			if(ord.getCustomer().getCusMobile().equals(cus.getCusMobile())) {
				orderArr.add(ord);		
			}			
		}
		return orderArr;
	}

}
