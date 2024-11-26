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

<h1>${spring}</h1>
<hr>
<h1>Admin Add User</h1>


<form action="adminadduser" method="post">
			
			
			<div data-mdb-input-init class="form-outline form-white mb-4">
			<input type="text" id="name" name="name" required placeholder="Enter Name" class="form-control form-control-lg" />
			</div>
              <div data-mdb-input-init class="form-outline form-white mb-4">
             <!--  <label class="form-label" for="username">USER NAME</label> -->
             
                <input type="text" id="username" name="username" required placeholder="Enter Username" class="form-control form-control-lg" />
                
              </div>

              <div data-mdb-input-init class="form-outline form-white mb-4">
              <!-- <label class="form-label" for="password">PASSWORD</label> -->
                <input type="password" id="password" name="password" placeholder="Enter Password" class="form-control form-control-lg" />
                
              </div>

              <button data-mdb-button-init data-mdb-ripple-init class="btn  btn-primary text-white btn-outline-dark btn-lg px-5" type="submit">Add User</button>
			</form>
</body>
</html>