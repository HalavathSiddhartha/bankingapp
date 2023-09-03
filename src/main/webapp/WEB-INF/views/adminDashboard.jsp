<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard - Bank Account Management</title>
<link href="<c:url value="/resources/css/adminDashboard.css" />" rel="stylesheet">
</head>
<body>
	<div id="header">
		<h2>Admin Dashboard - Bank Account Management</h2>
	</div>
	<div id="container">
		<div class="dashboard-title">Welcome Back !</div>
		<ul class="menu">
			<li class="menu-item"><a class="menu-link"
				href="newCustomerAccount">Create New Bank Account</a></li>
			<li class="menu-item"><a class="menu-link"
				href="viewAllAccounts">View All Bank Accounts</a></li>
			<li class="menu-item"><a class="menu-link" href="deleteAccounts">Delete
					Bank Account</a></li>
			<li class="menu-item"><a class="menu-link" href="updateaccount">Update
					Bank Account</a></li>
			<li class="menu-item"><a class="menu-link" href="logout">Logout</a></li>
		</ul>
	</div>
</body>
</html>
