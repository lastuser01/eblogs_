package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.DAO.PostDAO;
import com.DAO.UserDAO;
import com.user.Post;
import com.user.UserDetails;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category=request.getParameter("category");
		String imgUrl=request.getParameter("imgUrl");
		

		System.out.println(uid+" "+title+" "+content); 	
		HttpSession session=request.getSession();
		
		com.user.UserDetails user1 = (com.user.UserDetails) session.getAttribute("userD");
		String auth=user1.getName();
		System.out.println("author"+user1.getName());
		
		PostDAO dao = new PostDAO();
			
		boolean f = false;
		try {
			f = dao.addBlog(title,content, uid,auth,category,imgUrl);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
		if(f) {
			System.out.println("post added Successfully");
			response.sendRedirect("showblogs.jsp");
		}
		else {
			response.sendRedirect("addblogs.jsp");
		}
		

	}

}
