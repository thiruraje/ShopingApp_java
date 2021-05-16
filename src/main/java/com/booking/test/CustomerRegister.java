package com.booking.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerRegister extends HttpServlet {
	static boolean isPassword(String str) {
		Pattern p = Pattern.compile("^(?=.*[0-9])(?=.*[a-z]).{6,20}$");
		Matcher m = p.matcher(str);
		return m.matches();    
	}
	static Boolean isExitCustomer(String mobile) {
		Boolean isExitCustomer = false;
		for(Customer cus:DB.customerList) {
			if(cus.getCusMobile().equals(mobile)) {
				isExitCustomer = true;
				break;				
			}				
		}
		return isExitCustomer;
		
	}
	
	public void doPost( HttpServletRequest request, HttpServletResponse response)  
	        throws ServletException, IOException 
	{		
		String name = request.getParameter("username");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		
		String password = request.getParameter("pass");
		String conPassword = request.getParameter("conpass");
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		if(!isExitCustomer(mobile)) {
			if(isPassword(password) && isPassword(conPassword) ) {
				if(password.equals(conPassword)) {
					Customer cusObj=new Customer(name,email,mobile,password);
					request.getSession().setAttribute("currentCustomer", cusObj);
					DB.customerList.add(cusObj);
					response.sendRedirect("jsp/Customer/home.jsp");					
				}else {
					out.print("Conform password is wrong  !!!");
					RequestDispatcher rd=request.getRequestDispatcher("jsp/Customer/register.jsp");
					rd.include(request,response); 
				}
			}else {
				out.print("Max password size is 6 and have small letters  !!!"); 
				RequestDispatcher rd=request.getRequestDispatcher("jsp/Customer/register.jsp");
				rd.include(request,response); 
			}
			
		}else {
			out.print("Mobile number already exits   !!!"); 
			RequestDispatcher rd=request.getRequestDispatcher("jsp/Customer/register.jsp");
			rd.include(request,response);
		}
		
		
			
		
	}

}
