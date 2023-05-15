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



            // If the Java variable 'submitted' is not null AND 'submitted' equals "yes"

            if (submitted != null && submitted.equals("yes")) {
                String tos = request.getParameter("tos");
                if (tos != null && tos.equals("true")) {
                    User user = new User(
                    request.getParameter("firstName"),
                    request.getParameter("lastName"),
                    request.getParameter("email"),
                    request.getParameter("password"),
                    request.getParameter("phoneNumber")
                    );
                    session.setAttribute("User", user);
                %>
                
            <body>
                <h1>Registration Successful.</h1>
                <p>Welcome, <%= user.getFullName() %>!</p>
                <p>Your email is: <%= user.getEmail() %></p>
                <p>Your password is: <%= user.getPassword() %></p>
                <p>Your phone number is: <%= user.getPhoneNumber() %></p>
                <p>Click <a href="index.jsp">here</a> to proceed to the login page</p>
            </body>     
            
            <%
                } else {
            %>
                <p>You must agree to the TOS to register. Please <a href="registration.jsp">go back</a> and agree to the TOS.</p>
            <%
                }
            %>

            
            
            
            
            
            
            
            
            
            
            
            
            <%    } else { 
                        if (userType.equals("customer")) { %>
            <body>
            <h1>Customer Registration Form</h1>
            <form action="register.jsp" method="POST">
                    <table>
                        <tr>
                                <td><label for="email">Email:</label></td>
                                <td><input type="email" name="email" required></td>
                        </tr>
                        <tr>
                                <td><label for="name">First Name:</label></td>
                                <td><input type="text" name="firstName" required></td>
                        </tr>
                        <tr>
                                <td><label for="name">Last Name:</label></td>
                                <td><input type="text" name="lastName" required></td>
                        </tr>
                        <tr>
                                <td><label for="password">Password:</label></td>
                                <td><input type="password" name="password" required></td>
                        </tr>
                        <tr>
                                <td><label for="password">Phone Number:</label></td>
                                <td><input type="text" name="phoneNumber" required></td>
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
                    <input type="hidden" name="userType" value="customer">
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
