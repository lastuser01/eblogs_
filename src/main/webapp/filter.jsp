<!DOCTYPE html>
<%@page import="com.user.Post"%>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body class="back-img">  
 <div class="px-4">
	   <%@include file="all_component/navbar.jsp"%>
	</div>
<div  class="container ">
	
        <div id="filters" class="container d-flex flex-nowrap overflow-scroll text-light w-100  align-items-center justify-content-center">
            <a href="showblogs.jsp" class="filter flex-shrink-0 text-decoration-none">For You</a>
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
	
	//if (user1 == null) {
		//response.sendRedirect("login.jsp");
	//	session.setAttribute("login_error", "Please Login..");
	//}
	%>
		
	<%
		String updateMsg = (String)session.getAttribute("UpdateMsg");
	
	   if(updateMsg !=null)
	   {%>
		   <div class="alert alert-success" role="alert"><%= updateMsg%></div>
	   <%
	   session.removeAttribute("UpdateMsg");
	   }
	
	
	
	%>
	
	<%
		String delMsg = (String)session.getAttribute("DeleteMsg");
	
	   if(delMsg !=null)
	   {%>
		   <div class="alert alert-success" role="alert"><%= delMsg%></div>
	   <%
	   session.removeAttribute("DeleteMsg");
	   }
	
	
	
	%>
	
	

	<div class="container mt-5">
		
		         <%
		         String pcat = request.getParameter("category");
		         
                   if((user1 == null || user1 != null))
                   {
                	   java.util.List<Post> post = com.DAO.PostDAO.getBlogByCategory(pcat);
                 
                        for(Post po : post)
                  {%>
                 <a href="indivisual.jsp?id=<%= po.getId() %>" class="row text-decoration-none">
		          <div class="card-body px-4 col-5 ">
                     <p class="my-4 text-light" />	
                        <i class="fa fa-user-circle" aria-hidden="true"></i> <%=po.getAuthor() %>
                     </p>
                     <h3 class="card-title text-light"><%=po.getTitle() %></h3>
                     <p class="text-light overflow-hidden my-2" style="height:2.8rem; font-family: serif;"> <%= po.getContent() %> </p>
                   
                   		<div class="row">
                  		 <p  class="text-light col-2">
                   		<i class="fa fa-thumbs-up" aria-hidden="true"></i><span> 550</span>
                   		</p>
                    	<p class="text-light col-3 "> <%= po.getCategory() %> </p>
                   		<p class="col-2">
                  		 <b class="fw-light text-light  " > <%=po.getPdate().toString().substring(0, 10)%></b>
                  		 </p>
                   		</div>
                   
                      </div>
                     <div class="col-lg-3 d-flex align-items-center"><img src="<%=po.getImgUrl() %>" class="card-img-top h-75" alt="..."></div>
                  </a>
                  </div	>
                  <hr class="text-light">
                        	
               <% } } %>
			</div>
			
				
</body>
</html>