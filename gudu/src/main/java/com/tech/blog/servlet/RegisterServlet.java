package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class RegisterServlet extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		String name=req.getParameter("user_name");
		String email=req.getParameter("user_email");
		String password=req.getParameter("user_password");
		String gender=req.getParameter("user_gender");
		String about=req.getParameter("user_about");
		String check=req.getParameter("user_check");
		
		if(check!=null) {
			
			User us=new User(name, email, password, gender, about);
			
			UserDao ud=new UserDao(ConnectionProvider.getConnection());
			
			if(ud.saveUser(us)) {
				resp.sendRedirect("login_page.jsp");
				
			}
			else {
			out.println("false...!");
			}
		}
		
	}
}
