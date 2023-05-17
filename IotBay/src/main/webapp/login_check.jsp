<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="iotbay.group1.iotbay.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Check</title>
</head>
    <body>
        <%
            // Retrieve the userType, email, and password from the request
            String userType = (String) session.getAttribute("userType");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Create a connection to the database
            DB db = new DB();
            Connection conn = db.getConnection();

            // Check if the user credentials are valid
            boolean isAuthenticated = db.authenticateUser(conn, userType, email, password);
            System.out.println(isAuthenticated);

            if (isAuthenticated) {
                // Save user details in session
                User user = db.getUser(conn, userType, email);
                session.setAttribute("User", user);
                session.setAttribute("log_id", db.logUserLogin(conn, userType, user.getID()));

                // Redirect to the desired page
                response.sendRedirect("login_successful.jsp");
            } else {
                // Display error message
                out.println("<h2>Invalid email or password. Please try again.</h2>");
                out.println("<a href='login.jsp?userType=" + userType + "'>Back to Login</a>");
            }

            // Close the connection
            conn.close();
        %>
    </body>
</html>