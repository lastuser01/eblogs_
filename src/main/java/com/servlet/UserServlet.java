package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.user.UserDetails;


@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("fname");
		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword");
		
		UserDetails u = new UserDetails();
		u.setName(name);
		u.setEmail(email);
		u.setPassword(password);

		UserDAO dao = new UserDAO();
		
		
			boolean f=false;
			try {
				f = dao.addUser(u);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		HttpSession session = request.getSession();
		
		if(f) {
			session.setAttribute("reg_success","Registration Successfully");
			response.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("reg_success","Registration Failed");
			response.sendRedirect("register.jsp");
		}
		
	}

}
