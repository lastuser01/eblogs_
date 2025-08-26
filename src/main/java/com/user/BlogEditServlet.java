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

@WebServlet("/BlogEditServlet")
public class BlogEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Integer noteId = Integer.parseInt(request.getParameter("note_id"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String imgUrl = request.getParameter("ImgUrl");

            PostDAO dao = new PostDAO(DBConnect.getConn());
            boolean f = dao.updateBlog(noteId, title, content, imgUrl);

            HttpSession session = request.getSession();

            if (f) {
                session.setAttribute("UpdateMsg", "Blog Updated Successfully");
                response.sendRedirect("showblogs.jsp");
            } else {
                session.setAttribute("UpdateMsg", "Something went wrong on server");
                response.sendRedirect("showblogs.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
