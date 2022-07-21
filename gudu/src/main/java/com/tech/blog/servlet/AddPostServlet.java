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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		try {
		int catId = Integer.parseInt(req.getParameter("cID"));
		String name=req.getParameter("postName");
		String cname=req.getParameter("contextName");
		String pname=req.getParameter("programName");
		Part part = req.getPart("fileName");
		String filename = part.getSubmittedFileName();


HttpSession session = req.getSession();
		User user = (User) session.getAttribute("CurrentUser");
		int userid = user.getId();
		
		Post ps=new Post(name, cname, pname, filename, catId, userid);
		PostDao pd=new PostDao(ConnectionProvider.getConnection());
		boolean sc=pd.postData(ps);
		
		InputStream is = part.getInputStream();
		
		byte[] data = new byte[is.available()];        //get data in data array
		is.read(data);
		
		String path = "C:\\Users\\USER\\eclipse-workspace\\gudu\\src\\main\\webapp\\img"
				+ File.separator + filename;
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(data);
		fos.close();

		
		if (sc==true) {
			out.print("success");
		}else {
			out.print("failed");
		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
