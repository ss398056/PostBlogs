<%  
	String Uri = request.getRequestURI();
	String PageName = Uri.substring(Uri.lastIndexOf("/")+1);
	
	if(PageName.equals("footer.jsp")){
		response.sendRedirect("error.jsp");
	}
%>
<footer>
	<div class="container-fluid bg-light">
	  <div class="py-3 my-4">
	    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
	    </ul>
	    <p class="text-center text-muted mb-0">PostBlogs � 2023</p>
	  </div>
	</div>
</footer>

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
<script src="assets/js/myJs.js"></script>

</body>
</html>