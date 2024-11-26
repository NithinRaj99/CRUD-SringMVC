<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD Web APP</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
	integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<main>

		<!--MDB Tables-->
		<div class="container mt-4">
			<div class="card mb-4">
				<div class="card-body">
					<div class="col-md-12">
						<h2
							class="pt-3 pb-4 text-center font-bold font-up deep-purple-text">DashBoard</h2>
					</div>
					<!--Table-->
					<table class="table table-striped">
						<!--Table head-->
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">User Name</th>
								<th scope="col">Password</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<!--Table head-->
						<!--Table body-->
						<tbody>

							<c:forEach items="${users}" var="u" varStatus="status">
								<%-- <c:if test="${u.name!='Admin'}"> --%>
									<tr>
										<th scope="row">USR-${status.count}</th>
										<th scope="row">${u.id}</th>
										<td>${u.name}</td>
										<td>${u.username}</td>
										<td><input type="password" value="${u.password}"
											id="password-${u.id}" class="form-control-plaintext w-auto"
											readonly></td>
										<td><a href="update/${u.id}"> <i
												class="fa-solid fa-pen text-success me-2 fa-lg"></i></a> <a
											href="delete/${u.id}"> <i
												class="fa-solid fa-trash text-danger fa-lg"></i></a></td>
									</tr>

								<%-- </c:if> --%>
							</c:forEach>
						</tbody>
						<!--Table body-->
					</table>
					<!--Table-->
					<div class="d-flex justify-content-center mt-3 gap-4">
						<a class="btn btn-primary px-5" href="admin-add-user">Add
							User</a>
							
							<button type="button" id="togglePasswordsBtn"
							class="btn btn-warning px-4" onclick="toggleAllPasswords()">
							Show Passwords</button>
							
							<a class="btn btn-danger px-5" href="login">Logout</a>
							
					</div>
				</div>

			</div>


		</div>

	</main>



	<script>
    function toggleAllPasswords() {
        const toggleButton = document.getElementById("togglePasswordsBtn");
        const passwordInputs = document.querySelectorAll("input[type='password'], input[type='text']");

        // Determine the current state (show or hide)
        const showPasswords = toggleButton.textContent === "Show Passwords";

        // Toggle the password inputs
        passwordInputs.forEach(input => {
            input.type = showPasswords ? "text" : "password";
        });

        // Update button text
        toggleButton.textContent = showPasswords ? "Hide Passwords" : "Show Passwords";
    }
</script>

</body>
</html>