package com.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.AdminDAO;
import com.user.Admin;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("aemail");
		String password = request.getParameter("apassword");
		
		Admin a = new Admin();
		a.setEmail(email);
		a.setPassword(password);
		
		AdminDAO dao = new AdminDAO();
		Admin ad= dao.adminLogin(a);
		
		System.out.println(ad);
		HttpSession session = request.getSession();
		
		if(ad.getId()!=0){
			session.setAttribute("adminS",ad);
			response.sendRedirect("AdminPage.jsp");
		}
		else {
			session.setAttribute("login_failed","Invalid Email And Password");
			response.sendRedirect("AdminLogin.jsp");
		}
	}

}