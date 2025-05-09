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
			<li class="nav-item"><a class="nav-link text-light" href="addblogs.jsp">
			<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Write</a></li>
			
			<%
		com.user.UserDetails user = (com.user.UserDetails) session.getAttribute("userD");

		if(user != null) {	
		%>
		
			<li class="nav-item"><a class="nav-link text-light ms-lg-3" href="myblogs.jsp"><i
					class="fa fa-address-book-o" aria-hidden="true"></i> My Blogs</a>
			</li>
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
					<h5 class="modal-title" id="exampleModalLabel">User Details</h5>
					<button type="button" class="btn-close" aria-label="Close" data-dismiss="modal"></button>
				</div>
				<div class="modal-body ">

					<div class="container text-center">

						<i class="fa fa-user fa-3x"></i>
						<h5></h5>
						<table class="table">
							<tbody>
								<tr>
									<th>User Id</th>
										<td><%= user.getId() %></td>
								</tr>

								<tr>
									<th>Full Name</th>
									<td><%= user.getName() %></td>
								</tr>

								<tr>
									<th>Email Id</th>
									<td><%= user.getEmail() %></td>
								</tr>

							</tbody>
						</table>

						<div>
							<a href="LogoutServlet" class="btn  my-2 my-sm-0 " type="submit">
								<i class="fa fa-sign-out" aria-hidden="true"></i>
								Logout
							</a>
						</div>

                     </div>
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

