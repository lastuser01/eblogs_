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
<body  class="back-img "  style="backdrop-filter:blur(30px);">
	
	<div  class="container ">
	<%@include file="all_component/navbar.jsp"%>	
					<% 
					String invalidMsg=(String)session.getAttribute("login_failed");
					 if(invalidMsg != null)
					 {%>
						 <div class="alert alert-danger" role="alert"><%=invalidMsg%></div> 
					 <% 
					 session.removeAttribute("login_failed");
					 }
					%>	
					
	  <div class=" w-100 shadow-lgmx-auto d-flex justify-content-center align-items-center  mt-5">
            <div class="col-md-6 p-5 card ">
              <h3 class="mb-3 text-center text-light ">Login</h3>
              <form action="LoginServlet" method="post">
                <div class="mb-3">
                  <input
                    type="text"
                    class="form-control input"
                    placeholder="email"
                    name="uemail"
                    required
                  />
                </div>
                <div class="mb-3">
                  <input
                    type="password"
                    class="form-control input"
                    placeholder="password"
                    name="upassword"
                    required
                  />
                </div>
                <div class="form-check mb-4">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    id="terms"
                    checked
                    required
                  />
                  <label class="form-check-label text-light " for="terms">
                    I agree to the
                    <a href="#" class="text-light" >Terms & Conditions</a>
                  </label>
                </div>
                <button
                  type="submit"
                  class="btn  w-100 mb-3"
                >
                  Login
                </button>
                <p class="mb-4 text-light ">
                  Don't have an account?
                  <a
                    href="register.jsp"
                    class="text-decoration-underline text-light"
                    >Register</a
                  >
                </p>
                <hr class="my-4 text-light" />
                <p class="text-center mb-3 text-light  ">Or register with</p>
                <div class="d-flex flex-column flex-sm-row gap-2">
                  <button type="button" class="btn social-btn w-100" 
                  style="background-color:#3333333d">
                    <img
                      src="https://img.icons8.com/color/16/000000/google-logo.png"
                      class="me-2"
                    />
                    Google
                  </button>
                </div>
              </form>
            </div>
          </div>	
	</div>
    
</body>
</html>
