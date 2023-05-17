<%-- 
    Document   : register
    Created on : 21/03/2023, 4:17:36 PM
    Author     : eren_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="iotbay.group1.iotbay.*" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>Logged Out</title>
</head>
    <body>
        <p>You have been logged out. Click <a href="index.jsp">here</a> to return to the main page.</p>
        <%
            // Create a connection to the database
            DB db = new DB();
            Connection conn = db.getConnection();
            
            String userType = (String) session.getAttribute("userType");
            Integer logID = (Integer) session.getAttribute("log_id");
            
            // Log user logout
            db.logUserLogout(conn, userType, logID);
            
            // Close the connection
            conn.close();
            session.invalidate();
        %>
    </body>
</html>
