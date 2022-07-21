package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		try {
			String name = req.getParameter("user_email");
			String password = req.getParameter("user_password");
			String check = req.getParameter("user_check");

			if (check != null) {

				UserDao usd = new UserDao(ConnectionProvider.getConnection());
				User u = usd.showUser(name, password);
				if (u.getId() == 0) {

					Message msg=new Message("Invalid Detailes ! try with another","error","alert-danger");
					HttpSession s=req.getSession();
					s.setAttribute("msg", msg);
					resp.sendRedirect("login_page.jsp");
					

				} else {
					HttpSession s = req.getSession();
					s.setAttribute("CurrentUser", u);
					resp.sendRedirect("profile.jsp");
				}
			} else {
				out.print("success");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
