<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<% 
	if(session.getAttribute("LOGIN_USER")!=null){
		response.sendRedirect("index.jsp");
	}
%>
<main>
		<div class="container-fluid mb-5 mt-5">
               <div class="rounded d-flex justify-content-center">
                   <div class="col-md-4 col-sm-12 shadow-lg p-5 bg-light">
                       <div class="text-center">
                           <h3 class="text-primary">Log In</h3>
                       </div>
                       <form action="UserLoginServlet" method="post" id="UserLoginForm">
                           <div class="p-4">
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i
                                           class="fas fa-user text-white"></i></span>
                                   <input type="text" class="form-control" name="email" placeholder="Email" required>
                               </div>
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i
                                           class="fas fa-lock text-white"></i></span>
                                   <input type="password" class="form-control" name="password" placeholder="Password" required>
                               </div>
                               
                               <button class="btn btn-primary text-center mt-2" type="submit" id="Loginbtn">
                                   Login
                               </button>
                               <div id="message" class="text-center"></div>
                               <p class="text-center mt-5">Don't have an account?
                                   <span class="text-primary">Sign Up</span>
                               </p>
                               <p class="text-center text-primary">Forgot your password?</p>
                           </div>
                       </form>
                   </div>
               </div>
        </div>
</main>

<%@ include file="footer.jsp" %>
