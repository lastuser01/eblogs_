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
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.Post;
import com.user.UserDetails;

public class PostDAO {
    private Connection conn;

    public PostDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    // Method to get blog by category
    public static List<Post> getBlogByCategory(String category) {
        List<Post> list = new ArrayList<>();

        try {
            Connection conn = DBConnect.getConn();
            String query = "SELECT * FROM posts WHERE category=? ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, category);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setAuthor(rs.getString("author"));
                p.setCategory(rs.getString("category"));
                p.setPdate(rs.getTimestamp("pdate"));
                p.setImgUrl(rs.getString("imgUrl"));
                p.setLikes(rs.getInt("likes"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Method to get blog by ID
    public static Post getBlogById(int noteId) {
        Post p = null;

        try {
            Connection conn = DBConnect.getConn();
            String query = "SELECT * FROM posts WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, noteId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Post();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setAuthor(rs.getString("author"));
                p.setCategory(rs.getString("category"));
                p.setPdate(rs.getTimestamp("pdate"));
                p.setImgUrl(rs.getString("imgUrl"));
                try {
                    p.setLikes(rs.getInt("likes"));
                } catch (Exception e) {
                    // If likes column doesn't exist
                    p.setLikes(0);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    // Method to update a blog post
    public boolean updateBlog(int noteId, String title, String content, String imgUrl) {
        boolean f = false;

        try {
            String query = "UPDATE posts SET title=?, content=?, imgUrl=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, imgUrl);
            ps.setInt(4, noteId);

            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // Method to add a new blog post
    public boolean addBlog(String title, String content, String author, String category, String imgUrl) {
        boolean f = false;

        try {
            String query = "INSERT INTO posts(title, content, author, category, imgUrl) VALUES(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, author);
            ps.setString(4, category);
            ps.setString(5, imgUrl);

            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // Method to delete a blog post
    public boolean deleteBlog(int noteId) {
        boolean f = false;

        try {
            String query = "DELETE FROM posts WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, noteId);

            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // Method to get all blog posts
    public static List<Post> getAllBlogs() {
        List<Post> list = new ArrayList<>();

        try {
            Connection conn = DBConnect.getConn();
            String query = "SELECT * FROM posts ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post p = new Post();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setAuthor(rs.getString("author"));
                p.setCategory(rs.getString("category"));
                p.setPdate(rs.getTimestamp("pdate"));
                p.setImgUrl(rs.getString("imgUrl"));
                try {
                    p.setLikes(rs.getInt("likes"));
                } catch (Exception e) {
                    // If likes column doesn't exist
                    p.setLikes(0);
                }
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
	
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
			p.setLikes(rs.getInt(9));
			list.add(p);
		}
		con.close();
		return list;
	}
	
public static List<Post> showBlogsbyId(int id) throws ClassNotFoundException, SQLException{
		
		List<Post> list = new ArrayList<Post>();
	
		Connection con =UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("select * from post");
//		pst.setInt(1,id);
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
			p.setLikes(rs.getInt(9));
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
			p.setLikes(rs.getInt(9));
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
   
   public static void increment_like(int id) throws SQLException, ClassNotFoundException
   {    
		Connection con = UserDAO.getConn();
		PreparedStatement pst = con.prepareStatement("UPDATE post SET likes = likes + 1 WHERE id =?");
		System.out.println("working");
		
		 pst.setInt(1, id);
         int rowsAffected = pst.executeUpdate();

         if (rowsAffected > 0) {
             System.out.println("Likes incremented for post ID: " + id);
         } else {
             System.out.println("No post found with ID: " + id);
         }
   }   
   
   

}
