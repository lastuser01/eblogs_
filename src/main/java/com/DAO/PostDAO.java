package com.DAO;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.user.Post;


public class PostDAO {

	
	public boolean addBlog(String ti, String co, int ui,String auth,String category,String imgUrl) throws ClassNotFoundException, SQLException {
	
		boolean f=false;
		Connection con =UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("Insert into post(title,content,uid,author,category,imgUrl) values(?,?,?,?,?,?)");
		pst.setString(1, ti);
		pst.setString(2, co);
		pst.setInt(3, ui);
		pst.setString(4, auth);
		pst.setString(5, category);
		pst.setString(6, imgUrl);
		
		int i=pst.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		con.close();	
		return f;
	}
	
	
	
	public static List<Post> showBlogs() throws ClassNotFoundException, SQLException{
		
		List<Post> list = new ArrayList<Post>();
	
		Connection con =UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("select * from post order by id DESC");
		//pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		System.out.print(rs);
		while(rs.next()) {
			
			Post p = new Post();
			p.setId(rs.getInt(1));
			p.setTitle(rs.getString(2));
			p.setContent(rs.getString(3));
			p.setPdate(rs.getTimestamp(5));
			p.setAuthor(rs.getString(4));
			p.setCategory(rs.getString(7));
			p.setImgUrl(rs.getString(8));
			
			list.add(p);
		}
		con.close();
		return list;
	}
	
	
	public static Post getBlogById(int id) throws ClassNotFoundException, SQLException {
		
		Post p = new Post();
		
		Connection con = UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("select * from post where id=?");
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			p.setId(rs.getInt(1));
			p.setTitle(rs.getString(2));
			p.setContent(rs.getString(3));
			p.setPdate(rs.getTimestamp(5));
			p.setAuthor(rs.getString(4));
			p.setCategory(rs.getString(7));
			p.setImgUrl(rs.getString(8));
		} 
		con.close();
		
		
		return p;
		
	}
	
	public static boolean updateBlog(String ti, String co, String im, int id) throws ClassNotFoundException, SQLException {
		
		boolean f=false;
		Connection con = UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("update post SET title=?, content=?, imgUrl=? where id=?");
		pst.setString(1,ti);
		pst.setString(2, co);
		pst.setString(3, im);
		pst.setInt(4, id);
		int i=pst.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		con.close();	
		return f;
	}
	
	
	public static boolean deleteBlog(int id) throws ClassNotFoundException, SQLException {
	
		boolean f = false;
		
		Connection con = UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("delete from post where id=?");
		pst.setInt(1, id);
		
		int i=pst.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		con.close();	
		return f;
		
	}
	
   public static List<Post> getBlogByCategory(String cat) throws ClassNotFoundException, SQLException {
		
	   List<Post> list = new ArrayList<Post>();
		Post p = new Post();
		
		Connection con = UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("select * from post where category=?");
		pst.setString(1, cat);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			p.setId(rs.getInt(1));
			p.setTitle(rs.getString(2));
			p.setContent(rs.getString(3));
			p.setPdate(rs.getTimestamp(5));
			p.setAuthor(rs.getString(4));
			p.setCategory(rs.getString(7));
			p.setImgUrl(rs.getString(8));
			
			list.add(p);
		} 
		con.close();
		
		
		return list;
		
	}
   
   
   

}
