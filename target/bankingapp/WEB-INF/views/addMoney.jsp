<!DOCTYPE html>
<%@page import="bankingapp.entity.Customer"%>
<%@page import="bankingapp.entity.Cust_detail"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Add Account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
body {
	background-color: #f8f9fa;
}

.container {
	max-width: 50rem;
	margin-top: 30px;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

h3 {
	font-size: 24px;
	margin-bottom: 20px;
}

.form-label {
	font-weight: bold;
}

.form-control {
	border: 1px solid #ced4da;
	border-radius: 5px;
	padding: 8px;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}
</style>
</head>
<body>

	<%
	Customer cust = (Customer) session.getAttribute("user");
	%>

	<div class="container">
		<h3>Enter Amount to Deposit</h3>
		<form action="addtrans" method="post">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Account
					Number</label> <input type="text" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					name="accountNumber" value="<%=cust.getAccountNumber()%>">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Amount</label>
				<input type="text" class="form-control" id="exampleInputPassword1"
					name="depositMoney" required>
			</div>
			<button type="submit" class="btn btn-primary">Confirm</button>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
