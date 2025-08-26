package com.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DBConnect;
import com.DAO.PostDAO;

@WebServlet("/AddBlogServlet")
public class AddBlogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String category = request.getParameter("category");
            String imgUrl = request.getParameter("imgUrl");

            HttpSession session = request.getSession();
            UserDetails user = (UserDetails) session.getAttribute("userD");

            if (user == null) {
                session.setAttribute("login_error", "Please Login to add a blog");
                response.sendRedirect("login.jsp");
                return;
            }

            PostDAO dao = new PostDAO(DBConnect.getConn());
            boolean f = dao.addBlog(title, content, user.getUsername(), category, imgUrl);

            if (f) {
                session.setAttribute("blog_success", "Blog published successfully!");
                response.sendRedirect("addBlog.jsp");
            } else {
                session.setAttribute("blog_error", "Something went wrong on server");
                response.sendRedirect("addBlog.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
