<%-- 
    Document   : view_logs
    Created on : 20/05/2023, 9:47:52 AM
    Author     : Big Pops
--%>

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
        DB db = new DB();
        Connection conn = db.getConnection();
        List<UserLog> userLogs;
        User user = (User) session.getAttribute("User");
        int userID = user.getID();
        String userType = (String) session.getAttribute("userType");
        
        String date = request.getParameter("date");
        if (date != null) {
            userLogs = db.getUserLogsByDate(conn, userType, userID, date);
        }
        else {
            userLogs = db.getUserLogs(conn, userType, userID);
        }
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
            <% for (UserLog log : userLogs) { %>
                <tr>
                    <td><%= log.getID() %></td>
                    <td>|</td>
                    <td><%= log.getLoginTimestamp() %></td>
                    <td>|</td>
                    <td><%= log.getLogoutTimestamp() %></td>
                    <td>|</td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <br>
    <a href="index.jsp">Go Back</a>
    </body>
</html>
