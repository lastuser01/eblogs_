package com.DAO;
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.user.UserDetails;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    /**
     * Adds a new user to the database
     * @param us UserDetails object with user information
     * @return true if operation is successful, false otherwise
     */
    public boolean addUser(UserDetails us) {
        boolean f = false;

        try {
            // Check if username or email already exists
            String checkQuery = "SELECT * FROM users WHERE username = ? OR email = ?";
            PreparedStatement checkPs = conn.prepareStatement(checkQuery);
            checkPs.setString(1, us.getUsername());
            checkPs.setString(2, us.getEmail());
            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {
                // Username or email already exists
                return false;
            }

            String query = "INSERT INTO users(fname, lname, username, email, password) VALUES(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, us.getFname());
            ps.setString(2, us.getLname());
            ps.setString(3, us.getUsername());
            ps.setString(4, us.getEmail());
            ps.setString(5, us.getPassword());

            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    /**
     * Authenticates a user with email and password
     * @param email User's email
     * @param password User's password
     * @return UserDetails object if login successful, null otherwise
     */
    public UserDetails loginUser(String email, String password) {
        UserDetails user = null;

        try {
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new UserDetails();
                user.setId(rs.getInt("id"));
                user.setFname(rs.getString("fname"));
                user.setLname(rs.getString("lname"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
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
