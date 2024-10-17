<%@page import="com.postblogs.entities.*" %>
<%@page import="com.postblogs.dao.*" %>
<%@page import="com.postblogs.helper.*" %>
<%@page import="java.util.*" %>

<% 
	String uri = request.getRequestURI();
	String pageName = uri.substring(uri.lastIndexOf("/")+1);
	
	if(pageName.equals("header.jsp")){
		response.sendRedirect("error.jsp");
	}
	
	User session_User = (User) session.getAttribute("LOGIN_USER");
	CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
	ArrayList<Category> catlist = catDao.getAllCategory();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= pageName %></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
<link href="assets/css/style.css" rel="stylesheet" >
<style>
	.setSliderimg{
		height : 400px;
	}
	.success-msg{
		color : green;
	}
	.error-msg{
		color : red;
	}
	
</style>
<body>
	<!-- Header starts -->
	<header>
		<nav class="navbar navbar-expand-sm bg-light">
			<div class="container-fluid">
				<span class="navbar-brand demo">PostBlogs</span>
				<ul class="navbar-nav">
					<li class="nav-item me-5 "><a href="index.jsp" class="nav-el">Home</a></li>
					<li class="nav-item me-5 dropdown">
					  <a href="#" class="nav-el dropdown-toggle" id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Category</a>
					  <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
			            <% for(Category cat : catlist){ %>
			            <li><a class="dropdown-item" href="<%= RequiredPaths.getLocalPath() %>view_posts.jsp?catId=<%= cat.getId() %>"><%= cat.getCategoryName() %></a></li>
			            <% } %>
			            
			          </ul>
					</li>
					<li class="nav-item me-5"><a href="tranding.jsp" class="nav-el"> Tranding</a></li>
					<li class="nav-item me-5"><a href="contact_us.jsp" class="nav-el">Contact Us</a></li>
					<li class="nav-item me-5"><a href="about_us.jsp" class="nav-el">About Us</a></li>
					<input type="text" name="search" id="search" class="searchBar "><button class="nav-item search-btn btn btn-primary text-center">Search</button>
				<% if(session_User == null){ %>
					<li class="nav-item me-5 mx-5"><a href="login.jsp" class="nav-el">Login</a> | <a href="signup.jsp" class="nav-el">SignUp</a></li>
				<% }else{ %>
					<li class="nav-item me-5 dropdown ms-5">
					  <a href="#" class="nav-el dropdown-toggle" id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-lg"> </i><%= session_User.getEmail() %></a>
					  <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
			            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
			            <li><a class="dropdown-item" href="#">Add Post</a></li>
			            <li><a class="dropdown-item" href="#">View Your Post</a></li>
			            <li><a class="dropdown-item" href="UserLogoutServlet">Logout</a></li>
			          </ul>
					</li>
				<% } %>
				</ul>
			</div>
		</nav>
	</header>
	<!-- Header ends -->