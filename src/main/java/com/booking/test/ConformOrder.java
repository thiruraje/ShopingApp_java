package com.booking.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConformOrder extends HttpServlet {
	
	public void doPost( HttpServletRequest request, HttpServletResponse response)  
	        throws ServletException, IOException 
	{		
		PrintWriter out= response.getWriter();
//		response.setContentType("text/html");
		String cardName = request.getParameter("cname");
		String cardNumber = request.getParameter("cnum");
		String cardDate = request.getParameter("exp");
		String cardCvv = request.getParameter("cvv");
		
		String promoCode = (String) request.getSession().getAttribute("promoCode");
		Integer totalAmount=(Integer)request.getSession().getAttribute("totalAmount");
		Integer shippingAmount=100;
		Boolean isDiscount =false;
		Integer finalAmt=(Integer) request.getSession().getAttribute("finalAmount");
		AddCart obj = new AddCart();
		Customer cusObj=(Customer) request.getSession().getAttribute("currentCustomer");

		if(promoCode.equals("1207")) {
			isDiscount=true;
		}

		if(DB.orders.add(new Order(cusObj,DB.cartDetails.get(cusObj.getCusMobile()),(totalAmount+shippingAmount)
				,finalAmt,isDiscount,new Date(System.currentTimeMillis())))) {
			DB.cartDetails.remove(cusObj.getCusMobile());
			
			out.println("Thanyou for shoping !! $ check  it your order page");
			
//			response.sendRedirect("jsp/Customer/cardDetail.jsp");	
		}
		
		
//		out.println(DB.orders);
		
				
	}

}
