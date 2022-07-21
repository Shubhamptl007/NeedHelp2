package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConDao {
	
	private Connection con;

	public ConDao(Connection con) {
		this.con = con;
	} 
	
	
	public Boolean comment(String cr) {
		
	     
	     Boolean sr=false;
	     try {
	    	 
	    	 String s="insert into comment(name) values (?)";
			PreparedStatement pstmt=con.prepareStatement(s);
			
			pstmt.setString(1, cr);
			pstmt.executeUpdate();
			sr=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sr;
	     
	}
	

}
