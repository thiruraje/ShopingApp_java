<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.booking.test.ProductDetails"%>
<%@ page import="com.booking.test.Product"%>
<%@ page import="com.booking.test.Customer"%>

<%
String proId = request.getParameter("id");
ProductDetails obj = new ProductDetails();
Product product = obj.getDetails(proId);
Customer cus=(Customer) session.getAttribute("currentCustomer");
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
/* Basic Styling */
html, body {
	height: 80%;
	width: 100%;
	margin: 0;
	font-family: 'Roboto', sans-serif;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 15px;
	display: flex;
}

/* Columns */
.left-column {
	width: 65%;
	position: relative;
}

.right-column {
	width: 35%;
	margin-top: 60px;
}

/* Left Column */
.left-column img {
	width: 80%;
	heigth: 50%;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
	transition: all 0.3s ease;
}

.left-column img.active {
	opacity: 1;
}

/* Right Column */

/* Product Description */
.product-description {
	border-bottom: 1px solid #E1E8EE;
	margin-bottom: 20px;
}

.product-description span {
	font-size: 12px;
	color: #358ED7;
	letter-spacing: 1px;
	text-transform: uppercase;
	text-decoration: none;
}

.product-description h1 {
	font-weight: 300;
	font-size: 52px;
	color: #43484D;
	letter-spacing: -2px;
}

.product-description p {
	font-size: 16px;
	font-weight: 300;
	color: #86939E;
	line-height: 24px;
}

/* Product Price */
.product-price {
	display: flex;
	align-items: center;
}

.product-price span {
	font-size: 26px;
	font-weight: 300;
	color: #43474D;
	margin-right: 20px;
}

.btn-blue {
	border: none;
	border-radius: 10px;
	background-color: #673AB7;
	color: #FFFFFF;
	padding: 8px 15px;
	margin: 20px 0px;
	maigin-left:50px;
	cursor: pointer
}

.btn-blue:hover {
	background-color: #64af3d;
}
/* Responsive */
@media ( max-width : 940px) {
	.container {
		flex-direction: column;
		margin-top: 60px;
	}
	.left-column, .right-column {
		width: 80%;
	}
}

@media ( max-width : 535px) {
	.left-column img {
		width: 220px;
		top: -85px;
	}
}
</style>
</head>
<body>
	<form name="customerLogin" method="post"
		action="/WebTask1/addCart">
		<main class="container">

			<!-- Left Column / Headphones Image -->
			<div class="left-column">
				<img data-image="red" class="active"
					src="/WebTask1/images/<%=product.getProImg()%>" alt="">
			</div>


			<!-- Right Column -->
			<div class="right-column">

				<!-- Product Description -->
				<div class="product-description">
					<span><%=product.getProCategory()%></span>
					<h1><%=product.getProName()%></h1>
					<span>Id :<%=product.getProId()%></span>
					<p><%=product.getProDes()%></p>
				</div>
				 <input type="hidden" id="proId" name="proId" value="<%=product.getProId()%>">
				 <input type="hidden" id="cus" name="cus" value="<%=cus.getCusMobile() %>">

				<!-- Product Color -->
				<div class="product-color">
					<span>Color</span>
				</div>
				<div class="product-color">
					<select name="product_clr" class="form-control">
						<option value="">Select Color</option>
						<%
						if (product.getProColor() != null) {
						%>
						<%
						for (String clr : product.getProColor()) {
						%>
						<option value="<%=clr%>"><%=clr%></option>
						<%
						}
						%>
						<%
						}
						%>
					</select>
				</div>
				<div>
					<p></p>
				</div>

				<!-- Product Color -->
				<%
				if (product.getProCategory().equals("clothes")) {
				%>
				<div class="product-color">
					<span>Size</span>
				</div>
				<div class="product-color">
					<select name="clothe_size" class="form-control">
						<option value="">Select Color</option>
						<option value="S">S</option>
						<option value="L">L</option>
						<option value="XL">XL</option>

					</select>
				</div>
				<div>
					<p></p>
				</div>

				<%
				}
				%>


				<!-- Product Pricing -->
				<div class="product-price">
					<span><%=product.getProRate()%>$</span> 
				</div>
				<div><button class="btn-block btn-blue"><span id="place">Add Cart</span></button></div>
			</div>
		</main>
	</form>


</body>

</body>
</html>