package com.booking.test;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AdminLogin extends HttpServlet {
	
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
			
		if(!(name.isEmpty()) && !(password.isEmpty()) ) {
			if(isPassword(password)) {
				if((DB.adminUser.equals(name)) && DB.adminPass.equals(password)) {
					request.getSession().setAttribute("categoryList", DB.categoryList);
					request.getSession().setAttribute("productList", DB.productList);
					response.sendRedirect("jsp/Admin/home.jsp");					
				}else {
					out.print("Max password size is 6 and have small letters  !!!");
					RequestDispatcher rd=request.getRequestDispatcher("jsp/Admin/login.jsp");
					rd.include(request,response); 
				}
			}else {
				out.print("Max password size is 6 and have small letters  !!!"); 
				RequestDispatcher rd=request.getRequestDispatcher("jsp/Admin/login.jsp");
				rd.include(request,response); 
			}
		}else {
			out.print("Sorry username or password error");
			RequestDispatcher rd=request.getRequestDispatcher("jsp/Admin/login.jsp");
			rd.include(request,response); 
		}
	}
}
