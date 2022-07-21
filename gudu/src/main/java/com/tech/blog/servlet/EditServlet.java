package com.tech.blog.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@MultipartConfig
public class EditServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String name = req.getParameter("user_name");
		String email = req.getParameter("user_email");
		String password = req.getParameter("user_password");
		String about = req.getParameter("user_About");
		
		Part part = req.getPart("user_profile");
		String filename = part.getSubmittedFileName();
	
		HttpSession s = req.getSession();                   // from loginservlet.java in else function
		User user = (User) s.getAttribute("CurrentUser");
		
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setAbout(about);
		user.setProfile(filename);
		
		UserDao usedao = new UserDao(ConnectionProvider.getConnection());
		boolean bl = usedao.editDetailes(user);

		if (bl == true) {
            
			InputStream is = part.getInputStream();
			
			byte[] data = new byte[is.available()];        //get data in data array
			is.read(data);
			
			String path = "C:\\Users\\USER\\eclipse-workspace\\gudu\\src\\main\\webapp\\img"
					+ File.separator + filename;
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
			
              
		} else {
			out.print("failed...");
		}
		resp.sendRedirect("profile.jsp");
	}
}
