<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body class="back-img">
<div  class="container-fluid">
<%
    Integer noteid= Integer.parseInt(request.getParameter("note_id"));


    com.user.Post p = PostDAO.getBlogById(noteid);
%>

  <div >
		<%@include file="all_component/navbar.jsp"%>

		<h2 class="text-center">Edit Your Blog Here</h2>

					<form action="BlogEditServlet" method="post">
					
					<input type="hidden" value="<%= noteid %>"  name="note_id">
						<div class="form-group">

						 <label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle()%>"/>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="9" cols="" class="form-control" name="content"
								required="required"><%=p.getContent() %></textarea>

						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">Enter ImgUrl</label>
							<input type="text" class="form-control" name="ImgUrl"
								required="required"  value="<%=p.getImgUrl() %>"/>
						</div><br>
						

						<div class="container text-center">
							<button type="submit" class="btn">Add</button>
						</div>
					</form>

				</div>

	


	
</div>
</body>
</html>