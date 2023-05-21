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
        // Get User from the session
        User user = (User) session.getAttribute("User");
        
        // If a User exists, get their name and email then display a personal welcome message
        if (user != null) {
        // Get name and email
        String name = user.getFullName();
        String email = user.getEmail();
        %>
        <p>You are logged in as <%=name%> (<%=email%>)</p>
        <h1>Home</h1>
        <a href="edit_user.jsp">My Account</a>
        <br>
        <a href="view_logs.jsp">View Login/Logout Logs</a>
        <br>
        <a href="logout.jsp">Logout</a>
        
        <% } else { %>
        <!--  If a User doesn't already exist, show beginner page -->
        <p>Welcome to IotBay! To get started, please register or login if you have an existing account.</p>
        <a href="login.jsp?userType=Customer">Login</a> <a> / </a> <a href="login.jsp?userType=Staff">Staff Login</a>
        <br>
        <a href="register.jsp?userType=Customer">Register</a> <a> / </a> <a href="register.jsp?userType=Staff">Staff Register</a>
        <br>
        <% } %>
    </body>
</html>