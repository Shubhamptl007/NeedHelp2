<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.CommentDao"%>
<%@page import="com.tech.blog.entities.Comment"%>
<%@page import="java.util.*"%>


<%
User user = (User) session.getAttribute("CurrentUser");

if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<%

%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/comment.css" rel="stylesheet" type="text/css" />

<title>Comment</title>
</head>
<body style="
    background: radial-gradient(black, transparent);">


	<div class="container">

		<!-- navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark nav_css"
			style="background: #2196f3;">
			<a class="navbar-brand" href="index.jsp"><i
				class="fa fa-car fa-lg"></i>Tech Blog</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Learn
							With Shubham <span class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Dropdown </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Programing Language</a> <a
								class="dropdown-item" href="#">Project</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Data Structure</a>
						</div></li>

					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">

					<a class="nav-link text-right text-white" data-toggle="modal"
						data-target="#profile"><i class="fa fa-user-plus"
						style="font-size: 15 px"></i></a><%=user.getName()%>(ID:
					<%=user.getId()%>) <a class="nav-link text-right text-white"
						href="LogoutServlet"><i class="fa fa-power-off"
						style="font-size: 15 px"></i> Logout</a>
				</form>
			</div>
		</nav>

		<!-- navbar end -->
		<!-- Main Body -->
		<section>
			<div class="container">
				<div class="row"
					style="background: white; border: 1px solid #000000; height: 600px;">
					<div class="col-sm-5 col-md-6 col-12 pb-4 border_box"
						style="color: white;">
						<h1 style="color: #1d2124; -webkit-text-stroke-width: medium;">Comments</h1>


								<p class="card-text">
									<%
									int i = Integer.parseInt(request.getParameter("node_id").trim());
									CommentDao cd = new CommentDao(ConnectionProvider.getConnection());
									List<Comment> dd = cd.getComment(i);
									for (Comment d : dd) {
									%>
								
								<div class="card" style="width: 520px; background: #2196f3; height: 204px; margin-top: 10px;"
							style="width: 18rem;">
									<div class="card-body">
										<h5 class="card-title"><%=d.getCname()%></h5>
										<h6 class="card-subtitle mb-2 text-muted"><%=d.getCemail() %></h6>
										<p class="card-text"><%=d.getComment() %></p>
										<a href="#" class="btn btn-danger">Delete</a> <a href="#"
									class="btn btn-primary">Edit</a>
									</div>
								</div>
								
								
								<%
								}
								%>
					</div>

					<div
						class="col-lg-4 col-md-5 col-sm-4 offset-md-1 offset-sm-1 col-12 mt-4">
						<form action="CommentServlet" method="post" id="algin-form">
							<div class="form-group">


								<input value="<%=i%>" name="pro_id" type="hidden" />
								<div class="row">
									<div class="profile-image">
										<img class="rounded-circle" src="img/<%=user.getProfile()%>"
											width="70" height="70">
									</div>
									<div class="d-flex flex-row post-title"
										style="margin-top: 20px; margin-left: 10px;">
										<h5 style="-webkit-text-stroke-width: medium;"><%=user.getName()%></h5>
									</div>
								</div>
								<label for="message">Message</label>
								<textarea name="user_msg" required id="" msg cols="30" rows="5"
									class="form-control" style="background-color: black;"></textarea>
							</div>
							<div class="form-group">
								<label for="name">Name</label> <input type="text"
									value="<%= user.getName() %>" name="user_name" id="fullname"
									class="form-control">
							</div>
							<div class="form-group">
								<label for="email">Email</label> <input type="text"
									value="<%= user.getEmail() %>" name="user_email" id="email"
									class="form-control">
							</div>
							<div class="form-group">
								<p class="text-secondary">
									If you have a <a href="#" class="alert-link">gravatar
										account</a> your address will be used to display your profile
									picture.
								</p>
							</div>
							<div class="form-inline">
								<input type="checkbox" required name="check" id="checkbx" class="mr-1">
								<label for="subscribe">Subscribe me to the Post More</label>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary" id="post" class="btn">Post
									Comment</button>
									<a href="profile.jsp" class="btn btn-danger">Back</a> 
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

	</div>




	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>