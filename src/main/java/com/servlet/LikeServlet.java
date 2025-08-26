package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.PostDAO;

@WebServlet("/like")
public class LikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	int postId = Integer.parseInt(request.getParameter("postId"));
    	System.out.println(postId);
    	
//    	
//    	boolean liked=false;
    
        try {
            PostDAO.increment_like(postId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("indivisual.jsp?id="+postId);
    	
    
    
    }	
}