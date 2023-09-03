<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Page</title>
    <link href="<c:url value="/resources/css/errorPage.css" />" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1>Oops! Something Went Wrong...</h1>
		
		<p>${message }</p>
		<button id="goBackBtn" class="btn btn-primary">Go Back</button>
	</div>

	<script>
		document.getElementById("goBackBtn").addEventListener("click",
				function() {
					window.history.back();
				});
	</script>


</body>
</html>
