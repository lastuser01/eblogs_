package com.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.user.UserDetails;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         request.getSession().invalidate();
         response.sendRedirect("login.jsp");
		
//		HttpSession session = request.getSession();
//		session.removeAttribute("addUser");
//		response.sendRedirect("login.jsp");
		
	}

}
