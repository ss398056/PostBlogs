<%@page import="java.util.*" %>
<%@page import="com.postblogs.dao.*" %>
<%@page import="com.postblogs.entities.*" %>
<%@page import="com.postblogs.helper.*" %>

<% CategoryDao dao = new CategoryDao(ConnectionProvider.getConnection()); 
	ArrayList<Category> catlist = dao.getAllCategory();
%>


<%@ include file="header.jsp" %>
            
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Category</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">View</li>
                        </ol>
                        <% if(session.getAttribute("CATEGORY_SUCCESS_MSG")!=null){ %>
                        <div class="text-center h4" style="color:green"><%= session.getAttribute("CATEGORY_SUCCESS_MSG") %></div>
                        <% } %>
                        <% if(session.getAttribute("CATEGORY_ERROR_MSG")!=null){ %>
                        <div class="text-center h4" style="color:red"><%= session.getAttribute("CATEGORY_ERROR_MSG") %></div>
                        <% } %>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                All added categories
                            	<div><a href="add_category.jsp" class="addlink">Add New Category</a></div>
                            </div>
                            
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                        	<th>S.NO</th>
                                            <th>Category Name</th>
                                            <th>Created On</th>
                                            <th>Is Active</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>S.NO</th>
                                            <th>Category Name</th>
                                            <th>Created On</th>
                                            <th>Is Active</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <% int sno = 1;
                                    	if(catlist != null){ 
                                    		for(Category cat : catlist){
                                    %>
                                        <tr>
                                            <td><%= sno %></td>
                                            <td><%= cat.getCategoryName() %></td>
                                            <td><%= cat.getCreated_on() %></td>
                                            <td><% if(cat.getIsActive()==1){ %>
                                            	<a href="<%= RequiredPaths.getLocalPath() %>admin/CategoryStatusServlet?id=<%= cat.getId() %>status=<%= cat.getIsActive() %>" class="btn btn-primary" alt="click button for deactive">Yes</a>
                                            	<% }else{ %>
                                            	<a href="<%= RequiredPaths.getLocalPath() %>admin/CategoryStatusServlet?id=<%= cat.getId() %>status=<%= cat.getIsActive() %>" class="btn btn-primary" alt="click button for active" class="btn btn-danger">No</a>
                                            	<% } %>
                                            </td>
                                            <td><a href="<%= RequiredPaths.getLocalPath() %>admin/CategoryDeleteServlet?id=<%= cat.getId() %>" class="btn btn-danger">Delete</a></td>
                                        </tr>
                                     <% sno++;	}
                                    	}else{ %>
                                     	<tr> There is no category found.</tr>
                                     <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                
<%@ include file="footer.jsp" %>
<% session.removeAttribute("CATEGORY_SUCCESS_MSG");
session.removeAttribute("CATEGORY_ERROR_MSG");
%>