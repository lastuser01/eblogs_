package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.PostDAO;

@WebServlet("/BlogEditServlet")
public class BlogEditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noteid = Integer.parseInt(request.getParameter("note_id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String imgUrl = request.getParameter("imgUrl");
		
		boolean f = false;
		try {
			f = PostDAO.updateBlog(title, content, imgUrl, noteid);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(f)
		{
			System.out.println("data update successfully..");
			HttpSession  session = request.getSession();
			
			session.setAttribute("UpdateMsg", "Blog Updated Successfully");
			response.sendRedirect("showblogs.jsp");
		}
		else
		{
			System.out.println("data not updated..");
		}
		
	}

}
