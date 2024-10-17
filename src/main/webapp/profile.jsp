<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.postblogs.helper.*" %>
<%@page import="com.postblogs.entities.*" %>
<%@page import="com.postblogs.dao.*" %>
<%@page errorPage="error.jsp" %>
<%@ include file="header.jsp" %>

<% if(session.getAttribute("LOGIN_USER") == null){
		response.sendRedirect("index.jsp");
	}
	UserDao userdao = new UserDao(ConnectionProvider.getConnection());
	User user = userdao.getUserByUserId(session_User.getId());

%>


<main>
<section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
          	<% if(user.getProfile() != null){ %>
            <img src="assets/img/users/<%= user.getProfile() %>" alt="<%= user.getProfile() %>"
              class="rounded-circle img-fluid" style="width: 150px;">
            <% }else{ %>
            	<% if(user.getGender().equals("Male")){ %>
            		<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
              	<% }else{ %>
              		<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
              	<% } %>
            <% } %>
            <h5 class="my-3"><%= user.getName() %></h5>
            <p class="text-muted mb-1"><%= user.getAbout() %></p>
            <p class="text-muted mb-1"><%= user.getGender() %></p>
            <p class="text-muted mb-4"><%= user.getCreated_on() %></p>
            <p class="text-muted mb-4 h5">Total posts : 10</p>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
          	<form method="post" action="UserProfileUpdateServlet" enctype="multipart/form-data">
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Full Name</p>
	              </div>
	              <div class="col-sm-9">
	                <input type="text" class="text-muted mb-0 form-control" name="name" value="<%= user.getName() %>" required>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">About Me</p>
	              </div>
	              <div class="col-sm-9">
	                <textarea type="text" class="text-muted mb-0 form-control" name="about" required><%= user.getAbout() %></textarea>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Email</p>
	              </div>
	              <div class="col-sm-9">
	                <input type="email" class="text-muted mb-0 form-control" name="email" value="<%= user.getEmail() %>" readonly>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Gender</p>
	              </div>
	              <div class="col-sm-9">
	                <select class="text-muted mb-0 form-control" required name="gender">
	                	<option value="Male" <% if(user.getGender()=="Male"){out.print("selected");} %>>Male</option>
	                	<option value="Female" <% if(user.getGender()=="Female"){out.print("selected");} %>>Female</option>
	                </select> 
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Profile Photo</p>
	              </div>
	              <div class="col-sm-9">
	                <input type="file" class="text-muted mb-0 form-control" name="profile_photo" value="<%= user.getProfile() %>">
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Password</p>
	              </div>
	              <div class="col-sm-9">
	                <input type="password" class="text-muted mb-0 form-control" name="password" value="<%= user.getPassword() %>" required>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-9">
	                <input type="submit" class="btn btn-primary" name="submit" value="Submit">
	              </div>
	              <% if(session.getAttribute("Profile_Success_Msg") != null){ %>
	              <div class="text-center success-msg"><%= session.getAttribute("Profile_Success_Msg") %></div>
	              <% } %>
	              <% if(session.getAttribute("Profile_Error_Msg") != null){ %>
	              <div class="text-center error-msg"><%= session.getAttribute("Profile_Error_Msg") %></div>
	              <% } %>
	            </div>
            </form>
          </div>
        </div>
  </div>
</section>
</main>

<%@ include file="footer.jsp" %>	
<% session.removeAttribute("Profile_Success_Msg");
session.removeAttribute("Profile_Error_Msg");
%>	