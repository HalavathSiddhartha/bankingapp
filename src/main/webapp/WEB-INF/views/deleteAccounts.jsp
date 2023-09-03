<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Bank Account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/deleteAccount.css" />" rel="stylesheet">
</head>
<body>

	<nav
		class="navbar navbar-expand-lg bg-body-tertiary navbar bg-dark border-bottom border-body"
		data-bs-theme="dark">
		<div class="container-fluid m-4 px-5">
			<a class="navbar-brand ">The Nagaland bank</a>
			<div class="text-center  ">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/BankingApp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="about">About</a></li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
						

					</ul>
				</div>
			</div>

		</div>
	</nav>
<body>

	<div class="container">
		<div class="form-container">
			<h3 class="mb-4 text-center">Delete Bank Account</h3>

			<form action="deleteAccount" method="POST" id="deleteAccountForm">
				<div class="form-group">
					<label for="accountNumber">Enter Account Number: </label> <input
						type="text" class="form-control" id="accountNumber"
						name="accountNumber">
				</div>
				<button type="submit" class="btn btn-danger"
					id="deleteAccountButton">Delete Account</button>
			</form>
			<div class="error-message">${message}</div>
		</div>

	</div>
	<script type="text/javascript" src="<c:url value="/resources/javascript/deleteAccount.js" />"></script>
	

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
</body>
</html>
