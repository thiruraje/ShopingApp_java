<%@page import="java.util.ArrayList"%>
<%@ page import="com.booking.test.Order"%>
<%@ page import="com.booking.test.Product"%>
<%@ page import="com.booking.test.AdminMain"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String cusMObile = request.getParameter("mobile");
AdminMain adminMainObj = new AdminMain();
ArrayList<Order> orderArr = adminMainObj.getOrders(cusMObile);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Now</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
body {
	font-family: 'Rubik', sans-serif;
	height: 100% !important;
}

.card {
	border-radius: 10px !important
}

.container {
	margin-top: 0px !important
}
</style>
</head>
<body>
	<%
	if (orderArr != null) {
	%>
	<% int i=1; %>
	<%
	for (Order ord : orderArr) {
	%>
	<div class="container">
		<div class="card mt-5 border-5 pt-2 active pb-0 px-3">
			<div class="card-body ">
				<div class="row">
					<div class="col-12 ">
						<h4 class="card-title ">
							<b>Order <%=i %> </b>
						</h4>
						<h6 class="card-title ">
							<b>Date : <%=(ord.getOrderDate()).toLocaleString() %> </b>
						</h6>
					</div>
				</div>
			</div>
			<div class="card-footer bg-white px-0 ">
				<div class="col-lg-4 mt-2">
					<%
					for (Product pro : ord.getProducts()) {
					%>
					<div class="row d-flex justify-content-between px-4">
						<p class="mb-1 text-left"><%=pro.getProName() %></p>
						<h6 class="mb-1 text-right">
							$<%=pro.getProRate() %></h6>
					</div>
					<%
					}
					%>
					<div class="row d-flex justify-content-between px-4">
						<p class="mb-1 text-left">Shipping Amount</p>
						<h6 class="mb-1 text-right">$100</h6>
					</div>
					<div class="row d-flex justify-content-between px-4">
						<% if(ord.getIsDiscount()){ %>
						<p>Discount</p>
							<h6 class="mb-1 text-right">- $<%=(ord.getTotalAmount() - ord.getFinalAmt())%></h6>
						<%}%>
					</div>


					<hr>
					<div class="row d-flex justify-content-between px-4" id="tax">
						<p class="mb-1 text-left">Total</p>
						<h6 class="mb-1 text-right" id="totalAmt">
							$<%=ord.getFinalAmt()%></h6>
					</div>
				</div>
			</div>
		</div>

	</div>
	<% i=i+1; %>
	<%
	}
	%>
	<%
	} else {
	%>
	<td>No Orders found!!!</td>
	<%
	}
	%>

</body>
</html>