<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD Web APP</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>

<section class="vh-100 ">
  <div class="container py-5 h-80 w-75">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-10 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-light text-dark" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-3 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase">Update</h2>
              <p class="text-black-50 mb-5"></p>
              
			<form action="${pageContext.request.contextPath}/updateform" method="post">
			
			
			<input type="hidden" id="id" name="id" required placeholder="id" class="form-control form-control-lg" value="${user.id}" />
			
			<div data-mdb-input-init class="form-outline form-white mb-4">
              
              	<div class="form-floating mb-3">
					
                	<input type="text" id="name" name="name" required placeholder="Enter Name" class="form-control form-control-lg" value="${user.name}" />
                	<label for="floatingInput">Name</label>
                </div>
                	
              </div>
			
              <div data-mdb-input-init class="form-outline form-white mb-4">
              
              	<div class="form-floating mb-3">
					
                	<input type="text" id="username" name="username" required placeholder="Enter Username" class="form-control form-control-lg" value="${user.username}" />
                	<label for="floatingInput">Username</label>
                </div>
                	
              </div>

              <div data-mdb-input-init class="form-outline form-white mb-4">
              
              	<div class="form-floating mb-3">
                	<input type="password" id="password" name="password" placeholder="Enter Password" class="form-control form-control-lg"  value="${user.password}"/>
                	<label for="floatingInput">Password</label>
                </div>
                		
              </div>

              <button data-mdb-button-init data-mdb-ripple-init class="btn  btn-success text-white btn-outline-dark btn-lg px-5" type="submit">Update</button>
			</form>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>			
</body>
</html>