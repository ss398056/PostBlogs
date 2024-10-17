package com.postblogs.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.postblogs.dao.UserDao;
import com.postblogs.entities.User;
import com.postblogs.helper.ConnectionProvider;

/**
 * Servlet implementation class UserProfileUpdateServlet
 */
@WebServlet("/UserProfileUpdateServlet")
@MultipartConfig
public class UserProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out = response.getWriter();
    	HttpSession s = request.getSession();
    	User session_User = (User) s.getAttribute("LOGIN_USER");
    	String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String about = request.getParameter("about");
		Part file = request.getPart("profile_photo");
		
		String profile_photo = session_User.getId()+"_"+name+".jpg";
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		//User oldUser = dao.getUserByUserId(session_User.getId());
		//File fileObj = new File("assets/img/users/"+oldUser.getProfile());
		
		if(file!=null) {
				file.write("D:\\eclipse-work\\PostBlogs\\src\\main\\webapp\\assets\\img\\users\\"+profile_photo);
		}
		User user = new User(name,email,password,gender,about,profile_photo);
		
		if(dao.updateUser(user, session_User.getId())) {
			s.setAttribute("Profile_Success_Msg", "Profile successfully updated");
			response.sendRedirect("profile.jsp");
		}else {
			s.setAttribute("Profile_Error_Msg", "Something went wrong, profile not updated! try again.");
			response.sendRedirect("profile.jsp");
		}
	}
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

}
