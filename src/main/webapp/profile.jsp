<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.user.Post"%>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body>
<div class="px-4">
    <%@include file="all_component/navbar.jsp"%>
</div>
<hr>
<div class="container mt-4">
 <%   com.user.UserDetails user1 = (com.user.UserDetails) session.getAttribute("userD");%>
      <div class="row">
        <!-- Left/Main Column -->
        <div class="col-lg-8">
          <h2><strong><%= user1.getName() %></strong></h2>
          <div class="">
            <p class="text-muted small mb-1">375 followers</p>
            <p class="text-muted small">
              Passionate writer and engineer sharing insights on AI,
              productivity, and programming.
            </p>
            <button class="btn  btn-sm me-2">Follow</button>
            
          </div>
          <br><br>
          <ul class="nav mb-4 border-bottom ">
            <li class="nav-item ">
              <a class="nav-link text-muted ps-0" href="#">Home</a>
            </li>
            <li class="nav-item">   
              <a class="nav-link text-muted" href="#">About</a>
            </li>
          </ul>

           <%   
           		java.util.List<Post> post = com.DAO.PostDAO.showBlogs();
                for(Post po : post) { 
                if(user1 != null && po.getAuthor().equals(user1.getName())) {%>
          <a href="indivisual.jsp?id=<%= po.getId() %>" class="row text-decoration-none">       
          <div class="card border-0 mb-4 article-card">
            <div class="card-body d-flex justify-content-between">
              <div class="me-3">
                <p class="text-muted small mb-1">
                  Published in <strong>Write A Catalyst</strong>
                </p>
                <h5 class="article-title">
                 <%=po.getTitle() %>
                </h5>
                <p class="text-muted small">
                  <%=po.getContent() %>
                </p>
                <p class="text-muted small mb-0">6h ago · 👁️ 223 · 💬 5</p>
              </div>
              <img
                src="<%=po.getImgUrl() %>"
                class="rounded"
                alt="money"
                height="100"
              />
            </div>
          </div>
          </a>
          <% } } %>
			 </div>

        <!-- Right/Sidebar Column -->
        <div class="col-lg-3 ms-5 ps-4 sidebar border-start h-auto">
          <div class="">
            <img src="https://i.pravatar.cc/105" class="rounded-circle mb-3" alt="<%=user1.getName()%>" loading="lazy" height="100" /> 
            <br>
            <h5><%=user1.getName() %></h5>
            <p class="text-muted small mb-1">375 followers</p>
            <p class="text-muted small">
              Passionate writer and engineer sharing insights on AI,
              productivity, and programming.
            </p>
            <button class="btn  btn-sm me-2">Follow</button>
          </div>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs - Profile</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body class="back-img">
    <%@include file="all_component/navbar.jsp"%>

    <%
    com.user.UserDetails user1 = (com.user.UserDetails) session.getAttribute("userD");

    if (user1 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login_error", "Please Login to view your profile");
    }
    %>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card bg-transparent">
                    <div class="card-body">
                        <div class="text-center mb-4">
                            <i class="fa fa-user-circle fa-5x text-light" aria-hidden="true"></i>
                            <h2 class="mt-3 text-light">Your Profile</h2>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label text-light">First Name</label>
                                <input type="text" class="form-control" value="<%= user1.getFname() %>" readonly>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label text-light">Last Name</label>
                                <input type="text" class="form-control" value="<%= user1.getLname() %>" readonly>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label text-light">Username</label>
                                <input type="text" class="form-control" value="<%= user1.getUsername() %>" readonly>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label text-light">Email</label>
                                <input type="email" class="form-control" value="<%= user1.getEmail() %>" readonly>
                            </div>
                        </div>

                        <div class="text-center mt-3">
                            <a href="edit_profile.jsp" class="btn text-light">Edit Profile</a>
                        </div>
                    </div>
                </div>

                <div class="card bg-transparent mt-4">
                    <div class="card-body">
                        <h3 class="text-center text-light mb-4">Your Blogs</h3>

                        <!-- This section would need to display user's blogs -->
                        <!-- For now, showing a placeholder message -->
                        <p class="text-center text-light">You haven't published any blogs yet.</p>
                        <div class="text-center">
                            <a href="addBlog.jsp" class="btn text-light">Write Your First Blog</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
          <div class="mt-4">
            <h6><strong>Following</strong></h6>
            <ul class="list-unstyled small">
              <li class="mb-2">📝 Writing Momentum</li>
              <li class="mb-2">👤 Rajesh Poovathum Kadavil</li>
              <li class="mb-2">👤 Priyadharshini V</li>
              <li class="mb-2">👤 Moeez Naveed</li>
              <li class="mb-2">👤 Aditi Jha</li>
              <li>
                <a href="#" class="text-decoration-none small">See all (279)</a>
              </li>
            </ul>
          </div>
       
      </div>
    </div>
</body>
</html>