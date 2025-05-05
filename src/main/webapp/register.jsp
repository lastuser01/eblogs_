<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs</title>


<%@include file="all_component/allcss.jsp"%>

</head>
<body class="back-img">
	
	<div  class="container ">
	<%@include file="all_component/navbar.jsp"%>
		<div  class="row d-flex justify-content-center align-items-center mt-5">
			<div id="d1" class="col-6">

				<div class="card mt-2 ">
					<div class="text-center text-light mt-2"  >
						<i class="fa fa-user-plus fa-1x " aria-hidden="true"></i>
						<h5>Registration</h5>
					</div>
					<hr class="my-4 text-light" />
					<% 
					String regMsg=(String)session.getAttribute("reg_success");
					 if(regMsg != null)
					 {%>
						 <div class="alert alert-success" role="alert"><%=regMsg%>Login<a href="login.jsp">Click Here</a></div> 
					 <% 
					 session.removeAttribute("reg_success");
					 }
					
					%>	
						
				<% 
					String FailedMsg=(String)session.getAttribute("reg_success");
					 if(FailedMsg != null)
					 { %>
						 <div class="alert alert-danger" role="alert"><%=FailedMsg %></div>
					 <%
					 session.removeAttribute("reg_success");
					 }%>	

					<form action="UserServlet" method="post">
					<div class="card-body p-5">
						<div class="col">
						      <div class="row mb-3">
                                 <div class="col-12 col-md-6 mb-3 mb-md-0">
                                   <input
                                     type="text"
                                     class="form-control input"
                                     placeholder="First name"
                                     name="fname"
                                     required
                                   />
                                 </div>
                                 <div class="col-12 col-md-6">
                                   <input
                                     type="text"
                                     class="form-control input"
                                     placeholder="Last name"
                                     name="lname"
                                     required
                                   />
                                 </div>
                               </div>
							<div class="mb-3">
								<input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uname"
									placeholder="username" required>

							</div>
							<div class="mb-3">
								 <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail"
									placeholder="Enter email" required> <small id="emailHelp"
									class="form-text text-muted"></small>

							</div>
							<div class="mb-3">
								<input
									type="password" class="form-control" id="exampleInputPassword1"
									name="upassword" placeholder="Password" >
							</div>
							<div class="form-check mb-4 row-10">
                  	            <input
                                class="form-check-input"
                                type="checkbox"
                                id="terms" checked  required
                              />
                              <label class="form-check-label text-light" for="terms">
                                I agree to the <a href="#" class="text-light">Terms & Conditions</a>
                              </label>
                             </div>

							<button type="submit" class="btn mb-3 col-12 text-light" >Register</button><br>
								
							 <div  align="center" class="text-light" style="border: none;">Already have an account? <a href="login.jsp" id="login" class="text-light">Login Now</a></div>
							</div>						
							</div>
						</form>
						

				</div>
			</div>
		</div>
		
	</div>
</body>
</html>
