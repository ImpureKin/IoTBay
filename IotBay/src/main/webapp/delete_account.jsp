<%-- 
    Document   : delete_account
    Created on : 18/05/2023, 9:38:51 PM
    Author     : Big Pops
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="iotbay.group1.iotbay.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Deleted</title>
    </head>
    <body>
        <%
            // Create a connection to the database
            DB db = new DB();
            Connection conn = db.getConnection();
            
            String userType = (String) session.getAttribute("userType");
            User user = (User) session.getAttribute("User");
            int userID = user.getID();
            
            // Log user logout
            db.deleteAccount(conn, userType, userID);
            
            // Close the connection
            conn.close();
            session.invalidate();
        %>
        <h1>Your account has been deleted.</h1>
        <p>Click <a href="index.jsp">here</a> to return to the main page.</p>
    </body>
</html>