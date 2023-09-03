<!DOCTYPE html>
<%@page import="bankingapp.entity.Customer"%>
<%@page import="bankingapp.entity.Cust_detail"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Add Account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/transaction.css" />" rel="stylesheet">
</head>
<body>

	<%
	Customer cust = (Customer) session.getAttribute("user");
	%>

	<div class="container">
		<h3 class="text-center">Enter Amount to Withdraw</h3>
		<form action="transCheck" method="post">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Account
					Number</label> <input type="text" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					name="accountNumber" value="<%=cust.getAccountNumber()%>">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Amount</label>
				<input type="text" class="form-control" id="exampleInputPassword1"
					name="withdrawMoney" required>
			</div>
			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-primary">Confirm</button>
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
