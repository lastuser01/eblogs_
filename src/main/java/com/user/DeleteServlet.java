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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Integer noteId = Integer.parseInt(request.getParameter("note_id"));

            // Check if user is logged in and is the author of the blog
            HttpSession session = request.getSession();
            UserDetails user = (UserDetails) session.getAttribute("userD");

            if (user == null) {
                session.setAttribute("login_error", "Please Login to delete blogs");
                response.sendRedirect("login.jsp");
                return;
            }

            Post post = PostDAO.getBlogById(noteId);
            if (post == null) {
                session.setAttribute("DeleteMsg", "Blog not found");
                response.sendRedirect("showblogs.jsp");
                return;
            }

            if (!post.getAuthor().equals(user.getUsername())) {
                session.setAttribute("DeleteMsg", "You can only delete your own blogs");
                response.sendRedirect("showblogs.jsp");
                return;
            }

            PostDAO dao = new PostDAO(DBConnect.getConn());
            boolean f = dao.deleteBlog(noteId);

            if (f) {
                session.setAttribute("DeleteMsg", "Blog Deleted Successfully");
                response.sendRedirect("showblogs.jsp");
            } else {
                session.setAttribute("DeleteMsg", "Something went wrong on server");
                response.sendRedirect("showblogs.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
