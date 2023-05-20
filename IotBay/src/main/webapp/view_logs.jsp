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
        User user = (User) session.getAttribute("User");
        int userID = user.getID();
        String userType = (String) session.getAttribute("userType");
        List<UserLog> userLogs = db.getUserLogs(conn, userType, userID);
        conn.close();
    %>
    <h1>User Logs</h1>
    <table>
        <thead>
            <tr>
                <th>No.</th>
                <th>Login Timestamp</th>
                <th>Logout Timestamp</th>
            </tr>
        </thead>
        <tbody>
            <% for (UserLog log : userLogs) { %>
                <tr>
                    <td><%= log.getID() %></td>
                    <td><%= log.getLoginTimestamp() %></td>
                    <td><%= log.getLogoutTimestamp() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <br>
    <a href="home.jsp">Go Back</a>
    </body>
</html>
