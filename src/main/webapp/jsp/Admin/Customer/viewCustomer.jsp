
<%@page import="java.util.ArrayList"%>
<%@ page import="com.booking.test.Customer" %>
<%@ page import="com.booking.test.AdminMain" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
AdminMain adminMainObj=new AdminMain();
ArrayList<Customer> customersList=adminMainObj.getCustomers();
%>
<html lang="en">
<head>
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
					<li><a href="../Product/addProduct.jsp">Add Products</a></li>
					<li ><a href="../Product/viewProduct.jsp">View Products</a></li>
					<li class="active"><a href="../Customer/viewCustomer.jsp">Customers</a></li>
				</ul>
				<br>
			</div>

			<div class="col-sm-9">
				<h4>
					<small>View Customer Page</small>
				</h4>
				<hr>
				<table class="table">
					<thead>
						<tr>
						<th>#</th>
							<th scope="col">NAME</th>
							<th scope="col">MOBILE</th>
							<th scope="col">EMAIL</th>
						</tr>
					</thead>
					<tbody>
					<% if(customersList != null) {%>
						<% int i=1; %>
							<%for (Customer pro : customersList) {%>
							<tr>
							<td><%=i %></td>
								<td><%=pro.getCusName() %></td>
								<td><%=pro.getCusMobile() %></td>
								<td><%=pro.getCusEmail() %></td>
								<td><a href="customerDetails.jsp?mobile=<%=pro.getCusMobile() %>">Details</a></td>
							</tr>
							<% i=i+1; %>
							<%}%>
						<%} else {%>
							<td>No customer found!!!</td>
						<%} %>
					
						
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>
