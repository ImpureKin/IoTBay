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
        <title>Logged Out</title>
</head>
    <body>
        <p>You have been logged out. Click <a href="index.jsp">here</a> to return to the main page.</p>
        <%session.invalidate();%>
    </body>
</html>
