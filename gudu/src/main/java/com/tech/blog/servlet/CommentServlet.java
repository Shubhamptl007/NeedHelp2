package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.CommentDao;
import com.tech.blog.dao.ConDao;
import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Comment;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class CommentServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		
		String comment=req.getParameter("user_msg");
		String name=req.getParameter("user_name");
		String email=req.getParameter("user_email");
		int pid=Integer.parseInt(req.getParameter("pro_id").trim());
		System.out.println(pid);
		
		Comment cm=new Comment(comment, name, email, pid);
		CommentDao cd=new CommentDao(ConnectionProvider.getConnection());
		Boolean ans=cd.docomment(cm);
		
		if(ans==true) {
			out.print("success...");
			resp.sendRedirect("profile.jsp");
		}else {
		out.print("failed...#");
		}
		
		
	}
}
