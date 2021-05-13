package com.booking.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddCategory extends HttpServlet {
	
	public void doPost( HttpServletRequest request, HttpServletResponse response)  
	        throws ServletException, IOException 
	{		
		String category = request.getParameter("category");
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		if(!category.isEmpty()) {
			DB.categoryList.add(category);
			response.sendRedirect("jsp/Admin/Category/viewCategory.jsp");
		}
				
	}
}
