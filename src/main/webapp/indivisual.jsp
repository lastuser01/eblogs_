<!DOCTYPE html>
<%@page import="com.user.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.user.Post"%>
<%@page import="com.DAO.PostDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs - View Blog</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body class="back-img">
<div class="container-fluid">
    <%@include file="all_component/navbar.jsp"%>

    <%
    Integer blogId = Integer.parseInt(request.getParameter("id"));
    Post post = PostDAO.getBlogById(blogId);
    %>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h1 class="text-light text-center"><%= post.getTitle() %></h1>
                <div class="text-center mt-3">
                    <img src="<%= post.getImgUrl() %>" class="img-fluid" style="max-height: 400px;" alt="Blog Image">
                </div>
                <div class="mt-4">
                    <p class="text-light">
                        <i class="fa fa-user-circle" aria-hidden="true"></i> Author: <%= post.getAuthor() %>
                        <span class="ml-3"><i class="fa fa-calendar"></i> Date: <%= post.getPdate().toString().substring(0, 10) %></span>
                        <span class="ml-3"><i class="fa fa-tag"></i> Category: <%= post.getCategory() %></span>
                    </p>
                </div>
                <div class="mt-4">
                    <p class="text-light" style="font-family: serif; font-size: 1.2rem; line-height: 1.6;">
                        <%= post.getContent() %>
                    </p>
                </div>

                <% 
                // Check if the current user is the author of the blog
                com.user.UserDetails user = (com.user.UserDetails) session.getAttribute("userD");
                if (user != null && post.getAuthor().equals(user.getUsername())) {
                %>
                <div class="text-center mt-4">
                    <a href="edit.jsp?note_id=<%= post.getId() %>" class="btn btn-primary mr-2">Edit</a>
                    <a href="DeleteServlet?note_id=<%= post.getId() %>" class="btn btn-danger">Delete</a>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon"
	href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs</title>
<%@include file="all_component/allcss.jsp"%>
</head>

<body class="back-img ">


	<!--------------------------------------------------- Navbar --------------------------------------------------->
	<div class="px-4">
		<%@include file="all_component/navbar.jsp"%>
	</div>
	<hr class="text-light m-0 ">

	<div class="container">
		<div class="row">
			<i
				class="fa fa-angle-left text-light col-1 text-center d-flex align-items-center justify-content-center"
				aria-hidden="true"></i>
			<div id="filters"
				class="container d-flex flex-nowrap overflow-scroll text-light w-100 justify-content-center col">
				<a href="showblogs.jsp"
					class="filter flex-shrink-0 text-decoration-none">For You</a> <a
					href="filter.jsp?category=Self Improvement"
					class="filter flex-shrink-0 text-decoration-none">Self
					Improvement</a> <a href="filter.jsp?category=Technology"
					class="filter flex-shrink-0 text-decoration-none">Technology</a> <a
					href="filter.jsp?category=Programming"
					class="filter flex-shrink-0 text-decoration-none">Programming</a> <a
					href="filter.jsp?category=Health and Wellness"
					class="filter flex-shrink-0 text-decoration-none">Health and
					Wellness</a> <a href="filter.jsp?category=Finance"
					class="filter flex-shrink-0 text-decoration-none">Finance</a> <a
					href="filter.jsp?category=Entertainment"
					class="filter flex-shrink-0 text-decoration-none">Entertainment</a>
				<a href="filter.jsp?category=Lifestyle"
					class="filter flex-shrink-0 text-decoration-none">Lifestyle</a> <a
					href="filter.jsp?category=Business"
					class="filter flex-shrink-0 text-decoration-none">Business</a>
			</div>
			<i
				class="fa fa-angle-right text-light col-1 text-center d-flex align-items-center justify-content-center"
				aria-hidden="true"></i>
		</div>
		<hr class="text-light m-1 ">
		<div class="container d-flex ">

			<%
			com.user.UserDetails user1 = (com.user.UserDetails) session.getAttribute("userD");

			String updateMsg = (String) session.getAttribute("UpdateMsg");
			if (updateMsg != null) {
			%>

			<div class="alert alert-success" role="alert"><%=updateMsg%></div>

			<%
			session.removeAttribute("UpdateMsg");
			}
			String delMsg = (String) session.getAttribute("DeleteMsg");
			if (delMsg != null) {
			%>

			<div class="alert alert-success" role="alert"><%=delMsg%></div>

			<%
			session.removeAttribute("DeleteMsg");
			}
			%>


			<div class="container mt-2 pt-lg-4 text-light"
				style="max-width: 700px;">
				<%
				int pid = Integer.parseInt(request.getParameter("id"));
				System.out.println("pid is " + pid);

				if ((user1 == null || user1 != null)) {
					Post po = com.DAO.PostDAO.getBlogById(pid);
				%>

				<!------------------------------------ content of blog ---------------------------------------------------------------- -->
				<h1 class="fw-bold "><%=po.getTitle()%></h1>
				<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
				<div class="d-flex align-items-center gap-2 my-4 mb-5">
					<i class="fa fa-user-circle" aria-hidden="true"></i>
					<div class="d-flex align-items-center"><%=po.getAuthor()%>
						<button class="btn btn-outline-light ms-3 py-1 px-3 text-dark" onClick="follow()" id="follow">Follow</button>
						&nbsp;&nbsp;&nbsp;&nbsp; <span> 5 min read
							&nbsp;&nbsp;&nbsp;&nbsp;<%=po.getPdate().toString().substring(0, 10)%></span>
					</div>
				</div>
				<script>
				if (localStorage.getItem("following") === null) {
			        localStorage.setItem("following", "false");
			    }	
				updateFollowButton();

			    function follow() {
			        let following = localStorage.getItem("following");

			        if (following === "false") {
			            localStorage.setItem("following", "true");
			        } else {
			            localStorage.setItem("following", "false");
			        }

			        updateFollowButton(); // Update UI
			    }

			    function updateFollowButton() {
			        let following = localStorage.getItem("following");
			        document.getElementById("follow").innerText = (following === "true") ? "Following" : "Follow";
			    }
					  
					  </script>
				<hr>
				<div class="row">
					<div class="text-light col-2">

						<form action="like" method="post" style="display: inline;"
							onsubmit="return preventMultipleLikes(<%=po.getId()%>)">
							<input type="hidden" name="postId" value="<%=po.getId()%>" />
							<button class="btn bg-transparent text-light" type="submit"
								id="like-btn-<%=po.getId()%>">
								<i class="fa fa-thumbs-up" aria-hidden="true"></i>
								<%=po.getLikes()%>
							</button>
						</form>

						<script>
							function preventMultipleLikes(postId) {
    							// Check localStorage for this post
   								 if (localStorage.getItem('liked_post_' + postId)) {
    						    alert("You've already liked this post.");
    						    return false; // prevent form submission
   								} 
   								 else
   								 {
							        // Mark as liked
    							    localStorage.setItem('liked_post_' + postId, 'true');
        							return true; // allow form to submit
   								 }
							}
					  
					  </script>

					</div>
					<div class="text-light col-2">
						<i class="fa fa-comment" aria-hidden="true"></i><span> 50</span>
					</div>
					<div class="col-6"></div>
					<a href="" class="col"><svg xmlns="http://www.w3.org/2000/svg"
							width="24" height="24" fill="none" viewBox="0 0 24 24"
							class="text-light">
							<path fill="currentColor" fill-rule="evenodd"
								d="M4.385 12c0 .55.2 1.02.59 1.41.39.4.86.59 1.41.59s1.02-.2 1.41-.59c.4-.39.59-.86.59-1.41s-.2-1.02-.59-1.41a1.93 1.93 0 0 0-1.41-.59c-.55 0-1.02.2-1.41.59-.4.39-.59.86-.59 1.41m5.62 0c0 .55.2 1.02.58 1.41.4.4.87.59 1.42.59s1.02-.2 1.41-.59c.4-.39.59-.86.59-1.41s-.2-1.02-.59-1.41a1.93 1.93 0 0 0-1.41-.59c-.55 0-1.03.2-1.42.59s-.58.86-.58 1.41m5.6 0c0 .55.2 1.02.58 1.41.4.4.87.59 1.43.59s1.03-.2 1.42-.59.58-.86.58-1.41-.2-1.02-.58-1.41a1.93 1.93 0 0 0-1.42-.59c-.56 0-1.04.2-1.43.59s-.58.86-.58 1.41"
								clip-rule="evenodd"></path></svg></a>
				</div>
				<hr>
				<img src="<%=po.getImgUrl()%>" alt="Article Image"
					class="img-fluid  my-5">
				<p class="text-light">
				<pre
					style="white-space: pre-wrap; word-wrap: break-word; font-family: serif; font-size: 25px;"><%=po.getContent()%></pre>
				</p>


				<%
				}
				%>




				<div></div>

			</div>
</body>
</html>