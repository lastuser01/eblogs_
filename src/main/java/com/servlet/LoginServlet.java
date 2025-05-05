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

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword");
		
		UserDetails u = new UserDetails();
		u.setEmail(email);
		u.setPassword(password);
		
		UserDAO dao = new UserDAO();
		UserDetails user= dao.loginUser(u);
		
		System.out.println(user);
		HttpSession session = request.getSession();
		
		if(user.getId()!=0){
			session.setAttribute("userD",user);
			response.sendRedirect("showblogs.jsp");
		}
		else {
			session.setAttribute("login_failed","Invalid Email And Password");
			response.sendRedirect("login.jsp");
		}
	}
}	