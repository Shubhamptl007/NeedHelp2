<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.entities.Message"%>
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


	<%@ include file="navbar.jsp"%>

	<main class="d-flex align-items-center soul" style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">
					<div class="card  ">
						<div class="card-header text-center text-primary">

							<h3>
								<i class="fa fa-user-plus" style="font-size: 70px"></i></br>Login
								Here..!
							</h3>
						</div>
						
							<%
							Message msg = (Message) session.getAttribute("msg");
							
							if (msg != null) {
							%>

							<div class="alert <%= msg.getCssClass() %>" role="alert"><%=msg.getContent()%></div>

							<%
							session.removeAttribute("msg");
							}
							%>
							
							
						<div class="card-body">

							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="text" name="user_email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="user_password" class="form-control"
										id="exampleInputPassword1" placeholder="Password"
										autocomplete="on">
								</div>
								<div class="form-check">
									<input type="checkbox" name="user_check"
										class="form-check-input" id="exampleCheck1" required>
									<label class="form-check-label" for="exampleCheck1">Check
										me out</label>
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</main>



</body>
</html>