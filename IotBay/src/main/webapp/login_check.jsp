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
            // Retrieve the userType, email, and password from the request/session
            String userType = (String) session.getAttribute("userType");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Create a connection to the database
            Connection conn = DB.getConnection();

            // Check if the user credentials are valid and exist in the database
            boolean isAuthenticated = DB.authenticateUser(conn, userType, email, password);

            // If the user exists and is using the right credentials
            if (isAuthenticated) {
                // Save user details in session
                User user = DB.getUser(conn, userType, email);
                session.setAttribute("User", user);
                // Save log_id for later when logging logout time
                session.setAttribute("log_id", DB.logUserLogin(conn, userType, user.getID()));

                // Redirect to index
                response.sendRedirect("index.jsp");
            } else {
                // Display error message due to using wrong credentials
                out.println("<h2>Invalid email or password. Please try again.</h2>");
                out.println("<a href='login.jsp?userType=" + userType + "'>Back to Login</a>");
            }

            // Close the database connection
            conn.close();
        %>
    </body>
</html>