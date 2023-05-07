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
        <title>My Account</title>
</head>
            <%
            // Retrieve the value (if any) of the form field called 'submitted'

            String submitted =  request.getParameter("submitted");
            
            // Get user
            User user = (User) session.getAttribute("User");

            // If the Java variable 'submitted' is not null AND 'submitted' equals "yes"

            if (submitted != null && submitted.equals("yes")) {
                // Update existing user details
                    
                // Get input from My Account form
                    String email = request.getParameter("email");
                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String password = request.getParameter("password");
                    String phoneNumber = request.getParameter("phoneNumber");
                    
                // Go through each value. If something is inputted (not null), update user
                    if (!email.isEmpty()) {
                    user.setEmail(email);
                }
                    if (!firstName.isEmpty()) {
                    user.setFirstName(firstName);
                }
                    if (!lastName.isEmpty()) {
                    user.setLastName(lastName);
                }
                    if (!password.isEmpty()) {
                    user.setPassword(password);
                }
                    if (!phoneNumber.isEmpty()) {
                    user.setPhoneNumber(phoneNumber);
                }
                    
                // Update session's User
                    session.setAttribute("User", user);
                    
                // Redirect to home page
                    response.sendRedirect("index.jsp");
                    
            } else { %>
            <body>
            <h1>My Account</h1>
            <form action="edit_user.jsp" method="POST">
                
                    <p>Your email is: <%= user.getEmail() %></p>
                    <p>Your first name is: <%= user.getFirstName() %></p>
                    <p>Your last name is: <%= user.getLastName() %></p>
                    <p>Your password is: <%= user.getPassword() %></p>
                    <p>Your phone number is: <%= user.getPhoneNumber() %></p>
                    <table>
                        <tr>
                                <td><label for="email">Email:</label></td>
                                <td><input type="email" name="email"></td>
                        </tr>
                        <tr>
                                <td><label for="name">First Name:</label></td>
                                <td><input type="text" name="firstName"></td>
                        </tr>
                        <tr>
                                <td><label for="name">Last Name:</label></td>
                                <td><input type="text" name="lastName"></td>
                        </tr>
                        <tr>
                                <td><label for="password">Password:</label></td>
                                <td><input type="password" name="password"></td>
                        </tr>
                        <tr>
                                <td><label for="password">Phone Number:</label></td>
                                <td><input type="text" name="phoneNumber"></td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" value="Save">
                    <input type="hidden" name="submitted" value="yes">
            </form>
            </body>
            <%   } %>
</html>
