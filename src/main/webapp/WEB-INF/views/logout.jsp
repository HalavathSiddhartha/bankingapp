<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Successful</title>
<link href="<c:url value="/resources/css/logout.css" />" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Logout was Successful</h1>
        <p>Your logout attempt was successful.</p>
        <a href="adminLoginPage">Login Again</a>
    </div>
</body>
</html>
