<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="32x32"
	href="./images/favicon-32x32.png">
<link rel="stylesheet"
	href="<c:url value="/resources/css/homepage.css"/>">

<title>The Nagaland Bank</title>


</head>

<body>

	<div class="container">
		<div class="header">
			<div class="topHeader">

				<img src="<c:url value="/resources/images/Logo.png"/>"
					alt="the nagaland bank logo">

				<nav class="navigation">
					<ul>
						<li><a class="navLink" href="#">Home</a></li>
						<li><a class="navLink" href="about">About</a></li>
						<li><a class="navLink" href="adminLoginPage">Admin Login</a></li>

					</ul>
				</nav>

				<button id="requestBtn">Customer Login</button>

				<span id="btn" class="navToggler"> <svg
						xmlns="http://www.w3.org/2000/svg" width="24" height="11"
						id="show" class="display">
            <g fill="#2D314D" fill-rule="evenodd">
              <path d="M0 0h24v1H0zM0 5h24v1H0zM0 10h24v1H0z" />
            </g>
          </svg> <svg xmlns="http://www.w3.org/2000/svg" width="18"
						height="19" id="hide" class="hide">
            <g fill="#2D314D" fill-rule="evenodd">
              <path d="M.868.661l16.97 16.97-.706.708L.162 1.369z" />
              <path d="M.161 17.632L17.131.662l.708.706-16.97 16.97z" />
            </g>
          </svg>
				</span>
			</div>
		</div>

		
		<div class="digitalBanking">
			<div class="dgtBankInfo">
				<h1>The Nagaland Bank Welcomes You !</h1>
				<p class="text-muted">
					We are India's first cloud bankers.<br> At Nagaland Bank, we
					are dedicated to provide innovative banking solutions that leverage
					the power of cloud technology. With a strong commitment to
					security, convenience, and customer satisfaction, we aim to
					redefine the banking experience for our valued customers. Our
					cloud-based platform allows you to access your accounts, manage
					transactions, and perform banking operations seamlessly from
					anywhere in the world. Say goodbye to traditional banking hassles
					and embrace the future of banking with our cloud banking.
				</p>
			</div>
			<div class="dgtBankImg">
				<img src="<c:url value="/resources/images/bgimgperson.png"/>"
					alt="image-mockups">
			</div>
		</div>

		<div class="footer">
			<div class="footerList">
				<div class="footerDiv">
					<img src="<c:url value="/resources/images/Logo.png"/>"
						alt="the nagaland bank logo">
				</div>
				<div class="footerDiv">
					<p>© The Nagaland Bank. All Rights Reserved</p>
				</div>
			</div>
		</div>

		<script src="script.js"></script>
	</div>
</body>
<script>
	document.getElementById("requestBtn").addEventListener("click", function() {

		var url = "customerLogin";

		window.location.href = url;
	});
</script>
</html>
