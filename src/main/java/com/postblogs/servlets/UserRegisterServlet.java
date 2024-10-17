package com.postblogs.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.postblogs.dao.UserDao;
import com.postblogs.entities.User;
import com.postblogs.helper.ConnectionProvider;

import java.io.PrintWriter;
/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")

@MultipartConfig
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	PrintWriter out = response.getWriter();
    	String check = request.getParameter("check");
    	if(check == null) {
    		out.println("Please check terms and condition box");
    	}else {
    		String name = request.getParameter("name");
    		String email = request.getParameter("email");
    		String password = request.getParameter("password");
    		String gender = request.getParameter("gender");
    		String about = "Hey! am user of PostBlogs.";
    		UserDao dao = new UserDao(ConnectionProvider.getConnection());
    		User user = new User(name,email,password,gender,about);
    		
    		
    		if(!dao.checkUserByEmail(email)) {
    			boolean flag = dao.saveUser(user);
    			if(flag) {
    				
        			out.println("Registration successfully completed");
        			
        		}else {
        			out.println("Something went wrong...");
        		}
    		}else {
    			out.println("Email id already registerd");
    		}
    		
    	}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

}
