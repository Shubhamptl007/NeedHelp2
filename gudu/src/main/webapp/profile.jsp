<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.*"%>

<%
User user = (User) session.getAttribute("CurrentUser");

if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User_Post</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/profile.css" rel="stylesheet" type="text/css" />


</head>
<body>

	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark nav_css">
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

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#exampleModal">Do Post</a></li>



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


	<!-- main body -->
	<main>
		<div class="container">
			<div class="row mt-3">

				<!-- first col for list -->
				<div class="col-md-4" id="mainpost">
					<div class="list-group">
						<a href="#" onclick="getPosts(0, this)"
							class="c-link list-group-item list-group-item-action active">All
							post <%
						PostDao d = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = d.category();
						for (Category c : list1) {
						%> <a onclick="getPosts(<%=c.getCid()%>, this)"
							class=" c-link list-group-item list-group-item-action"><%=c.getName()%></a>
							<%
							}
							%>
						</a>
					</div>
				</div>
				<!-- Second colume-->

				<div class="col-md-8">

					<div class="container text-center " id="loader">
						<i class="fa fa-circle-o-notch fa-spin" style="font-size: 36px;"></i>
						<h3>Loading..</h3>
					</div>

					<div id="post-container">
						<%--All Data write in Load_pages.jsp with the help of Ajax --%>

					</div>
				</div>

			</div>
		</div>
	</main>
	<!-- end main body -->


	<!-- 1. profile model ------------------------------------------------------------>


	<div class="modal fade" id="profile" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 382px;">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="container">
						<img class="img-fluid img-responsive rounded-circle"
							src="img/<%=user.getProfile()%>"
							style="width: 118px; height: 118px; margin: 8px; margin-left: 100px;">
						<h3 class="modal-title text-center"><%=user.getName()%></h3>
						<hr>

						<div id="profile_detailes">
							<table>
								<tbody>
									<tr>
										<th scope="row">Email id:</th>
										<td><%=user.getEmail()%></td>
									</tr>

									<tr>
										<th scope="row">Password:</th>
										<td><%=user.getPassword()%></td>
									</tr>

									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>
									</tr>

									<tr>
										<th scope="row">About:</th>
										<td><%=user.getAbout()%></td>
									</tr>


									<tr>
										<th scope="row">Profile pic:</th>
										<td><%=user.getProfile()%></td>
									</tr>


								</tbody>
							</table>
						</div>



						<!-- 2. Edit phase -------------------------------------------------------------------------->

						<div id="profile_edit" style="Display: none;">


							<h3 class="mt-2">Please Edit Carefully !</h3>

							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">

									<tr>
										<td>Id :</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Email Id:</td>
										<td><input class="form-control" type="email"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>

									<tr>
										<td>Name:</td>
										<td><input class="form-control" type="text"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>

									<tr>
										<td>Password:</td>
										<td><input class="form-control" type="password"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<td>Gender:</td>
										<td><%=user.getGender()%></td>
									</tr>

									<tr>
										<td>About:</td>
										<td><textarea class="form-control" name="user_About"
												rows="3"><%=user.getAbout()%></textarea></td>
									</tr>

									<tr>
										<td>Profile:</td>
										<td><input class="form-control" type="file"
											name="user_profile" value="<%=user.getProfile()%>"></td>
									</tr>

								</table>

								<div class="container text-center">

									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>
						</div>

					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="edit_btn" class="btn btn-primary">Edit</button>
				</div>

			</div>
		</div>
	</div>

	<!--2. End Profile Edit Phase --------------------------------------------------------->



	<!-- 3. Add Post Modal ------------------------------------------------------------>



	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">provide the
						detailes..</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="AddPostServlet" id="add-post" autocomplete="on"
						enctype="multipart/form-data" method="post">

						<div class="form group">
							<select class="form-control" name="cID">
								<option selected disabled>---Select category---</option>
								<%
								PostDao psdao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = psdao.category();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>

							</select>

						</div>
						<br>
						<div class="form-group">
							<input type="text" name="postName" autocomplete="off"
								class="form-control" placeholder="Enter Post Title">
						</div>

						<div class="form-group">
							<textarea rows="6" name="contextName" autocomplete="off"
								class="form-control" placeholder="Enter your Context"></textarea>
						</div>

						<div class="form-group">
							<textarea rows="6" class="form-control" name="programName"
								autocomplete="off" placeholder="Enter your Program(if any)"></textarea>
						</div>



						<div class="form-group">
							<label>Select your Pic..</label> <input type="file"
								class="form-control" name="fileName">
						</div>

						<div class="container text-center">
							<button type="submit"
								style="padding-right: 28px; padding-left: 29px;"
								class="btn btn-outline-primary">Post</button>
						</div>

					</form>
				</div>


			</div>
		</div>
	</div>


	<!-- 3. End PostModal -->



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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


	<script>
		$(document).ready(function() {

			let editStatus = false;

			$('#edit_btn').click(function() {

				if (editStatus == false) {
					$("#profile_edit").show();
					$("#profile_detailes").hide();
					editStatus = true;
					$(this).text("Back");
				} else {

					$("#profile_edit").hide();
					$("#profile_detailes").show();
					editStatus = false;
					$(this).text("Edit");
				}
			})

		});
	</script>

	<script>
		$(document).ready(function(e) {

			$("#add-post").on("submit", function(event) {
				event.preventDefault();
				

				let f = new FormData(this);

				$.ajax({
					url : "AddPostServlet",
					data : f,
					type : 'post',
					enctype : 'multipart/form-data',
					success : function(data, textStatus, jqXHR) {
						console.log("clicked");
						
						 console.log(data.trim());
							if (data.trim() === 'success..') {

								swal("Register Successfully ! we are redirecting to login page")
								.then((value) => {
								  window.location="profile.jsp"
							})
								
							} else {

								swal("Register Successfully ! we are redirecting to login page")
								.then((value) => {
								  window.location="profile.jsp"
							})
							
							}
					},

					error : function(jqXHR, textStatus, errorThrown) {
						console.log("noclicked")
						swal("put all field")
								.then((value) => {
								  window.location="profile.jsp"
							})
					},
					processData : false,
					contentType : false
				})

			})
		});
	</script>


	<script>
	
	function getPosts(catId, temp){
		$("#loader").show();
		 $("#post-container").hide();
		 
		 $(".c-link").removeClass('active');
		
		$.ajax({
			url: "load_pages.jsp",
			data: {cid:catId},
			success : function(data, textStatus, jqXHR){
				      console.log(data);
			          $("#loader").hide();
			          $("#post-container").show();
			     	  $("#post-container").html(data);
			     	  $(temp).addClass('active');
							 	
			}
		})
	}
  
	$(document).ready(function() {
		let allPostRef=$('.c-link')[0]
		
           getPosts(0, allPostRef);
	
	})
	</script>
</body>
</html>