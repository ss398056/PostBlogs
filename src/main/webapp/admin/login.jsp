<%@page import="com.postblogs.helper.*" %>
<% 
	if(session.getAttribute("LOGIN_ADMIN")!=null){
		response.sendRedirect(RequiredPaths.getLocalPath()+"admin/index.jsp");
	}
	String uri = request.getRequestURI();
	String pageName = uri.substring(uri.lastIndexOf("/")+1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | <%= pageName %></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>

</head>

<body>
	<main>
		<div class="container-fluid mb-5 mt-5">
               <div class="rounded d-flex justify-content-center">
                   <div class="col-md-4 col-sm-12 shadow-lg p-5 bg-light">
                       <div class="text-center">
                           <h3 class="text-primary">Admin LogIn</h3>
                       </div>
                       <form action="AdminLoginServlet" method="post">
                           <div class="p-4">
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i
                                           class="fas fa-user text-white"></i></span>
                                   <input type="text" class="form-control" name="username" placeholder="Username" required>
                               </div>
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i
                                           class="fas fa-lock text-white"></i></span>
                                   <input type="password" class="form-control" name="password" placeholder="Password" required>
                               </div>
                               <div class="input-group mb-3">
                                   <span class="input-group-text bg-primary"><i
                                           class="fas fa-user-tag text-white"></i></span>
                                   <select class="form-control" name="role" required>
                                   		<option value="">Select Role</option>
                                   		<option value="Super Admin">Super Admin</option>
                                   		<option value="Admin">Admin</option>
                                   </select>
                               </div>
                               <button class="btn btn-primary text-center mt-2" type="submit">
                                   Login
                               </button>
                           </div>
                       </form>
                       <% if(session.getAttribute("LOGIN_ERROR_MSG")!=null){ %>
                       <div class="text-center" style="color:red"><%= session.getAttribute("LOGIN_ERROR_MSG") %></div>
                       <% } %>
                   </div>
               </div>
        </div>
</main>
</body>
</html>
<% session.removeAttribute("LOGIN_ERROR_MSG"); %>