<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
Integer finalAmt = (Integer) session.getAttribute("finalAmount");
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
		<div class="col-5">
			<h4 class="heading">Booking Now Place Order</h4>
		</div>

		<form class="form-horizontal" method="post"
			action="/WebTask1/conformOrder" enctype="text/plain">
			<div class="row justify-content-center">

				<div class="col-lg-12">
					<div class="card">
						<div class="row">
							<div class="col-lg-5">
								<div class="row px-2">
									<div class="form-group col-md-6">
										<label class="form-control-label">Total Amount:</label>
										<div>
											<span><h3><%=finalAmt%></h3></span>
										</div>

									</div>

								</div>
								<div class="row px-2">
									<div class="form-group col-md-6">
										<label class="form-control-label">Name on Card</label> <input
											type="text" id="cname" name="cname"
											placeholder="THIRUVENGADAM L">
									</div>
									<div class="form-group col-md-6">
										<label class="form-control-label">Card Number</label> <input
											type="text" id="cnum" name="cnum"
											placeholder="1111 2222 3333 4444">
									</div>
								</div>
								<div class="row px-2">
									<div class="form-group col-md-6">
										<label class="form-control-label">Expiration Date</label> <input
											type="text" id="exp" name="exp" placeholder="MM/YYYY">
									</div>
									<div class="form-group col-md-6">
										<label class="form-control-label">CVV</label> <input
											type="text" id="cvv" name="cvv" placeholder="***">
									</div>
								</div>
							</div>

						</div>
						<div>
						<button class="btn-block btn-blue" type="submit" value="submit"><span id="place">Order</span></button>

						</div>
					</div>
				</div>
			</div>
		</form>

	</div>

</body>
</html>