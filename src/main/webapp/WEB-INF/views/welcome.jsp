<%@page import="CRUD.model.User"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
	integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-light">

	<div class="container mt-5">
		<div class="card shadow p-4">
			<h3 class="text-center mb-4 mx-auto">Dashboard</h3>
			<div class="d-flex justify-content-center align-items-center mb-4">
				<div class="rounded-circle bg-secondary d-flex justify-content-center align-items-center " style="width:120px; height:120px">
					<i class="fa-duotone fa-solid fa-user"  style="font-size: 50px; color:#ffffff;"></i>
				</div>
			</div>
			<p class="mx-auto font-weight-bold">Welcome, ${user.name}!</p>
			<p class="mx-auto font-weight-bold">Your username is:
				${user.username}</p>
			<div class="d-flex justify-content-center align-items-center  ">
				<p class=" font-weight-bold mb-0 me-2">Your password is:</p>
				<div style="width: 60px;">
				<input type="password" value="${user.password}"
											id="password" class="form-control-plaintext  "
											readonly>
				</div>
					<div >
						<a href="javascript:void(0)" id="togglePasswordsBtn" onclick="togglePassword()"  class="text-decoration-none cursor-pointer"><i class="fa-solid fa-eye"></i></a>
					</div>
			</div>	
			
			
			<c:choose>
				<c:when test="${user.name == 'Admin'}">
					<div class="d-flex justify-content-center mt-3 gap-4">
						<a class="btn btn-success mt-2"
							href="${pageContext.request.contextPath}/admindashboard">Admin
							Dashboard</a> 
							<a class="btn btn-primary mt-2 "
							href="update/${user.id}">Edit Admin Details </a> 
							<a class="btn btn-danger  mt-2 px-5" href="login">Logout</a>
					</div>

				</c:when>
				<c:otherwise>
					<div class="d-flex justify-content-center mt-3 ">
						<a class="btn btn-danger px-5 mt-2" href="login">Logout</a>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>


<script>
    function togglePassword() {
        const toggleButton = document.getElementById("togglePasswordsBtn");
        const passwordInput = document.getElementById("password");

        // Determine the current state (show or hide)
        const showPassword = passwordInput.type === "password";

        // Toggle the password input field
        passwordInput.type = showPassword ? "text" : "password";

        // Update button text
        toggleButton.innerHTML = showPassword ? "<i class='fa-solid fa-eye-slash'></i>" : "<i class='fa-solid fa-eye'></i>";
    }
</script>

</body>
</html>
