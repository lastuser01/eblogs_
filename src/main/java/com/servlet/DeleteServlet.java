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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int noteid = Integer.parseInt(request.getParameter("note_id"));

		boolean f=false;
		try {
			f = PostDAO.deleteBlog(noteid);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		
		if(f)
		{
			
			session.setAttribute("DeleteMsg", "Blog Deleted Successfully");
			response.sendRedirect("showblogs.jsp");
			
		}
		else
		{
			 session.setAttribute("wrongMsg", "Something went wrong on server");
			 response.sendRedirect("showblogs.jsp");
		}
		
		
	

}}
