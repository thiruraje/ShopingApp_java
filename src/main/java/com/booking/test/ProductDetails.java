package com.booking.test;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

public class ProductDetails extends HttpServlet {
	
	public Product getDetails(String productId) {
		Product detail = null;
		for(Product pro:DB.productList) {
			if(pro.getProId().equals(productId)) {
				detail=pro;
				break;
				
			}
		}
		return detail;
		
	}
	
	public ArrayList<Product> addCart(String productId,Customer cus) {
		Product selectedProduct = null;
		for(Product pro:DB.productList) {
			if(pro.getProId().equals(productId)) {
				selectedProduct=pro;
				break;				
			}
		}
		if(DB.cartDetails.containsKey(cus.getCusMobile())) {
			ArrayList<Product> cartPros=new ArrayList<Product>();
			cartPros=DB.cartDetails.get(cus.getCusMobile());
			cartPros.add(selectedProduct);
			DB.cartDetails.put(cus.getCusMobile(),cartPros);
		}else {
			ArrayList<Product> newPros=new ArrayList<Product>();
			newPros.add(selectedProduct);
			DB.cartDetails.put(cus.getCusMobile(), newPros);
			
		}
		return DB.cartDetails.get(cus.getCusMobile());
		
	}
	public ArrayList<Product> addCart(Customer cus) {	
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
