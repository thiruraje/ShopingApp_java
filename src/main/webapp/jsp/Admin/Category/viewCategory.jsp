
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<%
HashSet<String> categoryList = (HashSet<String>) session.getAttribute("categoryList");
%>

<html lang="en">
<head>

<title>Admin Category</title>
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
					<li><a href="addCategory.jsp">Add Category</a></li>
					<li class="active"><a href="viewCategory.jsp">View
							Category</a></li>
					<li><a href="../Product/addProduct.jsp">Add Products</a></li>
					<li><a href="../Product/viewProduct.jsp">View Products</a></li>
				</ul>
				<br>
			</div>

			<div class="col-sm-9">
				<h4>
					<small>View Category Page</small>
				</h4>
				<hr>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Category</th>
						</tr>
					</thead>
					<tbody>
						<% if(categoryList != null) {%>
						<% int i=1; %>
							<%for (String cat : categoryList) {%>
							<tr>
								<td><%=i %></td>
								<td><%=cat %></td>
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
