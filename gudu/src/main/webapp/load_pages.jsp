<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
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
<title>Insert title here</title>


<link href="css/profile.css" rel="stylesheet" type="text/css" />


</head>
<body>

	<div class="container border_box">
		<div class="row profile_row">

			<%
			PostDao d1 = new PostDao(ConnectionProvider.getConnection());

			int cid = Integer.parseInt(request.getParameter("cid"));

			List<Post> posts = null;

			if (cid == 0) {
				posts = d1.getAllPost();
			} else {

				posts = d1.getPostById(cid);

			}

			for (Post k : posts) {
			%>



			<div class="column d-flex align-items-stretch profile_col">
				<div class="card profile_card">

					<img class="card-img-top" src="img/<%=k.getpPic()%>"
						alt="Card image cap">
					<div class="card-body form-control">
						<b><%=k.getpTitle()%></b>
						<p><%=k.getpContent()%></p>

					</div>

					<div class="card-footer text-light">
						<a href="show_blog_page.jsp?post_id=<%=k.getPid()%>"
							class="btn btn-outline-primary btn-sm">Read More</a>

						<button type="button" class="btn btn-outline-primary btn-sm"
							onClick="onClick()" id="clicks">
							<i class="fa fa-thumbs-o-up"></i>0
						</button>
						<a href="comment.jsp?node_id=<%= k.getPid() %>"
							class="btn btn-outline-primary btn-sm"> <i
							class="fa fa-commenting-o"></i><span>10</span>
						</a>


					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>


</body>
</html>