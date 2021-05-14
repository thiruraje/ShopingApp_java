package com.booking.test;

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

}
