package com.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DBConnect;
import com.DAO.UserDAO;
import com.user.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String username = request.getParameter("uname");
        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword");

        UserDetails us = new UserDetails();
        us.setFname(fname);
        us.setLname(lname);
        us.setUsername(username);
        us.setEmail(email);
        us.setPassword(password);

        UserDAO dao = new UserDAO(DBConnect.getConn());
        boolean success = dao.addUser(us);

        HttpSession session = request.getSession();

        if (success) {
            session.setAttribute("reg_success", "Registration Successfully Done..");
            response.sendRedirect("register.jsp");
        } else {
            session.setAttribute("reg_failed", "Username or email already exists!");
            response.sendRedirect("register.jsp");
        }
    }
}
