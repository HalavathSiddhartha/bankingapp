<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Bank Account</title>
<link rel="stylesheet" href="<c:url value='/resources/css/newCustomer.css' />">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-pzjw6f+ua5mz72D9mCBaJPFmB9K0M4LCA6+M5x7GJh1PiIWX8f8V1ZI8Rzo0XaRd"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="form-container">
			<h3 class="mb-4 text-center">Create New Bank Account</h3>
			<form action="processNewAccount" method="POST" id="accountForm">
				<div class="form-group">
					<label for="fullName">Full Name:</label> <input type="text"
						class="form-control" id="fullName" name="fullName">
				</div>
				<div class="form-group">
					<label for="address">Address:</label>
					<textarea class="form-control" id="address" name="address" rows="3"></textarea>
				</div>
				<div class="form-group">
					<label for="mobileNo">Mobile Number:</label> <input type="tel"
						class="form-control" id="mobileNo" name="mobileNo">
				</div>
				<div class="form-group">
					<label for="email">Email Id:</label> <input type="email"
						class="form-control" id="email" name="email">
				</div>
				<div class="form-group">
					<label for="accountType">Account Type:</label> <select
						class="form-control" id="accountType" name="accountType">
						<option value="savings">Savings</option>
						<option value="current">Current</option>
					</select>
				</div>
				<div class="form-group">
					<label for="initialBalance">Initial Balance:</label> <input
						type="text" class="form-control" id="balance"
						name="initialBalance">
				</div>
				<button type="submit" class="btn btn-primary">Create
					Account</button>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="<c:url value='/resources/javascript/newCustomer.js' />"></script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous">
		
	</script>
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
