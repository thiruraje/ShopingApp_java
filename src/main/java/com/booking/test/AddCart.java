package com.booking.test;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class AddCart extends HttpServlet {
	public void doPost( HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException 
	{		
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		
		String customerMobile = request.getParameter("cus");
		String proId = request.getParameter("proId");
		String product_clr = request.getParameter("product_clr");
		String clothe_size = request.getParameter("clothe_size");
		
		Product selectedProduct = null;
		Customer currentCustomer=null;
//		out.println(customerMobile);
		for(Product pro:DB.productList) {
			if(pro.getProId().equals(proId)) {
				selectedProduct=pro;
				break;				
			}
		}
		if(selectedProduct.getProCategory().equals("clothes")) {
			selectedProduct.setProSelectedSIze(clothe_size);	
		}
		selectedProduct.setProSelectedClr(product_clr);
		for(Customer cus:DB.customerList) {
			if(cus.getCusMobile().equals(customerMobile)) {
				currentCustomer=cus;
				break;				
			}
		}
		
		if(DB.cartDetails.containsKey(currentCustomer.getCusMobile())) {
			out.println("Already data ");
			ArrayList<Product> cartPros=new ArrayList<Product>();
			cartPros=DB.cartDetails.get(currentCustomer.getCusMobile());
			cartPros.add(selectedProduct);
			DB.cartDetails.put(currentCustomer.getCusMobile(),cartPros);
		}else {
			out.println("new Data");
			ArrayList<Product> newPros=new ArrayList<Product>();
			newPros.add(selectedProduct);
			DB.cartDetails.put(currentCustomer.getCusMobile(), newPros);
			
		}
//		out.println(DB.cartDetails.get(currentCustomer.getCusMobile()));
		response.sendRedirect("jsp/Customer/cart.jsp");
	}
	public ArrayList<Product> getCartItems(Customer cus) {	
		return DB.cartDetails.get(cus.getCusMobile());
	}
	
	public Integer getTotalAmount(Customer cus) {	
		Integer amt=0;
		for(Product p:DB.cartDetails.get(cus.getCusMobile())) {
			amt=amt+Integer.parseInt(p.getProRate());
		}
		return amt;
	}
	

}
