<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin Category</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

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
				<br>
				<br>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="../home.jsp">Home</a></li>
					<li class="active"><a href="addCategory.jsp">Add Category</a></li>
					<li><a href="viewCategory.jsp">View Category</a></li>
					<li><a href="../Product/addProduct.jsp">Add Products</a></li>
					<li><a href="../Product/viewProduct.jsp">View Products</a></li>
				</ul>
				<br>
			</div>

			<div class="col-sm-9">
				<h4>
					<small>Add Category Page</small>
				</h4>
				<hr>
				<form action="/WebTask1/addCategory" method = "post">
					<div class="form-group">
						<label for="text">Category:</label> <input type="text"
							class="form-control" id="category" name="category" required >
					</div>
					<button type="submit" class="btn btn-success">Submit</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
