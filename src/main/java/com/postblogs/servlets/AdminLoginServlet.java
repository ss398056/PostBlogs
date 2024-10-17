package com.postblogs.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.postblogs.dao.AdminDao;
import com.postblogs.entities.Admin;
import com.postblogs.helper.ConnectionProvider;
import com.postblogs.helper.RequiredPaths;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/admin/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession s = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		//out.println(username+" "+password+" "+role);
		
		AdminDao dao = new AdminDao(ConnectionProvider.getConnection());
		Admin admin = dao.getadminLogin(username, password, role);
		
		if(admin!=null) {
			out.print("Admin login successfully.");
			
			s.setAttribute("LOGIN_ADMIN", admin);
			response.sendRedirect(RequiredPaths.getLocalPath()+"admin/index.jsp");
		}else {
			s.setAttribute("LOGIN_ERROR_MSG", "Enter valid admin details");
			response.sendRedirect(RequiredPaths.getLocalPath()+"admin/login.jsp");
		}
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

}
