<%-- 
    Document   : register
    Created on : 21/03/2023, 4:17:36 PM
    Author     : eren_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="iotbay.group1.iotbay.User" %>

<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>Index / Main Page</title>
</head>
    <body>
        
        <% 
        // get the user
        User user = (User) session.getAttribute("User");
        if (user != null) {
        // Get name and email
        String name = user.getFullName();
        String email = user.getEmail();
        %>
        
        <p>You are logged in as <%=name%> (<%=email%>)</p>
        <a href="logout.jsp">Logout</a>
        <br>
        <p><a href="edit_user.jsp">My Account</a></p>
       
        <p><a href="viewCard.jsp">My Card Details</a></p>
       
        <p><a href="invoiceList.jsp">My Invoices</a></p>
        <% } else { %>
        
        <p>Welcome to IotBay! To get started, please register or login if you have an existing account.</p>
        <a href="login.jsp?userType=Customer">Login</a> <a> / </a> <a href="login.jsp?userType=Staff">Staff Login</a>
        <br>
        <a href="register.jsp?userType=Customer">Register</a> <a> / </a> <a href="register.jsp?userType=Staff">Staff Register</a>
        <br>
        
        <% } %>
    </body>
</html>
