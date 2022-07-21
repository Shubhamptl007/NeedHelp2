<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<!-- start -->

	<%@ include file="navbar.jsp"%>
	<main class="register_page">
		<div class="container con_pa">
			<div class="raw">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header">

							<h3 class="text-center text-primary">
								<i class="fa fa-user-plus" style="font-size: 70px"></i></br>Register
								here
							</h3>
							<h5 id="msg" style="color: #008000; text-align: center;"></h5>

						</div>
						<div class="card-body">

							<form action="RegisterServlet" id="reg_form">
								<div class="form-group">
									<label for="username">User Name</label> <input type="text"
										class="form-control" id="username" name="user_name"
										placeholder="Enter name">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email"
										name="user_email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" autocomplete="on"
										placeholder="Password" name="user_password">
								</div>

								<div class="form-group">
									<label for="gender">Select Gender</label> </br> <input type="radio"
										id="gender" name="user_gender" value="male">Male <input
										type="radio" id="gender" name="user_gender" value="female">Female
								</div>

								<div class="form-group">
									<textarea name="user_about" class="form-control" rows="5"
										placeholder="Enter SOmething about yourself"></textarea>

								</div>

								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1" name="user_check"> <label
										class="form-check-label" for="exampleCheck1">agree
										terms and condition</label>
								</div>

								<div class="container text-center" id="loader"
									style="display: none;">
									<span class="fa fa-refresh fa-spin fa-4x"></span>
									<h4>Please wait..</h4>
								</div>

								<button id="submit-btn" type="submit"
									class="btn btn-primary center-align">Submit</button>


							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


	</main>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>

	
	


</body>
</html>