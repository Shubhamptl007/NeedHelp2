package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Comment;
import com.tech.blog.entities.Post;

public class CommentDao {

	private Connection con;

	public CommentDao(Connection con) {
		this.con = con;
	}

	public Boolean docomment(Comment comm) {
		Boolean args = false;

		try {

			String q = "insert into comment(comment, Cname, Cemail, commentid) values(?, ?, ?, ?)";

			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, comm.getComment());
			pstmt.setString(2, comm.getCname());
			pstmt.setString(3, comm.getCemail());
			pstmt.setInt(4, comm.getCommentid());

			pstmt.executeUpdate();
             
			args=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return args;

	}
	
	public List<Comment> getComment(int i) {
		
		ArrayList<Comment> list = new ArrayList<>();
		
		try {
			
			String q="select * from comment where commentid=?";
			
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setInt(1, i);
			
			ResultSet set=pstmt.executeQuery();
			
			while(set.next()) {
				int id=set.getInt("idcom");
				String comment=set.getString("comment");
				String name=set.getString("Cname");
				String email=set.getString("Cemail");
			
				Comment cr=new Comment(id, comment, name, email);
				list.add(cr);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
