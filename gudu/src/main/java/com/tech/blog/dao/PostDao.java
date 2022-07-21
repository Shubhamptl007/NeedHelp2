package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	
	private Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}
	
	
	public ArrayList<Category> category(){
		
		ArrayList<Category> arr=new ArrayList<>();
		
		try {

			String q = "select * from categories";

			Statement stmt = con.createStatement();

			ResultSet set = stmt.executeQuery(q);

			while (set.next()) {

				int id = set.getInt("cid");
				String name = set.getString("name");
				String desc = set.getString("description");

				Category c = new Category(id, name, desc);
				arr.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return arr;
		
	}
	
	
	public boolean postData(Post post) {
		boolean sc=false;
		try {
		String q="insert into posts(pTitle, pContent, pCode, pPic, catID, userID) values(?, ?, ?, ?, ?, ?)";
          
		
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1, post.getpTitle());
			pstmt.setString(2, post.getpContent());
			pstmt.setString(3, post.getpContent() );
			pstmt.setString(4, post.getpPic() );
			pstmt.setInt(5, post.getCatID() );
			pstmt.setInt(6, post.getUserID());
			
			pstmt.executeUpdate();
			
			sc=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sc;
		
	}
		
	
	
	//Get data from Post Table

		public ArrayList<Post> getAllPost() {
			ArrayList<Post> list = new ArrayList<>();

			try {
				String q = "select * from posts";

				Statement stmt = con.createStatement();

				ResultSet set1 = stmt.executeQuery(q);

				while (set1.next()) {
					int id = set1.getInt("pid");
					String title = set1.getString("pTitle");
					String content = set1.getString("pContent");
					String code = set1.getString("pCode");
					String pic = set1.getString("pPic");
					int catid = set1.getInt("catID");
					int userid = set1.getInt("userId");

					Post pst = new Post(id, title, content, code, pic, catid, userid);
					list.add(pst);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;

		}

	//Get data from Post table with CatId	

		public List<Post> getPostById(int catid) {

			ArrayList<Post> list = new ArrayList<>();

			try {
				String q = "select * from posts where catID=?";

				PreparedStatement pstmt = con.prepareStatement(q);
				pstmt.setInt(1, catid);

				ResultSet set1 = pstmt.executeQuery();

				while (set1.next()) {
					int id = set1.getInt("pid");
					String title = set1.getString("pTitle");
					String content = set1.getString("pContent");
					String code = set1.getString("pCode");
					String pic = set1.getString("pPic");
					int userid = set1.getInt("userId");

					Post pst = new Post(id, title, content, code, pic, catid, userid);
					list.add(pst);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return list;
		}
		
		public Post getPostBYPId(int postId){
			
			Post post=null;
		
				try {
				String q = "select * from posts where pid=?";

				PreparedStatement pstmt = con.prepareStatement(q);
				pstmt.setInt(1, postId);

				ResultSet set1 = pstmt.executeQuery();

				while (set1.next()) {
					
					String title = set1.getString("pTitle");
					String content = set1.getString("pContent");
					String code = set1.getString("pCode");
					String pic = set1.getString("pPic");
					int catid = set1.getInt("catID");
					int userid = set1.getInt("userId");

					post = new Post(title, content, code, pic, catid, userid);
					

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return post;
		
			
		}

		
		
		
	}
	
	

