<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="iotbay.group1.iotbay.UserManager" %>
<%@ page import="iotbay.group1.iotbay.DB" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Check</title>
</head>
    <body>
        <%
            // Retrieve the userType, email, and password from the request
            String userType = request.getParameter("userType");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Create a connection to the database
            DB db = new DB();
            Connection conn = db.getConnection();

            if (userType.equals("customer")) {
                userType = "Customer";
            } else {
                userType = "Staff";
            }

            // Check if the user credentials are valid
            boolean isAuthenticated = db.authenticateUser(conn, userType, email, password);

            if (isAuthenticated) {
                // Save user details in session
                session.setAttribute("email", email);
                session.setAttribute("userType", userType);

                // Redirect to the desired page
                response.sendRedirect("welcome.jsp");
            } else {
                // Display error message
                out.println("<h2>Invalid email or password. Please try again.</h2>");
                out.println("<a href='login.jsp'>Back to Login</a>");
            }

            // Close the connection
            conn.close();
        %>
    </body>
</html>

<!--
emma.johnson@gmail.com
FJd6wHx#
-->