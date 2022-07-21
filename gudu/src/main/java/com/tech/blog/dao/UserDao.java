package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.Cookie;

import com.tech.blog.entities.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean f = false;

		try {

			String s = "insert into soul(uname, uemail, upassword, ugender, uabout) values (?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(s);

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;

	}

	public User showUser(String name, String password) {
        
		  User user=null;
		
		try {

			String q = "select * from soul where uemail = ? and upassword = ?";
			PreparedStatement pstmt = con.prepareStatement(q);

			pstmt.setString(1, name);
			pstmt.setString(2, password);

			ResultSet set = pstmt.executeQuery();

			user=new User();
			
			while (set.next()) {
				int ss = set.getInt("id");
				String ss0 = set.getString("uname");
				String ss1 = set.getString("uemail");
				String ss2 = set.getString("upassword");
				String ss3 = set.getString("ugender");
				String ss4 = set.getString("uabout");
				String ss5 = set.getString("uprofile");

				user = new User(ss, ss0, ss1, ss2, ss3, ss4, ss5);	
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	
	public boolean editDetailes(User user) {
		boolean br=false;
		try {
		
		String q="update soul set uname=?, uemail=?, upassword=?, ugender=?, uabout=?, uprofile=? where id=?";
		PreparedStatement pstmt=con.prepareStatement(q);
		
		pstmt.setString(1, user.getName());
		pstmt.setString(2, user.getEmail());
		pstmt.setString(3, user.getPassword());
		pstmt.setString(4, user.getGender());
		pstmt.setString(5, user.getAbout());
		pstmt.setString(6, user.getProfile());
		pstmt.setInt(7, user.getId());
		
		pstmt.executeUpdate();
		br=true;
		
		}catch(Exception e) {e.printStackTrace();}		
		
		return br;
	}

}
