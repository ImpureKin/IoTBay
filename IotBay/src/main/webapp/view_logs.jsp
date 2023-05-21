<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="iotbay.group1.iotbay.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Logs</title>
    </head>
    <body>
    <%
        // Create connection to Database
        Connection conn = DB.getConnection();
        
        // Create list of user logs, get user, userID and userType from session
        List<UserLog> userLogs;
        User user = (User) session.getAttribute("User");
        int userID = user.getID();
        String userType = (String) session.getAttribute("userType");
        int count = 1;
        
        // Get date from page (if one is provided) then display logs based on date selection
        String date = request.getParameter("date");
        if (date != null) {
            userLogs = DB.getUserLogsByDate(conn, userType, userID, date);
        }
        else {
            userLogs = DB.getUserLogs(conn, userType, userID);
        }
        // Close connection to DB
        conn.close();
    %>
    <h1>User Logs</h1>
    <form action="view_logs.jsp" method="POST">
            <table>
                <tr>
                        <td><label for="date">Date:</label></td>
                        <td><input type="date" name="date"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Submit">
            <input type="hidden" name="submitted" value="yes">
    </form>
    <br>
    <table>
        <thead>
            <tr>--------------------------------------------------------------</tr>
            <tr>
                <th>No.</th>
                <th>|</th>
                <th>Login Timestamp</th>
                <th>|</th>
                <th>Logout Timestamp</th>
                <th>|</th>
            </tr>
        </thead>
        <tbody>
            <!--  Loop through list of userLogs and display relevant information -->
            <% for (UserLog log : userLogs) { %>
                <tr>
                    <td><%= count %></td>
                    <td>|</td>
                    <td><%= log.getLoginTimestamp() %></td>
                    <td>|</td>
                    <td><%= log.getLogoutTimestamp() %></td>
                    <td>|</td>
                </tr>
            <% count++;} %>
        </tbody>
    </table>
    <br>
    <a href="index.jsp">Go Back</a>
    </body>
</html>
