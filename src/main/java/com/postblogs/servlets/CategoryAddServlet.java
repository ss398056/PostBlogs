package com.postblogs.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.postblogs.dao.CategoryDao;
import com.postblogs.entities.Category;
import com.postblogs.helper.ConnectionProvider;
import com.postblogs.helper.RequiredPaths;

/**
 * Servlet implementation class CategoryAddServlet
 */
@WebServlet("/admin/CategoryAddServlet")
public class CategoryAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession s = request.getSession();
		String categoryName = request.getParameter("categoryName");
		int isactive = Integer.parseInt(request.getParameter("isactive"));
		Category category = new Category(categoryName,isactive);
		CategoryDao dao = new CategoryDao(ConnectionProvider.getConnection());
		
		if(dao.addCategory(category)) {
			s.setAttribute("CATEGORY_SUCCESS_MSG", "'"+categoryName+"' category added successfully.");
			response.sendRedirect(RequiredPaths.getLocalPath()+"admin/category.jsp");
		}else {
			s.setAttribute("CATEGORY_ERROR_MSG", "Something went wrong! try again.");
			response.sendRedirect(RequiredPaths.getLocalPath()+"admin/category.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
