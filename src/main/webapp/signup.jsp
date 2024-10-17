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
                           <h3 class="text-primary">Sign Up</h3>
                       </div>
                       <form action="UserRegisterServlet" method="post" id="UserRegForm">
                           <div class="p-4">
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i
                                           class="fas fa-lock text-white"></i></span>
                                   <input type="text" class="form-control" name="name" placeholder="Name" required>
                               </div>
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i
                                           class="fas fa-user text-white"></i></span>
                                           <select class="form-control" name="gender"  placeholder="Gender" required>
                                           	<option>Select Gender</option>
                                           	<option value="Male">Male</option>
                                           	<option value="Female">Female</option>
                                           </select >
                               </div>
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i
                                           class="fas fa-user text-white"></i></span>
                                   <input type="email" class="form-control" name="email" placeholder="Email" required>
                               </div>
                               
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i
                                           class="fas fa-lock text-white"></i></span>
                                   <input type="password" class="form-control" name="password" placeholder="Create Password" required>
                               </div>
                               <div class="form-check">
                                   <input class="form-check-input" type="checkbox" name="check" id="flexCheckDefault" required>
                                   <label class="form-check-label" for="flexCheckDefault">
                                       I agree terms and conditions
                                   </label>
                               </div>
                               <i class="fas fa-sync-alt fa-spin" Style="font-size:30px;" id="Process"></i>
                               <button class="btn btn-primary text-center mt-2" type="submit" id="Signup">
                                   SignUp
                               </button>
                               <div id="message" class="text-center"></div>
                               <p class="text-center mt-5">Already have an account?
                                   <span class="text-primary"><a href="login.jsp">Log In</a></span>
                               </p>
                           </div>
                       </form>
                   </div>
               </div>
        </div>
</main>

<%@ include file="footer.jsp" %>
