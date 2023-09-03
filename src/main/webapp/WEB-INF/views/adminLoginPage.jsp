<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-pzjw6f+ua5mz72D9mCBaJPFmB9K0M4LCA6+M5x7GJh1PiIWX8f8V1ZI8Rzo0XaRd"
	crossorigin="anonymous">
<link rel="stylesheet"
    href="<c:url value="/resources/css/adminForm.css"/>">


</head>
<body>
	<div class="container">
		<form id="loginForm" action="adminLoginProcess" method="POST">
			<h3 class="text-center mt-3">Admin Login</h3>
			<div class="form-group">
				<label for="usernameInput">Username</label> <input type="text"
					class="form-control" id="usernameInput"
					aria-describedby="emailHelp" placeholder="Enter Username"
					name="username"> <small id="usernameError"
					class="form-text text-danger"></small>
			</div>
			<div class="form-group">
				<label for="passwordInput">Password</label> <input type="password"
					class="form-control" id="passwordInput" placeholder="Password"
					name="password"> <small id="passwordError"
					class="form-text text-danger"></small>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">Login</button>
			</div>
			<p class="mt-3">
				<a href="adminRegPage" class="btn btn-outline-primary">New admin
					Registration</a>
			</p>
		</form>
		<div class="error-message">${message}</div>
	</div>
<script type="text/javascript" src="<c:url value="/resources/javascript/adminLogin.js" />"></script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-pzjw6f+ua5mz72D9mCBaJPFmB9K0M4LCA6+M5x7GJh1PiIWX8f8V1ZI8Rzo0XaRd"
		crossorigin="anonymous"></script>
</body>
</html>
