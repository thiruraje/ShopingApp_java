package com.booking.test;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

public class AddProduct extends HttpServlet {

	public void doPost( HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException 
	{		
		response.setContentType("text/html");
		String proName = null;
		String proId = null;
		String proCategory = null;
		String proClr = null;
		String proRate =null;
		String proDes=null;
		
		PrintWriter out= response.getWriter();

		String file_name = null;
		
		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		if (!isMultipartContent) {
			return;
		}
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List < FileItem > fields = upload.parseRequest(request);
			Iterator < FileItem > it = fields.iterator();
			if (!it.hasNext()) {
				return;
			}
			while (it.hasNext()) {
				FileItem fileItem = it.next();
				boolean isFormField = fileItem.isFormField();
				if (isFormField) {
					if (file_name == null) {
						if (fileItem.getFieldName().equals("product_name")) {
							proName = fileItem.getString();
						}else if (fileItem.getFieldName().equals("product_id")) {
							  proId = fileItem.getString();
				        }else if (fileItem.getFieldName().equals("product_category")) {
				        	proCategory = fileItem.getString();
				        }else if (fileItem.getFieldName().equals("product_clr")) {
				        	proClr = fileItem.getString();
				        }else if (fileItem.getFieldName().equals("product_rate")) {
				        	proRate =fileItem.getString().toString();
				        }else if (fileItem.getFieldName().equals("product_description")) {
				        	proDes = fileItem.getString();
				        }
					}
				} else {
					if (fileItem.getSize() > 0) {
						file_name=fileItem.getName();						
						fileItem.write(new File("C:\\Users\\Thiru Raja\\eclipse-workspace\\WebTask1\\src\\main\\webapp\\images\\" + fileItem.getName()));
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		DB.productList.add(new Product(proName,proCategory,proClr,proId,proRate,proDes,file_name));
//		for(Product p:DB.productList) {
//			out.println(p.getProName());
//			out.println(p.getProId());
//			out.println(p.getProCategory());
//			out.println(p.getProColor());
//			out.println(p.getProImg());
//			out.println();
//			out.println(p.getProRate());
//			out.println();
//			out.println(p.getProDes());
//			
//			
//			
//		}
		response.sendRedirect("jsp/Admin/Product/addProduct.jsp");
	}
}
