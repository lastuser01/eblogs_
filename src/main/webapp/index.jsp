<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/x-icon" href="https://img.icons8.com/doodle/48/blogger--v1.png">
<title>Eblogs - Home</title>
<%@include file="all_component/allcss.jsp"%>
<style>
    .hero-section {
        height: 80vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        color: white;
    }

    .feature-card {
        background-color: rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 30px;
        transition: transform 0.3s;
    }

    .feature-card:hover {
        transform: translateY(-10px);
        background-color: rgba(255, 255, 255, 0.15);
    }

    .feature-icon {
        font-size: 3rem;
        margin-bottom: 15px;
    }
</style>
</head>
<body class="back-img">
    <div class="container-fluid">
        <%@include file="all_component/navbar.jsp"%>

        <!-- Hero Section -->
        <div class="hero-section">
            <h1 class="display-3 fw-bold">Welcome to Eblogs</h1>
            <p class="lead">Share your thoughts, ideas, and stories with the world</p>
            <div class="mt-4">
                <a href="register.jsp" class="btn btn-lg me-3">Get Started</a>
                <a href="showblogs.jsp" class="btn btn-lg">Explore Blogs</a>
            </div>
        </div>

        <!-- Features Section -->
        <div class="container my-5">
            <h2 class="text-center text-light mb-5">Why Choose Eblogs?</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="text-center">
                            <i class="fa fa-pencil-square-o feature-icon text-light" aria-hidden="true"></i>
                            <h3 class="text-light">Easy to Use</h3>
                            <p class="text-light">Simple and intuitive interface makes blogging effortless. Start writing in minutes!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="text-center">
                            <i class="fa fa-users feature-icon text-light" aria-hidden="true"></i>
                            <h3 class="text-light">Community</h3>
                            <p class="text-light">Join a growing community of writers and readers who share your interests.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="text-center">
                            <i class="fa fa-mobile feature-icon text-light" aria-hidden="true"></i>
                            <h3 class="text-light">Responsive Design</h3>
                            <p class="text-light">Enjoy a seamless experience across all devices - desktop, tablet, or mobile.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
