package com.gudu.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class Pubg extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {
            
			Part part = request.getPart("myfile");
			String filename = part.getSubmittedFileName(); 
			out.print(filename);
			
			
			Connection con = ConnectionProvider.getConnection();
			System.out.println(con);

			String s = "insert into picture(idpic, namepic) values (?, ?)";
			PreparedStatement pstmt = con.prepareStatement(s);
			pstmt.setInt(1, 23);
			pstmt.setString(2, filename);
			pstmt.executeUpdate();

			
			InputStream is = part.getInputStream();
			
			byte[] data = new byte[is.available()];        //get data in data array
			is.read(data);
			
			String path = "C:\\Users\\USER\\eclipse-workspace\\gudu\\src\\main\\webapp\\img"
					+ File.separator + filename;
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	}
}
