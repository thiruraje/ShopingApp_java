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
		PrintWriter out= response.getWriter();
		
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


		request.getSession().setAttribute("promoCode",promoCode);		
		request.getSession().setAttribute("finalAmount",finalAmt);
		request.getSession().setAttribute("totalAmount",totalAmount);
		response.sendRedirect("jsp/Customer/cardDetail.jsp");	
		response.setContentType("text/html");
		
//		out.println(DB.orders);
		
				
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
