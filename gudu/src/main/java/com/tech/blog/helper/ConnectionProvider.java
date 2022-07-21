package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	public static Connection con;

	public static Connection getConnection() {
		
		try {
			
			if(con==null) {
				
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url="jdbc:mysql://localhost:3306/hydra";
			String username="root";
			String password="root";
			
			con=DriverManager.getConnection(url, username, password);
			
			}	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
}
