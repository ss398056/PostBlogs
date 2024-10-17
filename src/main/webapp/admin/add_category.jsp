<%@ include file="header.jsp" %>
            
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Category</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Add Category</li>
                        </ol>
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Fill the all category fields
                            </div>
                            
                            <div class="card-body">
								<form method="post" action="CategoryAddServlet">
								  <!-- 2 column grid layout with text inputs for the first and last names -->
								  <div class="row mb-4">
								    <div class="col">
								      <div class="form-outline">
								        <input type="text" id="categoryName" name="categoryName" class="form-control categoryName" required/>
								        <label class="form-label" for="form6Example1">Category name</label>
								      </div>
								    </div>
								    <div class="col">
								      <div class="form-outline">
								        <select class="form-select" name="isactive" required>
										  <option value="1">Yes</option>
										  <option value="0">No</option>
										</select>
								        <label class="form-label" for="form6Example2">Is active</label>
								      </div>
								    </div>
								  </div>
								
								    <!-- Submit button -->
								  <button type="submit" class="btn btn-primary btn-block mb-4">Add Category</button>
								</form>
                            </div>
                        </div>
                    </div>
                </main>
                
<%@ include file="footer.jsp" %>