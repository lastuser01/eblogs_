<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="com.user.Post"%>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs</title>
<%@include file="all_component/allcss.jsp" %>
<style>
      body {
        background-color: #fff;
        font-family: "Segoe UI", sans-serif;
      }
      .article-title {
        font-weight: bold;
        font-size: 1.5rem;
      }
      .tab-active {
        border-bottom: 2px solid black;
        font-weight: 600;
      }
      .sidebar {
        position: sticky;
        top: 1rem;
      }
      .article-card:hover {
        background-color: #f8f9fa;
        transition: background-color 0.2s ease-in-out;
      }
    </style>
</head>
<body class="back-img">  
<div class="px-4">
    <%@include file="all_component/navbar.jsp"%>
</div>
<hr class="text-light m-0"/>
<div class="container d-flex  me-lg-3">
    <div class="col-lg-8 col-md-12 me-lg-5">
        <div id="filters" class="container d-flex flex-nowrap overflow-scroll text-light w-100">
            <a href="showblogs.jsp" class="filter flex-shrink-0 text-decoration-none">For You <span class="badge rounded-pill text-bg-success">New</span></a>
            <a href="filter.jsp?category=Self Improvement" class="filter flex-shrink-0 text-decoration-none">Self Improvement</a>
            <a href="filter.jsp?category=Technology" class="filter flex-shrink-0 text-decoration-none">Technology</a>
            <a href="filter.jsp?category=Programming" class="filter flex-shrink-0 text-decoration-none">Programming</a>
            <a href="filter.jsp?category=Health and Wellness"  class="filter flex-shrink-0 text-decoration-none">Health and Wellness</a>
            <a href="filter.jsp?category=Finance" class="filter flex-shrink-0 text-decoration-none">Finance</a>
           <a href="filter.jsp?category=Entertainment"  class="filter flex-shrink-0 text-decoration-none">Entertainment</a>
            <a href="filter.jsp?category=Lifestyle"  class="filter flex-shrink-0 text-decoration-none">Lifestyle</a>
            <a href="filter.jsp?category=Business"  class="filter flex-shrink-0 text-decoration-none">Business</a>
        </div>
        <hr class="text-light m-0">
        
        <%
        com.user.UserDetails user1 = (com.user.UserDetails) session.getAttribute("userD");
        
        String updateMsg = (String)session.getAttribute("UpdateMsg");
        if(updateMsg != null) { %>
            <div class="alert alert-success" role="alert"><%= updateMsg %></div>
        <% session.removeAttribute("UpdateMsg"); }
        
        String delMsg = (String)session.getAttribute("DeleteMsg");
        if(delMsg != null) { %>
            <div class="alert alert-success" role="alert"><%= delMsg %></div>
        <% session.removeAttribute("DeleteMsg"); }
        %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.user.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs - All Blogs</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body class="back-img">  
 <div class="px-4">
       <%@include file="all_component/navbar.jsp"%>
    </div>
<div class="container">

        <div id="filters" class="container d-flex flex-nowrap overflow-scroll text-light w-100 align-items-center justify-content-center">
            <a href="showblogs.jsp" class="filter flex-shrink-0 text-decoration-none">For You</a>
            <a href="filter.jsp?category=Self Improvement" class="filter flex-shrink-0 text-decoration-none">Self Improvement</a>
            <a href="filter.jsp?category=Technology" class="filter flex-shrink-0 text-decoration-none">Technology</a>
            <a href="filter.jsp?category=Programming" class="filter flex-shrink-0 text-decoration-none">Programming</a>
            <a href="filter.jsp?category=Health and Wellness" class="filter flex-shrink-0 text-decoration-none">Health and Wellness</a>
            <a href="filter.jsp?category=Finance" class="filter flex-shrink-0 text-decoration-none">Finance</a>
            <a href="filter.jsp?category=Entertainment" class="filter flex-shrink-0 text-decoration-none">Entertainment</a>
            <a href="filter.jsp?category=Lifestyle" class="filter flex-shrink-0 text-decoration-none">Lifestyle</a>
            <a href="filter.jsp?category=Business" class="filter flex-shrink-0 text-decoration-none">Business</a>
        </div>
        <hr class="text-light m-0">
    <%
    com.user.UserDetails user1 = (com.user.UserDetails) session.getAttribute("userD");
    %>

    <%
        String updateMsg = (String)session.getAttribute("UpdateMsg");

       if(updateMsg != null)
       {%>
           <div class="alert alert-success" role="alert"><%= updateMsg%></div>
       <%
       session.removeAttribute("UpdateMsg");
       }
    %>

    <%
        String delMsg = (String)session.getAttribute("DeleteMsg");

       if(delMsg != null)
       {%>
           <div class="alert alert-success" role="alert"><%= delMsg%></div>
       <%
       session.removeAttribute("DeleteMsg");
       }
    %>

    <div class="container mt-5">
        <%
        // Get all blogs
        List<Post> posts = PostDAO.getAllBlogs();

        if(posts.isEmpty()) {
        %>
            <div class="text-center text-light mt-5">
                <h3>No blogs found</h3>
                <p>Be the first to publish a blog!</p>
                <% if(user1 != null) { %>
                    <a href="addBlog.jsp" class="btn text-light mt-3">Create Blog</a>
                <% } else { %>
                    <a href="login.jsp" class="btn text-light mt-3">Login to Create Blog</a>
                <% } %>
            </div>
        <% } else {
            for(Post po : posts) {
        %>
        <a href="indivisual.jsp?id=<%= po.getId() %>" class="row text-decoration-none">
          <div class="card-body px-4 col-5">
             <p class="my-4 text-light">
                <i class="fa fa-user-circle" aria-hidden="true"></i> <%=po.getAuthor() %>
             </p>
             <h3 class="card-title text-light"><%=po.getTitle() %></h3>
             <p class="text-light overflow-hidden my-2" style="height:2.8rem; font-family: serif;"> <%= po.getContent() %> </p>

                <div class="row">
                 <p class="text-light col-2">
                <i class="fa fa-thumbs-up" aria-hidden="true"></i><span> <%= po.getLikes() %></span>
                </p>
                <p class="text-light col-3"> <%= po.getCategory() %> </p>
                <p class="col-2">
                 <b class="fw-light text-light"> <%=po.getPdate().toString().substring(0, 10)%></b>
                 </p>
                </div>

          </div>
         <div class="col-lg-3 d-flex align-items-center">
             <img src="<%=po.getImgUrl() %>" class="card-img-top h-75" alt="Blog Image" onerror="this.src='https://via.placeholder.com/150?text=No+Image'">
         </div>
        </a>
        <hr class="text-light">
        <% } } %>
    </div>
</div>
</body>
</html>
        <div class="container mt-2 pt-lg-4 overflow-y-scroll" id="showblog" style="height:100vh;">
            <% if((user1 == null || user1 != null)) {
                java.util.List<Post> post = com.DAO.PostDAO.showBlogs();
                for(Post po : post) { %>
                <a href="indivisual.jsp?id=<%= po.getId() %>" class="row text-decoration-none">
                    <div class="card-body px-4 col-lg-4 ">
                        <p class="my-3 text-light">    
                            <img src="https://i.pravatar.cc/101"  class="rounded-circle" alt="author"
                 						 loading="lazy" height="30" /> <%=po.getAuthor() %>
                        </p>
                        <h3 class="card-title text-light mb-2"><%=po.getTitle() %></h3>
                        <p class="text-light "><%= po.getCategory() %></p>
                        <p class="text-light overflow-hidden my-3 " style="height:1.8rem; font-family: serif;"><%= po.getContent() %></p>
                        <div class="row">
                            <p class="col-3">
                                <b class="fw-light text-light"><%=po.getPdate().toString().substring(0, 10)%></b>
                            </p>
                             &#128077;<p class="text-light col-2"><span> <%= po.getLikes() %></span>
                            </p>
                             <p class="text-light col-2"> 
                             			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-text" viewBox="0 0 16 16">
  											<path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>
 										    <path d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8m0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5"/>
									    </svg>
                             
                             <span>50</span>
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-3 d-flex align-items-center"><img src="<%=po.getImgUrl() %>" class="card-img-top" alt="..."></div>
                    <hr class="text-light">
                </a>
                
            <% } } %>
        </div>
    </div>
    
    <!-- Right sidebar -->
    <div class=" right-sidebar border-start border-secondary-subtle ms-5 d-none d-lg-flex d-xl-flex ps-lg-3  overflow-y-scroll" id="sidebarscroll" style="height:115vh; max-width:30rem;">
        <div class="p-4">
            <!-- Writing on Medium Card -->
            <div class="card text-dark p-3 mb-4" style="background-color: #cce4ff;">
                <div class="d-flex justify-content-between align-items-start">
                    <h5 class="card-title mb-3 fw-bold">Writing on Medium</h5>
                </div>
                <ul class="list-unstyled">
                    <li>New writer FAQ</li>
                    <li>Expert writing advice</li>
                    <li>Grow your readership</li>
                </ul>
                <a href="addblogs.jsp" class="btn btn-sm mt-2">Start writing</a>
            </div>
            
            <!-- Recommended Topics -->
            <div class="mb-4">
                <h5 class="fw-bold mb-3 text-light">Recommended topics</h5>
                <div class="d-flex flex-wrap gap-2 mb-3">
                    <button class=" rounded-pill px-3 py-1 bg-light text-dark border">Data Science</button>
                    <button class=" rounded-pill px-3 py-1 bg-light text-dark border">Writing</button>
                    <button class=" rounded-pill px-3 py-1 bg-light text-dark border">Relationships</button>
                    <button class=" rounded-pill px-3 py-1 bg-light text-dark border">Productivity</button>
                    <button class=" rounded-pill px-3 py-1 bg-light text-dark border">Politics</button>
                    <button class=" rounded-pill px-3 py-1 bg-light text-dark border">Cryptocurrency</button>
                    <button class=" rounded-pill px-3 py-1 bg-light text-dark border">Machine Learning</button>
                </div>
                <a href="#" class="text-light small">See more topics</a>
            </div>
            
            <!-- Who to Follow Card -->
            <div class="card rounded-4 shadow-sm mb-4">
                <div class="card-header  border-0 pb-0">
                    <h5 class="card-title 	 fs-5 px-3 pt-2 text-light lead">Who to follow</h5>
                </div>
                
                <div class="card-body py-2 px-3 border-bottom">
                    <div class="d-flex justify-content-between">
                        <div class="me-2">
                            <div class="fw-bold text-light">Devlink Tips</div>
                            <div class="text-light small">@devlinktips</div>
                            <div class="small text-light">Cloud consulting for developers. Helping you find the right tools and services for your projects.</div>
                        </div>
                        <button class="btn  btn-sm rounded-pill align-self-start fw-bold px-3">Follow</button>
                    </div>
                </div>
                
                <div class="card-body py-2 px-3 border-bottom">
                    <div class="d-flex justify-content-between">
                        <div class="me-2">
                            <div class=" text-light">Psvc Digest</div>
                            <div class="small text-light">@psvcdigest</div>
                            <div class="small text-light">Publication. Explore human psychology and self-improvement with curated insights.</div>
                        </div>
                        <button class="btn  btn-sm rounded-pill align-self-start fw-bold px-3">Follow</button>
                    </div>
                </div>
                
                <div class="card-body py-2 px-3">
                    <div class="d-flex justify-content-between">
                        <div class="me-2">
                            <div class=" text-light">Thomas Oppong</div>
                            <div class=" text-light small">@thomasoppong</div>
                            <div class="small text-light">The wisdom of great minds. My essays cross between psychology, philosophy, and productivity.</div>
                        </div>
                        <button class="btn  btn-sm rounded-pill align-self-start fw-bold px-3">Follow</button>
                    </div>
                </div>
                
                <div class="card-footer  border-0">
                    <a href="#" class="text-primary text-decoration-none px-3 py-2 d-block">See more suggestions</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>