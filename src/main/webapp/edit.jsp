<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs - Edit Blog</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body class="back-img">
<div class="container-fluid">
    <%@include file="all_component/navbar.jsp"%>

    <%
    // Check if user is logged in
    com.user.UserDetails currentUser = (com.user.UserDetails) session.getAttribute("userD");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login_error", "Please Login to edit blogs");
        return;
    }

    Integer noteid= Integer.parseInt(request.getParameter("note_id"));
    com.user.Post p = PostDAO.getBlogById(noteid);

    // Check if the blog exists
    if (p == null) {
        response.sendRedirect("showblogs.jsp");
        return;
    }

    // Check if the current user is the author of the blog
    if (!p.getAuthor().equals(currentUser.getUsername())) {
        response.sendRedirect("showblogs.jsp");
        session.setAttribute("UpdateMsg", "You can only edit your own blogs");
        return;
    }
    %> 

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card bg-transparent">
                    <div class="card-body">
                        <h2 class="text-center text-light mb-4">Edit Your Blog</h2>

                        <form action="BlogEditServlet" method="post">
                            <input type="hidden" value="<%= noteid %>" name="note_id">

                            <div class="mb-3">
                                <label for="title" class="form-label text-light">Blog Title</label>
                                <input type="text" class="form-control" id="title" name="title" 
                                    required value="<%=p.getTitle()%>"/>
                            </div>

                            <div class="mb-3">
                                <label for="content" class="form-label text-light">Content</label>
                                <textarea rows="10" class="form-control" id="content" name="content" 
                                    required><%=p.getContent() %></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="imgUrl" class="form-label text-light">Image URL</label>
                                <input type="text" class="form-control" id="imgUrl" name="ImgUrl"
                                    required value="<%=p.getImgUrl() %>"/>
                            </div>

                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-lg text-light">Update Blog</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>