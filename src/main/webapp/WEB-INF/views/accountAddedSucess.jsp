<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Creation Status</title>
    <link href="<c:url value="/resources/css/accountSuccess.css" />" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Account Creation Status</h1>
        <p>Welcome, Dear <strong>${fullName}</strong>! Your account creation was successful.</p>
        <div class="details">
            <h3>Account Details:</h3>
            <p><strong>Name:</strong> ${fullName}</p>
            <p><strong>Address:</strong> ${address}</p>
            <p><strong>Mobile No:</strong> ${mobileNo}</p>
            <p><strong>Email:</strong> ${email}</p>
            <p><strong>Account Type:</strong> ${accountType}</p>
            <p><strong>Initial Balance:</strong> ₹${balance}</p>
            <p><strong>Account Number:</strong>${acc }
            <p><strong>Password:</strong> ${password}</p>
        </div>
    </div>
</body>
</html>
