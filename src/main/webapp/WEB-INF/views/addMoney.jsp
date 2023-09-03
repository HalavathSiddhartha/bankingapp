<!DOCTYPE html>
<%@page import="bankingapp.entity.Customer"%>
<%@page import="bankingapp.entity.Cust_detail"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
          crossorigin="anonymous">
    <link href="<c:url value="/resources/css/transaction.css" />" rel="stylesheet">
</head>
<body>
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    Customer cust = (Customer) session.getAttribute("user");
    %>
    <div class="container">
        <h3>Enter Amount to Deposit</h3>
        <form action="addtrans" method="post">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Account Number</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                       name="accountNumber" value="<%=cust.getAccountNumber()%>">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Amount</label>
                <input type="text" class="form-control" name="depositMoney" required pattern="^[1-9]\d*$">
                <!-- Add pattern attribute for positive values -->
                <small class="form-text text-muted">Please enter a positive number.</small>
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
