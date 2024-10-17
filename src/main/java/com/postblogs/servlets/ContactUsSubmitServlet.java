package com.postblogs.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.postblogs.dao.ContactDao;
import com.postblogs.entities.Contact;
import com.postblogs.helper.ConnectionProvider;

/**
 * Servlet implementation class ContactUsSubmitServlet
 */
@WebServlet("/ContactUsSubmitServlet")
public class ContactUsSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUsSubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
    	String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		ContactDao dao = new ContactDao(ConnectionProvider.getConnection());
		Contact contact = new Contact(name,email,subject,message);
		
		if(dao.saveContactUsDetails(contact)) {
			s.setAttribute("Contact_Success_Msg", "Your query sended successfully to the PostBlogs.");
			response.sendRedirect("contact_us.jsp");
		}else {
			s.setAttribute("Contact_Error_Msg", "Somethiing went wrong! please try again.");
			response.sendRedirect("contact_us.jsp");
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
