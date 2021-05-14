<%@page import="java.util.HashSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
HashSet<String> categoryList = (HashSet<String>) session.getAttribute("categoryList");
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
					<li class="active"><a href="addProduct.jsp">Add Products</a></li>
					<li><a href="viewProduct.jsp">View Products</a></li>
				</ul>
				<br>
			</div>

			<div class="col-sm-9">
				<h4>
					<small>Add Product Page</small>
				</h4>
				<hr>
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-info">
							<div class="box-body">
								<form class="form-horizontal" method="post" action="/WebTask1/addProduct" enctype="multipart/form-data">
									<div class="box-body">
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="col-sm-12">
														<label>Product Name</label> <input type="text"
															class="form-control" value=""
															placeholder="Enter product Name" name="product_name" required>
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<div class="col-sm-12">
														<label>Product Id</label> <input type="text"
															class="form-control" value=""
															placeholder="Enter product id" name="product_id" required>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<div class="col-sm-12">
														<label>Product Category</label> <select
															name="product_category" class="form-control">
															<option value="">Select Category</option>
															<% if(categoryList != null){ %>
															<%for (String cat : categoryList) {%>
															<option value="<%=cat %>"><%=cat %></option>
															<%}%>
															<%} %>
														</select>
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<div class="col-sm-12">
														<label>Product Color</label> <input type="text"
															class="form-control" value=""
															placeholder="Enter product color" name="product_clr" required>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											
											<div class="col-sm-6">
												<div class="form-group">
													<div class="col-sm-12">
														<label>Product Rate</label> <input type="text"
															class="form-control" value=""
															placeholder="Enter product rate" name="product_rate" required>
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<div class="col-sm-12">
														<label>Product description</label> <input type="text"
															class="form-control" value=""
															placeholder="Enter product description" name="product_description" required>
													</div>
												</div>
											</div>
											
										</div>
										<div class="row">
											
											<div class="col-sm-6">
												<div class="form-group">
													<div class="col-sm-12">
														<label>Product Image</label> 
														<input class="form-control" type="file" id="productImg" name="filename">
														
													</div>
												</div>
											</div>
											
										</div>


										<br>
										<div align="center">
											<button type="submit" class="btn btn-info">Save</button>
										</div>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
