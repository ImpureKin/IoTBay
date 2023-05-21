<%-- 
    Document   : viewCard
    Created on : 21/05/2023, 12:21:12 AM
    Author     : Zoey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iotbay.group1.iotbay.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Card Details</title>
    </head>
    <body>
        <%
        //Gets users CC and prefills form
        User user = (User) session.getAttribute("User");
        if (user != null){
        int userID = user.getID(); 
        UserCC card = InvoiceManager.getUserCC(userID);
        %>
        <h2>Your Saved Card Details</h2>
<table border='1' style='border-collapse:collapse'>
            <tr>
                <th>CC number</th>
                <th>CC exp</th>
                <th>CCV</th>
            </tr>
                <tr>
                    <form action="updateCard.jsp" method="POST">
                        <input type="hidden" name="type" value="card" readonly>
                        <input type="hidden" name="id" value="<%=card.getUserId()%>" readonly>
                    <td><input type="text" name="CCNum" value="<%=card.getCCNumber()%>" ></td>
                    <td><input type="text" name="CCEx" value="<%=card.getCCExpiry()%>" ></td>
                    <td><input type="text" name="CCV" value="<%=card.getCCV()%>" ></td>
                    <td><input type="submit" name="btn" value="Update" ><input type="submit" name="btn" value="Delete" ></form></td>
                </tr>           
</table>
                    <br>
                    <p><a href=index.jsp>Go Back</a> to your account</p>
                <%} else{%>
        <p>You must be <a href=login.jsp?userType=Customer>logged in</a> to view this page</p>
        <% }%>
        
    </body>
</html>
