<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="iotbay.group1.iotbay.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="iotbay.group1.iotbay.DB" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>User Registration Form</title>

</head>
            <%
            // Retrieve value of 'submitted' & 'tos' from the request
            String submitted =  request.getParameter("submitted");
            String userType = request.getParameter("userType");
            String tos = request.getParameter("tos");
            
            // Store userType into session
            if (userType != null) {
                session.setAttribute("userType", userType);
            } 
            // Otherwise get from session
            else {
                userType = (String) session.getAttribute("userType");
            }
            
            // If form was submitted
            if (submitted != null && submitted.equals("yes")) {
                // if Terms of Service (tos) was agreed upon
                if (tos != null && tos.equals("true")) {
                    
                    // Create a connection to the DB
                    DB db = new DB();
                    Connection conn = db.getConnection();
                    
                    // Initialise required variables
                    String registerResult;
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String phoneNumber = request.getParameter("phoneNumber");
                    String address = request.getParameter("address");
                    String code = request.getParameter("staffCode");
                    
                    // If the user is staff and has provided the correct staff code (checked against DB)
                    if (userType.equalsIgnoreCase("staff") && db.isCorrectStaffCode(conn, code)) {
                        String role = request.getParameter("role");
                        // Register staff
                        registerResult = db.registerStaff(conn, firstName, lastName, email, password, role, phoneNumber, address, userType);
                    }
                    // If the user is a customer
                    else if (userType.equalsIgnoreCase("customer")){
                        // Register customer
                        registerResult = db.registerCustomer(conn, firstName, lastName, email, password, phoneNumber, address, userType);
                    }
                    // Provided staff code was wrong.
                    else {
                        registerResult = "Failed. Wrong staff code.";
                    }
                    // Close the connection to the DB
                    conn.close();
                    
                    // If the registration was successful
                    if (registerResult.equals("Success")) {
                        // Redirect to register_successful.jsp
                        response.sendRedirect("register_successful.jsp");
                    }
                    // If the user provided the wrong staff code
                    else if (registerResult.equals("Failed. Wrong staff code.")) {
                        // Print out error message to customer
                        out.println("<h2>Registration failed - wrong staff code inputted. Please try again.</h2>");
                        out.println("<a href='register.jsp?userType=staff'>Back to register page.</a>");
                    }
                    // If provided email is already registered
                    else if (registerResult.contains("UNIQUE constraint failed:") && registerResult.contains(".email")){
                        // Email already registered. Give error message.
                        out.println("<h2>This email is already registered.</h2>");
                        out.println("<a href='register.jsp?userType=" + userType + "'>Back to register page.</a>");
                        out.println("<br>");
                        out.println("<a href='login.jsp?userType=" + userType + "'>Login with existing account.</a>");
                    }
                    // If phone number is already registered
                    else if (registerResult.contains("UNIQUE constraint failed:") && registerResult.contains(".phone_number")){
                        // Phone already registered. Give error message.
                        out.println("<h2>This phone number is already registered.</h2>");
                        out.println("<a href='register.jsp?userType=" + userType + "'>Back to register page.</a>");
                        out.println("<br>");
                        out.println("<a href='login.jsp?userType=" + userType + "'>Login with existing account.</a>");
                    }
                    // Unknown error, redirect back to register page
                    else {
                        // Error occurred. Give error message.
                        out.println("<h2>Registration failed. Please try again.</h2>");
                        out.println("<a href='register.jsp?userType=" + userType + "'>Back to register page.</a>");
                    }
                } else {
            %>
                <!--  Inform user to accept TOS -->
                <p>You must agree to the TOS to register. Please <a href="registration.jsp">go back</a> and agree to the TOS.</p>
            <%
                }} else { 
                        // If no form is submitted and user is a customer, display customer registration form
                        if (userType.equals("Customer")) { %>
            <body>
            <h1>Customer Registration Form</h1>
            <form action="register.jsp" method="POST">
                    <table>
                        <tr>
                                <td><label for="email">Email:</label></td>
                                <td><input type="email" name="email" required></td>
                        </tr>
                        <tr>
                                <td><label for="firstName">First Name:</label></td>
                                <td><input type="text" name="firstName" required></td>
                        </tr>
                        <tr>
                                <td><label for="lastName">Last Name:</label></td>
                                <td><input type="text" name="lastName" required></td>
                        </tr>
                        <tr>
                                <td><label for="password">Password:</label></td>
                                <td><input type="password" name="password" required></td>
                        </tr>
                        <tr>
                                <td><label for="phoneNumber">Phone Number:</label></td>
                                <td><input type="text" name="phoneNumber" required></td>
                        </tr>
                        <tr>
                                <td><label for="address">Address:</label></td>
                                <td><input type="text" name="address" required></td>
                        </tr>
                        <tr>
                                <td><label for="tos">I agree to the Terms of Service:</label></td>
                                <td><input type="checkbox" name="tos" value="true"></td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" value="Register">
                    <input type="button" value="Cancel" onclick="window.location.href='index.jsp';">
                    <input type="hidden" name="submitted" value="yes">
                    <input type="hidden" name="userType" value="Customer">
            </form>
            </body>
            <% }  else { %>
            <body>
            <!--  If the user is a staff, display customer registration form -->
            <h1>Staff Registration Form</h1>
            <form action="register.jsp" method="POST">
                    <table>
                        <tr>
                                <td><label for="email">Email:</label></td>
                                <td><input type="email" name="email" required></td>
                        </tr>
                        <tr>
                                <td><label for="firstName">First Name:</label></td>
                                <td><input type="text" name="firstName" required></td>
                        </tr>
                        <tr>
                                <td><label for="lastName">Last Name:</label></td>
                                <td><input type="text" name="lastName" required></td>
                        </tr>
                        <tr>
                                <td><label for="password">Password:</label></td>
                                <td><input type="password" name="password" required></td>
                        </tr>
                        <tr>
                                <td><label for="phoneNumber">Phone Number:</label></td>
                                <td><input type="text" name="phoneNumber" required></td>
                        </tr>
                        <tr>
                                <td><label for="address">Address:</label></td>
                                <td><input type="text" name="address" required></td>
                        </tr>
                        <tr>
                                <td><label for="role">Role:</label></td>
                                <td><input type="text" name="role" required></td>
                        </tr>
                        <tr>
                                <td><label for="staffCode">Staff Code:</label></td>
                                <td><input type="password" name="staffCode" required></td>
                        </tr>
                        <tr>
                                <td><label for="tos">I agree to the Terms of Service:</label></td>
                                <td><input type="checkbox" name="tos" value="true"></td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" value="Register">
                    <input type="button" value="Cancel" onclick="window.location.href='index.jsp';">
                    <input type="hidden" name="submitted" value="yes">
                    <input type="hidden" name="userType" value="staff">
            </form>
            </body>
            <% }} %>
</html>
