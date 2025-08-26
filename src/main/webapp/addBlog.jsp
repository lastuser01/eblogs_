<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <link
      rel="icon"
      type="image/x-icon"
      href="https://img.icons8.com/doodle/48/blogger--v1.png"
    />
    <title>Eblogs - Add Blog</title>
    <%@include file="all_component/allcss.jsp" %>
  </head>
  <body class="back-img">
    <div class="container-fluid">
      <%@include file="all_component/navbar.jsp"%> <% com.user.UserDetails user1
      = (com.user.UserDetails) session.getAttribute("userD"); if (user1 == null)
      { response.sendRedirect("login.jsp"); session.setAttribute("login_error",
      "Please Login to add a blog"); } %>

      <div class="container mt-5">
        <div class="row justify-content-center">
          <div class="col-md-8">
            <div class="card bg-transparent">
              <div class="card-body">
                <h2 class="text-center text-light mb-4">Add Your Blog</h2>

                <% String successMsg =
                (String)session.getAttribute("blog_success"); if(successMsg !=
                null) { %>
                <div class="alert alert-success" role="alert">
                  <%= successMsg %>
                </div>
                <% session.removeAttribute("blog_success"); } String errorMsg =
                (String)session.getAttribute("blog_error"); if(errorMsg != null)
                { %>
                <div class="alert alert-danger" role="alert">
                  <%= errorMsg %>
                </div>
                <% session.removeAttribute("blog_error"); } %>

                <form action="AddBlogServlet" method="post">
                  <div class="mb-3">
                    <label for="title" class="form-label text-light"
                      >Blog Title</label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="title"
                      name="title"
                      required
                    />
                  </div>

                  <div class="mb-3">
                    <label for="category" class="form-label text-light"
                      >Category</label
                    >
                    <select
                      class="form-control"
                      id="category"
                      name="category"
                      required
                    >
                      <option value="">Select Category</option>
                      <option value="Self Improvement">Self Improvement</option>
                      <option value="Technology">Technology</option>
                      <option value="Programming">Programming</option>
                      <option value="Health and Wellness">
                        Health and Wellness
                      </option>
                      <option value="Finance">Finance</option>
                      <option value="Entertainment">Entertainment</option>
                      <option value="Lifestyle">Lifestyle</option>
                      <option value="Business">Business</option>
                    </select>
                  </div>

                  <div class="mb-3">
                    <label for="content" class="form-label text-light"
                      >Content</label
                    >
                    <textarea
                      class="form-control"
                      id="content"
                      name="content"
                      rows="10"
                      required
                    ></textarea>
                  </div>

                  <div class="mb-3">
                    <label for="imgUrl" class="form-label text-light"
                      >Image URL</label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="imgUrl"
                      name="imgUrl"
                      placeholder="https://example.com/image.jpg"
                      required
                    />
                    <small class="text-light"
                      >Enter a URL for your blog image</small
                    >
                  </div>

                  <div class="text-center">
                    <button type="submit" class="btn btn-lg text-light">
                      Publish Blog
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
