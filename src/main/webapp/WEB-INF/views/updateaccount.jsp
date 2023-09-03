<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Customer Account</title>
<link href="<c:url value="/resources/css/updateAccount.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-pzjw6f+ua5mz72D9mCBaJPFmB9K0M4LCA6+M5x7GJh1PiIWX8f8V1ZI8Rzo0XaRd"
	crossorigin="anonymous">

</head>
<body>

	<div class="container">
		<div class="form-container">
			<h3 class="mb-4 text-center">Update Customer Account</h3>
			<form action="processUpdateAccount" method="POST"
				id="updateAccountForm" onsubmit="return validateForm();">
				<div class="form-group">
					<label for="accountNumber">Enter Account Number</label> <input
						type="text" class="form-control" id="accountNumber"
						name="accountNumber">
				</div>
				<div class="form-group">
					<label for="fullName">Full Name :</label> <input type="text"
						class="form-control" id="fullName" name="fullName">
				</div>
				<div class="form-group">
					<label for="address">Address :</label>
					<textarea class="form-control" id="address" name="address" rows="3"></textarea>
				</div>
				<div class="form-group">
					<label for="mobileNo">Mobile Number :</label> <input type="tel"
						class="form-control" id="mobileNo" name="mobileNo">
				</div>
				<div class="form-group">
					<label for="email">Email :</label> <input type="email"
						class="form-control" id="email" name="email">
				</div>
				<button type="submit" class="btn btn-primary">Update
					Account</button>
			</form>

			<div class="error-message">${message}</div>
		</div>
	</div>
	<script type="text/javascript" src="<c:url value='/resources/javascript/updateAcc.js' />"></script>
	
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
