
<%@page import="java.util.ArrayList"%>
<%@ page import="com.booking.test.Product" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("productList");
%>
<html lang="en">
<head>
<title>Admin Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.row.content {
	height: 1000px
}

.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<div></div>
				<h4>ThiruSri</h4>
				<br> <br>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="../home.jsp">Home</a></li>
					<li><a href="../Category/addCategory.jsp">Add Category</a></li>
					<li><a href="../Category/viewCategory.jsp">View Category</a></li>
					<li><a href="addProduct.jsp">Add Products</a></li>
					<li class="active"><a href="viewProduct.jsp">View Products</a></li>
					<li><a href="../Customer/viewCustomer.jsp">Customers</a></li>
				</ul>
				<br>
			</div>

			<div class="col-sm-9">
				<h4>
					<small>View Product Page</small>
				</h4>
				<hr>
				<table class="table">
					<thead>
						<tr>
						<th>#</th>
							<th scope="col">PRODUCT IMAGE</th>
							<th scope="col">PRODUCT NAME</th>
							<th scope="col">CATEGORY</th>
							<th scope="col">ID</th>
							<th scope="col">RATE</th>
						</tr>
					</thead>
					<tbody>
					<% if(productList != null) {%>
						<% int i=1; %>
							<%for (Product pro : productList) {%>
							<tr>
							<td><%=i %></td>
								<td><img src="/WebTask1/images/<%=pro.getProImg() %>" width="60" height="60" alt=""/></td>
								<td><%=pro.getProName() %></td>
								<td><%=pro.getProCategory() %></td>
								<td><%=pro.getProId() %></td>
								<td><%=pro.getProRate()%></td>
							</tr>
							<% i=i+1; %>
							<%}%>
						<%} else {%>
							<td>No Data found!!!</td>
						<%} %>
						
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>
