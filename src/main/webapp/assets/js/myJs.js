$(document).ready(function(){
	
	//User registration module
	$('#Process').hide();
	$('#UserRegForm').on('submit',function(e){
		e.preventDefault();
		$("#Signup").hide();
		$('#Process').show();
		let form = new FormData(this);
		$.ajax({
			url : "UserRegisterServlet",
			type : "POST",
			data : form,
			success : function(data){
				if(data.trim()==="Registration successfully completed"){
					$('#Process').hide();
					$("#Signup").show();
					$('#message').text(data).css("color","green");
					setTimeout(function(){
					window.location.href = "login.jsp";	
					},3000);	
				}
				if(data.trim()=="Email id already registerd"){
					$('#Process').hide();
					$("#Signup").show();
					$('#message').text(data).css("color","red");
				}
			},
			error : function(data){
				$('#Process').hide();
				$("#Signup").show();
				$('#message').text(data).css("color","red");
			},
			processData : false,
			contentType : false
		});	
	});
	
	
	//User login module 
	$('#UserLoginForm').on('submit',function(e){
		e.preventDefault();
		let form = new FormData(this);
		$.ajax({
			url : "UserLoginServlet",
			type : "POST",
			data : form,
			success : function(data){
				if(data.trim()==="Login successfully"){
					let counter = 3;
					setInterval(function () {
					  counter--;
						$('#message').text(data+" rediredted in just "+counter+" seconds").css("color","green");
					}, 1000);
					
					clearInterval();
					setTimeout(function(){
						window.location.href = "index.jsp";	
					},3000);	
				}
				if(data.trim()==="Entered email is invalid!"){
					$('#message').text(data).css("color","red");
				}
				if(data.trim()==="Entered password is invalid!"){
					$('#message').text(data).css("color","red");	
				}
				
			},
			error : function(data){
				$('#message').text(data).css("color","red");
			},
			processData : false,
			contentType : false
		});	
	});
	
	
	
});