<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.booking.test.AddCart"%>
<%@ page import="com.booking.test.Product"%>
<%@ page import="com.booking.test.Customer"%>
<%@ page import="java.util.ArrayList"%>

<%!
Integer totalAmount=0;
Integer shippingAmount=100;
%>
<%
ArrayList<Product> AllCartProducts = new ArrayList<Product>();

AddCart obj = new AddCart();

AllCartProducts = obj.getCartItems((Customer) session.getAttribute("currentCustomer"));

if(AllCartProducts != null){
	totalAmount=obj.getTotalAmount((Customer) session.getAttribute("currentCustomer"));	
}
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
<style type="text/css">
body {
	color: #000;
	overflow-x: hidden;
	height: 100%;
	background-color: #fff;
	background-repeat: no-repeat
}

.plus-minus {
	position: relative
}

.plus {
	position: absolute;
	top: -4px;
	left: 2px;
	cursor: pointer
}

.minus {
	position: absolute;
	top: 8px;
	left: 5px;
	cursor: pointer
}

.vsm-text:hover {
	color: #FF5252
}

.book, .book-img {
	width: 100px;
	height: 130px;
	border-radius: 5px
}

.book {
	margin: 20px 15px 5px 15px
}

.border-top {
	border-top: 1px solid #EEEEEE !important;
	margin-top: 20px;
	padding-top: 15px
}

.card {
	margin: 40px 0px;
	padding: 40px 50px;
	border-radius: 20px;
	border: none;
	box-shadow: 1px 5px 10px 1px rgba(0, 0, 0, 0.2)
}

input, textarea {
	background-color: #F3E5F5;
	padding: 8px 15px 8px 15px;
	width: 100%;
	border-radius: 5px !important;
	box-sizing: border-box;
	border: 1px solid #F3E5F5;
	font-size: 15px !important;
	color: #000 !important;
	font-weight: 300
}

input:focus, textarea:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #9FA8DA;
	outline-width: 0;
	font-weight: 400
}

button:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	outline-width: 0
}

.pay {
	width: 80px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid #673AB7;
	margin: 10px 20px 10px 0px;
	cursor: pointer;
	box-shadow: 1px 5px 10px 1px rgba(0, 0, 0, 0.2)
}

.gray {
	-webkit-filter: grayscale(100%);
	-moz-filter: grayscale(100%);
	-o-filter: grayscale(100%);
	-ms-filter: grayscale(100%);
	filter: grayscale(100%);
	color: #E0E0E0
}

.gray .pay {
	box-shadow: none
}

#tax {
	border-top: 1px lightgray solid;
	margin-top: 10px;
	padding-top: 10px
}

.btn-blue {
	border: none;
	border-radius: 10px;
	background-color: #673AB7;
	color: #fff;
	padding: 8px 15px;
	margin: 33px 0px;
	cursor: pointer
}

.btn-blue:hover {
	background-color: #311B92;
	color: #fff
}

#checkout {
	float: left
}

#check-amt {
	float: left
}
.cart-btn {
  display: inline-block;
  background-color: blue;
  border-radius: 6px;
  font-size: 16px;
  color: #FFFFFF;
  text-decoration: none;
  padding: 12px 30px;
  transition: all .5s;
}
.cart-btn:hover {
  background-color: #64af3d;
}


@media screen and (max-width: 768px) {
	.book, .book-img {
		width: 100px;
		height: 150px
	}
	.card {
		padding-left: 15px;
		padding-right: 15px
	}
	.mob-text {
		font-size: 13px
	}
	.pad-left {
		padding-left: 20px
	}
}
</style>
</head>
<body>
	<div class="container px-4 py-5 mx-auto">
		<div class="row d-flex justify-content-center">
			<div class="col-5">
				<h4 class="heading">Booking Now</h4>
			</div>
			<div class="col-7">
				<div class="row text-right">
					<div class="col-3">
						<h6 class="mt-2">Category</h6>
					</div>
					<div class="col-3">
						<h6 class="mt-2">Color</h6>
					</div>
					
					<div class="col-3">
						<h6 class="mt-2">Size</h6>
					</div>
					
					<div class="col-3">
						<h6 class="mt-2">Price</h6>
					</div>
				</div>
			</div>
		</div>
		<%
		if (AllCartProducts != null) {
		%>
		<%
		for (Product pro : AllCartProducts) {
		%>
		<div class="row d-flex justify-content-center border-top">
			<div class="col-5">
				<div class="row d-flex">
					<div class="book">
						<img src="/WebTask1/images/<%=pro.getProImg()%>" class="book-img">
					</div>
					<div class="my-auto flex-column d-flex pad-left">
						<h6 class="mob-text"><%=pro.getProName()%></h6>
						<p class="mob-text">
							ID:
							<%=pro.getProId()%></p>
					</div>
				</div>
			</div>
			<div class="my-auto col-7">
				<div class="row text-right">
					<div class="col-3">
						<p class="mob-text"><%=pro.getProCategory()%></p>
					</div>
					<div class="col-3">
						<h6 class="mob-text">
							<%=pro.getProSelectedClr()%></h6>
					</div>
					<% if(pro.getProCategory().equals("clothes")){ %>
					<div class="col-3">
						<h6 class="mob-text">
							<%=pro.getProSelectedSIze()%></h6>
					</div>
					<%}else {%>
					<div class="col-3">
						<h6 class="mob-text">
							-</h6>
					</div>
					<%} %>
					<div class="col-3">
						<h6 class="mob-text">
							$<%=pro.getProRate()%></h6>
					</div>
				</div>
			</div>
		</div>
		

		<%
		}
		%>
		<div class="row justify-content-center">
		<form class="form-horizontal" method="post"
			action="/WebTask1/placeOrder">
			<div class="col-lg-12">
				<div class="card">
					<div class="row">
						<div class="col-lg-3 radio-group"></div>
						<div class="col-lg-5">
							
								<div class="row px-2">
									<div class="form-group col-md-6">
										<label class="form-control-label">Promo Code</label> <input
											type="text"  name="promo_code"
											placeholder="1207">
									</div>
								</div>	
							

						</div>
						<div class="col-lg-4 mt-2">
							<div class="row d-flex justify-content-between px-4">
								<p class="mb-1 text-left">Total Amount</p>
								<h6 class="mb-1 text-right">$<%=totalAmount %></h6>
							</div>
							<div class="row d-flex justify-content-between px-4">
								<p class="mb-1 text-left">Shipping Amount</p>
								<h6 class="mb-1 text-right">$<%=shippingAmount %></h6>
							</div>
							<div class="row d-flex justify-content-between px-4" id="tax">
								<p class="mb-1 text-left">Total</p>
								<h6 class="mb-1 text-right" id="totalAmt">$<%=shippingAmount+totalAmount %></h6>
							</div>
							<button class="btn-block btn-blue"><span id="place">Order</span></button>
							
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
		<%
		} else{
		%>
		<td>Still no products added!!!</td>
		<%
		}
		%>
		

	</div>

</body>
</html>