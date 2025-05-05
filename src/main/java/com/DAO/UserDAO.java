package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.UserDetails;

public class UserDAO {
	public static Connection getConn() throws ClassNotFoundException, SQLException {
		Connection con= null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eblogs1","root","MySQL@123");
		return con;

	}
	
	public boolean addUser(UserDetails u) throws ClassNotFoundException, SQLException {
	
		boolean f=false;
		
		Connection con =UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("Insert into user(name,email,password) values(?,?,?)");
		pst.setString(1, u.getName());
		pst.setString(2, u.getEmail());
		pst.setString(3, u.getPassword());
		
		
		int i=pst.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		con.close();
		return f;
		
	}
	
	
	public UserDetails loginUser(UserDetails u) {
		UserDetails user = new UserDetails();
		try {
		Connection con =UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("select * from user where email=? and password=?");
		pst.setString(1, u.getEmail());
		pst.setString(2, u.getPassword());
		
		ResultSet rs = pst.executeQuery();
		  
		while(rs.next()) {
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setPassword(rs.getString(4));
		}
		con.close();
	}
		catch (Exception e1) {
			// TODO: handle exception
		}
				return user;
	}

}
