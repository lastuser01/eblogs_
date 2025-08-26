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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword");

        UserDAO dao = new UserDAO(DBConnect.getConn());
        UserDetails user = dao.loginUser(email, password);

        HttpSession session = request.getSession();

        if (user != null) {
            session.setAttribute("userD", user);
            response.sendRedirect("showblogs.jsp");
        } else {
            session.setAttribute("login_error", "Invalid Email or Password");
            response.sendRedirect("login.jsp");
        }
    }
}
