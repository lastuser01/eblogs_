<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs</title>
<%@include file="all_component/allcss.jsp" %>
<style>
body{
font-family: Georgia, "Times New Roman", Times, serif;
}
</style>
</head>
<body class="back-img">  
    <div class="px-4">
	   <%@include file="all_component/navbar.jsp"%>
	</div>
<div  class="container ">
       <%
		com.user.UserDetails user1 = (com.user.UserDetails) session.getAttribute("userD");

		if(user1 != null) {	
		%>

	<div>
		<% 
					String postMsg=(String)session.getAttribute("post_msg");
					 if(postMsg != null)
					 {%>
						 <div class="alert alert-success" role="alert"><%=postMsg%></div> 
					 <% 
					 session.removeAttribute("post_msg");
					 }
					
					%>	
						
				<% 
					String FailedMsg=(String)session.getAttribute("post_msg");
					 if(FailedMsg != null)
					 { %>
						 <div class="alert alert-danger" role="alert"><%=FailedMsg %></div>
					 <%
					 session.removeAttribute("post_msg");
					 }%>
					 
					 </div>
  <div class="container p-5">
<form action="PostServlet" method="post" >
	
  <div class="form-group">
	<input type="hidden" value="<%=user1.getId()%>" name="uid">
  </div>
  
  <div class="form-group">
    <textarea class="form-control text-light"  style=" background-color: transparent;" id="exampleFormControlTextarea1" rows="2" name="title" placeholder="Enter title" required></textarea>
  </div>
 <br>
  
  <div class="form-group">
    <textarea class="form-control text-light" style=" background-color: transparent;" id="exampleFormControlTextarea1" rows="10" name="content" placeholder="Tell your story ....." required></textarea>
  </div>
  <br>
  <div class="mb-3">
  		<input type="text" name="imgUrl" class="form-control text-light" placeholder="Image Url">
  </div>
  <div class="mb-3 row">
  	<div class="col-12">
  		<select class="form-select bg-transparent text-light" aria-label="Default select example" name="category" required>
  			<option value="Self Improvement" class="text-dark">Self Improvement</option>
  			<option value="Technology" class="text-dark">Technology</option>
  			<option value="Programming" class="text-dark">Programming</option>
  			<option value="Health and Wellness" class="text-dark">Health and Wellness</option>
  			<option value="Finance" class="text-dark">Finance</option>
  			<option value="Entertainment" class="text-dark">Entertainment</option>
  			<option value="Lifestyle" class="text-dark">Lifestyle</option>
  			<option value="Business" class="text-dark">Business</option>
  			
		</select>
  	</div>
  </div>
  
  <button type="submit" class="btn text-light col-4 offset-4 mt-4" >Add Blog</button><br>


   </form>
   </div>	

			   <% } else { %>
			<%response.sendRedirect("login.jsp"); %>
		<% } %>
</div>

</body>
</html>