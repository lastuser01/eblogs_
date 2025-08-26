package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.user.Admin;
import com.user.Post;
import com.user.UserDetails;

public class AdminDAO {
	
	public Admin adminLogin(Admin a) {
		Admin ad = new Admin();
		try {
		Connection con =UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("select * from admin where email=? and password=?");
		pst.setString(1, a.getEmail());
		pst.setString(2, a.getPassword());
		
		ResultSet rs = pst.executeQuery();
		  
		while(rs.next()) {
			ad.setId(rs.getInt(1));
			ad.setName(rs.getString(2));
			ad.setEmail(rs.getString(3));
			ad.setPassword(rs.getString(4));
		}
		con.close();
	}
		catch (Exception e1) {
		}
		return ad;
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
	
	public boolean deleteUser(int id) throws ClassNotFoundException, SQLException {
		
		boolean f=false;
		
		Connection con =UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("delete form user where id=?");
		pst.setInt(1,id);
		
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
			p.setAuthor(rs.getString(4));
			p.setPdate(rs.getTimestamp(5));
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
			p.setAuthor(rs.getString(4));
			p.setPdate(rs.getTimestamp(5));
			p.setCategory(rs.getString(7));
			p.setImgUrl(rs.getString(8));
		} 
		con.close();
		
		
		return p;
		
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
			p.setAuthor(rs.getString(4));
			p.setPdate(rs.getTimestamp(5));
			p.setCategory(rs.getString(7));
			p.setImgUrl(rs.getString(8));
			
			list.add(p);
		} 
		con.close();
		
		
		return list;
		
	}
   
   
   

}