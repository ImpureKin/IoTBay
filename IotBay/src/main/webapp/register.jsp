<%-- 
    Document   : register
    Created on : 21/03/2023, 4:17:36 PM
    Author     : eren_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="iotbay.group1.iotbay.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="iotbay.group1.iotbay.DB" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>User Registration Form</title>
        <script>
            function validateStaffForm() {
                var staffCode = document.getElementsByName('staffCode')[0].value;
                if (staffCode !== 'secretPassword123') {
                    alert('Invalid staff code. Please try again.');
                    return false;
                }
                return true;
            }
        </script>
</head>
            <%
            // Retrieve the value (if any) of the form field called 'submitted'

            String submitted =  request.getParameter("submitted");
            String userType = request.getParameter("userType");
            
            if (userType != null) {
                session.setAttribute("userType", userType);
            } 
            else {
                userType = (String) session.getAttribute("userType");
            }
            
            if (submitted != null && submitted.equals("yes")) {
                String tos = request.getParameter("tos");
                if (tos != null && tos.equals("true")) {
                
                    // Insert into DB (conn, userType, fname, lname, email, pass, phone, address)
                    DB db = new DB();
                    Connection conn = db.getConnection();
                    
                    String registerResult;
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String phoneNumber = request.getParameter("phoneNumber");
                    String address = request.getParameter("address");
                    
                    if (userType.equalsIgnoreCase("staff")) {
                        String role = request.getParameter("role");
                        registerResult = db.registerStaff(conn, firstName, lastName, email, password, role, phoneNumber, address, userType);
                    }
                    else {
                        registerResult = db.registerCustomer(conn, firstName, lastName, email, password, phoneNumber, address, userType);
                    }
                    conn.close();
                    
                    
                    if (registerResult.equals("Success")) {
                        // Redirect to register_successful.jsp
                        response.sendRedirect("register_successful.jsp");
                    }
                    else if (registerResult.contains("UNIQUE constraint failed:") && registerResult.contains(".email")){
                        // Email already registered. Give error message.
                        out.println("<h2>This email is already registered.</h2>");
                        out.println("<a href='register.jsp?userType=" + userType + "'>Back to register page.</a>");
                        out.println("<br>");
                        out.println("<a href='login.jsp?userType=" + userType + "'>Login with existing account.</a>");
                    }
                    else if (registerResult.contains("UNIQUE constraint failed:") && registerResult.contains(".phone_number")){
                        // Phone already registered. Give error message.
                        out.println("<h2>This phone number is already registered.</h2>");
                        out.println("<a href='register.jsp?userType=" + userType + "'>Back to register page.</a>");
                        out.println("<br>");
                        out.println("<a href='login.jsp?userType=" + userType + "'>Login with existing account.</a>");
                    }
                    else {
                        // Error occurred. Give error message.
                        out.println("<h2>Registration failed. Please try again.</h2>");
                        out.println("<a href='register.jsp?userType=" + userType + "'>Back to register page.</a>");
                    }
                    


                } else {
            %>
                <p>You must agree to the TOS to register. Please <a href="registration.jsp">go back</a> and agree to the TOS.</p>
            <%
                }
            %>

            
            
            
            
            
            
            
            
            
            
            
            
            <%    } else { 
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
            
            
            
            
            
            
            
            
            
            
            
            
            
            <% }  else {%>
            <body>
            <h1>Staff Registration Form</h1>
            <form action="register.jsp" method="POST" onsubmit="return validateStaffForm();">
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
            <%   }} %>
</html>
