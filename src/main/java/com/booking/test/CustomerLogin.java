package com.booking.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.el.stream.Optional;

public class CustomerLogin extends HttpServlet {

	static boolean isPassword(String str) {
		Pattern p = Pattern.compile("^(?=.*[0-9])(?=.*[a-z]).{6,20}$");
		Matcher m = p.matcher(str);
		return m.matches();    
	}

	public void doPost( HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException 
	{		
		String name = request.getParameter("username");
		String password = request.getParameter("pass");
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();



		if(isPassword(password)) {
			if(DB.customerList.size() >0) {
				boolean temp=false;
				for(Customer cusObj:DB.customerList) {
					if((cusObj.getCusName().equals(name)) && cusObj.getCusPass().equals(password)) {
						request.getSession().setAttribute("currentCustomer", cusObj);						
						response.sendRedirect("jsp/Customer/home.jsp");	
						temp=true;
						break;
					}else {
						out.print("Enter correct username password  !!!");
						RequestDispatcher rd=request.getRequestDispatcher("jsp/Customer/login.jsp");
						rd.include(request,response); 
					}
				}
				if(!temp) {
					out.print("You not exit !! Register first !!!!!"); 
					RequestDispatcher rd=request.getRequestDispatcher("jsp/Customer/login.jsp");
					rd.include(request,response); 
				}
			}else {
				out.print("You not exit !! Register first !!!!!"); 
				RequestDispatcher rd=request.getRequestDispatcher("jsp/Customer/login.jsp");
				rd.include(request,response); 				
			}
			

		}else {
			out.print("Max password size is 6 and have small letters  !!!"); 
			RequestDispatcher rd=request.getRequestDispatcher("jsp/Customer/login.jsp");
			rd.include(request,response); 
		}

	}

}
