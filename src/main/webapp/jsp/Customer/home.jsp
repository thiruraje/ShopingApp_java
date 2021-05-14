<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.booking.test.Product"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<%
HashSet<String> categoryList = (HashSet<String>) session.getAttribute("categoryList");
ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("productList");

%>


<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Booking Now</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="home.jsp">Welcome
				${currentCustomer.getCusName()}</a>
			<div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="cart.jsp">
                                Cart
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                    </ul>
                </div>
		</div>
	</nav>
	<!-- Page Content-->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">Booking Now</h1>
				<div class="list-group">
					<% if(categoryList != null) {%>
					<%for (String cat : categoryList) {%>
					<a class="list-group-item" href="category.jsp?type=<%=cat %>"><%=cat %></a>
					<%}%>
					<%} else {%>
					No Category found!!!
					<%} %>

				</div>
			</div>
			<div class="col-lg-9">
				<br>
				<br>
				<div class="row">
					<% if(productList != null) {%>
					<%for (Product pro : productList) {%>
					<tr>

						<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#!"><img class="card-img-top"
								src="/WebTask1/images/<%=pro.getProImg() %>" alt="..." /></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#!"><%=pro.getProName()%></a>
								</h4>
								<h5><%=pro.getProRate()%></h5>
								<p class="card-text"><%=pro.getProDes()%></p>
							</div>
							<div class="card-footer">
								<a href="details.jsp?id=<%=pro.getProId()%>" class="text-muted">Details</a>

							</div>
						</div>
					</div>
					</tr>
					<%}%>
					<%} else {%>
					<td>No Products found!!!</td>
					<%} %>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../../js/scripts.js"></script>
</body>
</html>
