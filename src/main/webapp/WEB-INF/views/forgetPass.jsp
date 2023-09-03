<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
<link href="<c:url value="/resources/css/forgetPassword.css" />" rel="stylesheet">
</head>
<body>
	<h1>Forgot Password</h1>
	<form name="forgotPasswordForm" onsubmit="return validateForm()"
		action="resetPassword" method="post">
		Account Number<input type="text" id="accountNumber"
			name="accountNumber" required><br> 
			Old Password<input type="password" id="oldPassword" name="oldPassword" required><br>
			New Password<input type="password" id="newPassword" name="newPassword" required><br>
		Confirm Password<input type="password" id="confirmPassword"
			name="confirmPassword" required><br>
		<button type="submit">Reset Password</button>
		${message}
	</form>
	<script type="text/javascript" src="<c:url value="/resources/javascript/forgetPass.js" />"></script>
</body>
</html>
