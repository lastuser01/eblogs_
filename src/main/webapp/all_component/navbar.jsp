<nav class="navbar navbar-expand-lg navbar-light ">
	 <b>
	 	<a class="navbar-brand" href="showblogs.jsp" style="font-size: 22px; color: white ">
	 		<img width="48" height="48" src="https://img.icons8.com/doodle/48/blogger--v1.png" alt="blogger--v1"/> E-Blogs
	 	</a>
	 </b>
	 <form class="d-flex" role="search">
	 	<i class="fa fa-search text-gray fw-lighter position-absolute ms-5 ps-3 mt-2 pt-1" aria-hidden="true"></i>
        <input class="form-control me-2 ms-lg-5 rounded-pill" id="search" type="search" placeholder="Search" aria-label="Search">
      </form>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse justify-content-lg-end" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item "><a class="nav-link text-light" href="addblogs.jsp">
			<i class="fa fa-pencil-square-o fs-4" aria-hidden="true"></i> Write</a></li>
			
			<%
		com.user.UserDetails user = (com.user.UserDetails) session.getAttribute("userD");

		if(user != null) {	
		%>
		
			
		</ul>

		<div class="">
		<a href="" class="btn  my-sm-0  ms-lg-3 " data-toggle="modal" data-target="#exampleModal" type="submit">
			<i class="fa fa-user-circle" aria-hidden="true"></i> <span class="navbar-toggler-icon"></span>
		</a>
		
		</div>
			
			<!-- Button trigger modal -->
			<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true" style="color: black"> 
		<div class="modal-dialog" role="document">
			<div class="modal-content ">
				<div class="modal-header ">
					
					<button type="button" class="btn-close" aria-label="Close" data-dismiss="modal"></button>
				</div>
				<div class="modal-body d-flex flex-column ">
						
							<a href="profile.jsp" class="  my-2 my-sm-0 " type="submit">
							<i class="bi bi-person"></i>Profile
							</a>
							<a href="#" class="  my-2 my-sm-0 " type="submit">
						    <i class="bi bi-bookmarks"></i>library
							</a>
							<a href="#" class="  my-2 my-sm-0 " type="submit">
						    <i class="bi bi-gear"></i>Settings
							</a>
							<a href="#" class="  my-2 my-sm-0 " type="submit">
								about us
							</a>
							<a href="LogoutServlet" class="  my-2 my-sm-0 " type="submit">
								Logout
							</a>
						
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">
      <img src="https://img.icons8.com/doodle/48/blogger--v1.png" alt="Eblogs Logo" height="30">
      Eblogs
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="showblogs.jsp">Blogs</a>
        </li>
      </ul>

      <% 
      com.user.UserDetails user = (com.user.UserDetails) session.getAttribute("userD");
      if (user == null) { 
      %>
        <a href="login.jsp" class="btn me-2 text-light">Login</a>
        <a href="register.jsp" class="btn text-light">Register</a>
      <% } else { %>
        <div class="dropdown">
          <button class="btn dropdown-toggle text-light" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa fa-user-circle"></i> <%= user.getUsername() %>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
            <li><a class="dropdown-item" href="addBlog.jsp">Add Blog</a></li>
            <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
          </ul>
        </div>
      <% } %>
    </div>
  </div>
</nav>
					</div>
					
				</div>
			</div>
			</div>
			<%
			} else {
			%>
			<a href="login.jsp" class="btn  my-2 my-sm-2 mx-sm-auto mr-2 ms-sm-0 ms-lg-3" type="submit">
				<i class="fa fa-user-circle" aria-hidden="true"></i>
				Login
			</a>
		    <a href="register.jsp" class="btn  my-2 my-sm-2 mx-sm-auto ms-sm-0 ms-lg-3" type="submit">
		        <i class="fa fa-user-plus" aria-hidden="true"></i>
				Register
			</a>
			<%
		}
		%>
	</div>	
	
</nav>

