<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="iotbay.group1.iotbay.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<script>
    // Redirect to account deletion JSP
    function redirectToDeleteAccount() {
      window.location.href = "delete_account.jsp";
  }
</script>
<head>
        <meta charset="UTF-8">
        <title>My Account</title>
</head>
            <%
            // Retrieve value of 'submitted' from request
            String submitted =  request.getParameter("submitted");
            
            // Establish DB Connection
            Connection conn = DB.getConnection();
            
            // Get User & Usertype from Session
            User user = (User) session.getAttribute("User");
            String userType = user.getUserType();

            // If form was submitted then perform the below
            if (submitted != null && submitted.equals("yes")) {
                    
                // Get input from My Account form & existing user details
                String email = request.getParameter("email");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String password = request.getParameter("password");
                String role = request.getParameter("role");
                String phoneNumber = request.getParameter("phoneNumber");
                String address = request.getParameter("address");
                    
                // Go through each value. If a change has been made, update User details
                if (!email.isEmpty()) {
                    user.setEmail(conn, email);
                }
                if (!firstName.isEmpty()) {
                    user.setFirstName(conn, firstName);
                }
                if (!lastName.isEmpty()) {
                    user.setLastName(conn, lastName);
                }
                if (!password.isEmpty()) {
                    user.setPassword(conn, password);
                }
                if (role != null && !role.isEmpty()) {
                    user.setRole(conn, role);
                }
                if (!phoneNumber.isEmpty()) {
                    user.setPhoneNumber(conn, phoneNumber);
                }
                if (!address.isEmpty()) {
                    user.setAddress(conn, address);
                }
                    
                // Update session's User
                session.setAttribute("User", user);

                // Close connection & edirect to home page
                conn.close();
                response.sendRedirect("index.jsp");
                    
            } else { %>
            <body>
            <h1>My Account</h1>
            <!--  If the user is a customer, display the form for changing a customer's details -->
            <% if (userType.equalsIgnoreCase("customer")) { %>
            <form action="edit_user.jsp" method="POST">
                    <p>Your email is: <%= user.getEmail() %></p>
                    <p>Your first name is: <%= user.getFirstName() %></p>
                    <p>Your last name is: <%= user.getLastName() %></p>
                    <p>Your password is: <%= user.getPassword() %></p>
                    <p>Your phone number is: <%= user.getPhoneNumber() %></p>
                    <p>Your address is: <%= user.getAddress() %></p>
                    <br>
                    <h3> Edit your account details below: </h3>
                    <table>
                        <tr>
                                <td><label for="email">Email:</label></td>
                                <td><input type="email" name="email"></td>
                        </tr>
                        <tr>
                                <td><label for="firstName">First Name:</label></td>
                                <td><input type="text" name="firstName"></td>
                        </tr>
                        <tr>
                                <td><label for="lastName">Last Name:</label></td>
                                <td><input type="text" name="lastName"></td>
                        </tr>
                        <tr>
                                <td><label for="password">Password:</label></td>
                                <td><input type="password" name="password"></td>
                        </tr>
                        <tr>
                                <td><label for="phoneNumber">Phone Number:</label></td>
                                <td><input type="text" name="phoneNumber"></td>
                        </tr>
                        <tr>
                                <td><label for="address">Address:</label></td>
                                <td><input type="text" name="address"></td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" value="Save">
                    <button type="button" style="height:20px;width:75px" onClick="location.href='index.jsp'">Cancel</button>
                    <input type="hidden" name="submitted" value="yes">
                    <br>
                    <h2>Delete your account?</h2>
                    <p> WARNING! This will remove your account entirely and will cancel all your orders.</p> 
                    <button type="button" onclick="redirectToDeleteAccount()">Delete Account</button>
            </form>
            <% } else { %>
            <!--  If the user is a staff, display the form for changing a staff's details -->
            <form action="edit_user.jsp" method="POST">
                <p>Your email is: <%= user.getEmail() %></p>
                <p>Your first name is: <%= user.getFirstName() %></p>
                <p>Your last name is: <%= user.getLastName() %></p>
                <p>Your password is: <%= user.getPassword() %></p>
                <p>Your role is: <%= user.getRole() %></p>
                <p>Your phone number is: <%= user.getPhoneNumber() %></p>
                <p>Your address is: <%= user.getAddress() %></p>
                <br>

                <h3> Edit your account details below: </h3>
                <table>
                    <tr>
                            <td><label for="email">Email:</label></td>
                            <td><input type="email" name="email"></td>
                    </tr>
                    <tr>
                            <td><label for="firstName">First Name:</label></td>
                            <td><input type="text" name="firstName"></td>
                    </tr>
                    <tr>
                            <td><label for="lastName">Last Name:</label></td>
                            <td><input type="text" name="lastName"></td>
                    </tr>
                    <tr>
                            <td><label for="password">Password:</label></td>
                            <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                            <td><label for="role">Role:</label></td>
                            <td><input type="text" name="role"></td>
                    </tr>
                    <tr>
                            <td><label for="phoneNumber">Phone Number:</label></td>
                            <td><input type="text" name="phoneNumber"></td>
                    </tr>
                    <tr>
                            <td><label for="address">Address:</label></td>
                            <td><input type="text" name="address"></td>
                    </tr>
                </table>
                <br>
                <input type="submit" value="Save">
                <button type="button" style="height:20px;width:75px" onClick="location.href='index.jsp'">Cancel</button>
                <input type="hidden" name="submitted" value="yes">
                <br>
                <h2>Delete your account?</h2>
                <p> WARNING! This will remove your account entirely and will cancel all your orders.</p> 
                <button type="button" onclick="redirectToDeleteAccount()">Delete Account</button>
            </form>
            </body>
            <%   }} %>
</html>
