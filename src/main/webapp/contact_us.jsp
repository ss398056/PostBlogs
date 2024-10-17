<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>

<main>
	<div class="p-4 p-md-5 mb-5 text-white" style="background : url('assets/img/contact_us.jpg')">
    	<div class="col-md-4 px-0">
      		<h1 class="display-4 fst-italic">Contact Us</h1>
      		<p class="lead my-3">Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within
	        a matter of hours to help you.</p>
    	</div>
  	</div>
	<div class="container-fluid">
			<!--Section: Contact v.2-->
		<section class="mb-4">

    <!--Section heading-->
	        <div class="row">
	        <!--Grid column-->
	        <div class="col-md-9 mb-md-0 mb-5">
	            <form id="contact-form" action="ContactUsSubmitServlet" method="POST">
	
	                <!--Grid row-->
	                <div class="row">
	
	                    <!--Grid column-->
	                    <div class="col-md-6">
	                        <div class="md-form mb-0">
	                        	<% if(session_User != null){ %>
	                            <input type="text" id="name" name="name" class="form-control" value="<%= session_User.getName() %>" readonly>
	                            <% }else{ %>
	                            <input type="text" id="name" name="name" class="form-control" required>
	                            <% } %>
	                            <label for="name" class="">Your name</label>
	                        </div>
	                    </div>
	                    <!--Grid column-->
	
	                    <!--Grid column-->
	                    <div class="col-md-6">
	                        <div class="md-form mb-0">
	                        	<% if(session_User != null){ %>
	                            <input type="text" id="email" name="email" class="form-control" value="<%= session_User.getEmail() %>" readonly>
	                            <% }else{ %>
	                            <input type="text" id="email" name="email" class="form-control" required>
	                            <% } %>
	                            <label for="email" class="">Your email</label>
	                        </div>
	                    </div>
	                    <!--Grid column-->
	
	                </div>
	                <!--Grid row-->
	
	                <!--Grid row-->
	                <div class="row mt-2">
	                    <div class="col-md-12">
	                        <div class="md-form mb-0">
	                            <input type="text" id="subject" name="subject" class="form-control" required>
	                            <label for="subject" class="">Subject</label>
	                        </div>
	                    </div>
	                </div>
	                <!--Grid row-->
	
	                <!--Grid row-->
	                <div class="row mt-2">
	
	                    <!--Grid column-->
	                    <div class="col-md-12">
	
	                        <div class="md-form">
	                            <textarea type="text" id="message" name="message" rows="5" class="form-control md-textarea" required></textarea>
	                            <label for="message">Your message</label>
	                        </div>
	
	                    </div>
	                </div>
	                <!--Grid row-->
	            
	            <div class="text-md-left mt-2">
	                <input type="submit" class="btn btn-primary" name="submit" value="Send">
	            </div>
	            </form>
	              <% if(session.getAttribute("Contact_Success_Msg") != null){ %>
	              <div class="text-center success-msg"><%= session.getAttribute("Contact_Success_Msg") %></div>
	              <% } %>
	              <% if(session.getAttribute("Contact_Error_Msg") != null){ %>
	              <div class="text-center error-msg"><%= session.getAttribute("Contact_Error_Msg") %></div>
	              <% } %>
	            <div class="status"></div>
	        </div>
	        <!--Grid column-->
	
	        <!--Grid column-->
	        <div class="col-md-3 text-center">
	            <ul class="list-unstyled mb-0">
	                <li><i class="fas fa-map-marker-alt fa-2x"></i>
	                    <p>Noida Sectoe-63,</P> <p>Uttar Pradesh 201009, India</p>
	                </li>
	
	                <li><i class="fas fa-phone mt-4 fa-2x"></i>
	                    <p>+91 9718984355</p>
	                </li>
	
	                <li><i class="fas fa-envelope mt-4 fa-2x"></i>
	                    <p>postblogs01@gmail.com</p>
	                </li>
	            </ul>
	        </div>
	        <!--Grid column-->
	    </div>
	</section>
<!--Section: Contact v.2-->
	</div>
</main>
	<br>
<%@ include file="footer.jsp" %>	
<% 
session.removeAttribute("Contact_Success_Msg");
session.removeAttribute("Contact_Error_Msg");
%>