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
	
	CategoryDao catdao = new CategoryDao(ConnectionProvider.getConnection());
	ArrayList<Category> catList = catdao.getAllActiveCategory();

%>


<main>
<section style="background-color: #eee;">
  <div class="container">
    <div class="row">
    	<h2 class="h2 py-3">Add your own blog</h2>
        <div class="card mb-4">
          <div class="card-body py-3">
          	<form method="post" action="AddPostServlet" id="AddPostForm" enctype="multipart/form-data">
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Category*</p>
	              </div>
	              <div class="col-sm-9">
	                <select class="text-muted mb-0 form-control" required name="category">
	                	<option value="">Select Category</option>
	                	<% if(catList != null){ %>
	                	<% for(Category cat : catList){ %>
	                	<option value="<%= cat.getId() %>" ><%= cat.getCategoryName() %></option>
	                	<% } } %>
	                </select> 
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Blog Title*</p>
	              </div>
	              <div class="col-sm-9">
	                <input type="text" class="text-muted mb-0 form-control" name="tile" required>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Sub-Title*</p>
	              </div>
	              <div class="col-sm-9">
	                <textarea type="text" class="text-muted mb-0 form-control" name="sub-title" required></textarea>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Content*</p>
	              </div>
	              <div class="col-sm-9">
	                <textarea type="text" class="text-muted mb-0 form-control" rows="10" name="content" required></textarea>
	              </div>
	            </div>
	            <hr>
	            
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">Blog Image*</p>
	              </div>
	              <div class="col-sm-9">
	                <input type="file" class="text-muted mb-0 form-control" name="blog_image" required>
	              </div>
	            </div>
	            <hr>
	            <div class="row">
	              <div class="col-sm-3">
	                <p class="mb-0">IsTranding*</p>
	              </div>
	              <div class="col-sm-9">
	                <select class="text-muted mb-0 form-control" required name="istranding">
	                	<option value="0" >No</option>
	                	<option value="1" >Yes</option>
	                </select> 
	              </div>
	            </div>
	            <div class="row text-center mt-5">
	              <div class="col-sm-9">
	                <input type="submit" class="btn btn-primary" name="submit" value="Add Post">
	                <a href="index.jsp" class="btn btn-danger mx-3">Cancel</a>
	              </div>              
	            </div> 
            </form>
          </div>
        </div>
</section>
</main>

<%@ include file="footer.jsp" %>	
<% session.removeAttribute("Profile_Success_Msg");
session.removeAttribute("Profile_Error_Msg");
%>	