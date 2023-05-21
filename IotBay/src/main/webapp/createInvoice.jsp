<%-- 
    Document   : createInvoice
    Created on : 20/05/2023, 9:32:29 PM
    Author     : Zoey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iotbay.group1.iotbay.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a new Invoice</title>
    </head>
    <body>
        <%
        //prefills new invoice form with passed data from order form
        User user = (User) session.getAttribute("User");
        if (user != null){
        int userID = user.getID();
        int passedID = 999;
        double passedCost = 999;
        String s = request.getParameter("orderID");
            try{passedID = Integer.parseInt(s);} catch(NumberFormatException ex){
            ex.printStackTrace();}
        String x = request.getParameter("cost");
            try{passedCost = Double.parseDouble(x);} catch(NumberFormatException ex){
            ex.printStackTrace();}
        //InvoiceManager.getSingleInvoice(passedID);
        %>
<table border='1' style='border-collapse:collapse'>
            <tr>
                <th>Date</th>
                <th>Amount</th>
                <th>Payment Method</th>
            </tr>
                <tr>
                    <form action="generateInvoice.jsp" method="POST">
                    <td><input type="date" name="date" value="<%=java.time.LocalDate.now()%>" ></td>
                    <td><input type="number" step="0.01" name="amount" value="<%=passedCost%>" ></td>
                    <td><input type="text" name="method" value="Credit Card" ></td>
                    <input type="hidden" name="status" value="PENDING">
                    <input type="hidden" name="custID" value="<%=userID%>">
                    <input type="hidden" name="orderID" value="<%=passedID%>">
                    <td><input type="submit" name="btn" value="Create" ><input type="submit" name="btn" value="Cancel" ></form></td>
                </tr>          
</table>
        <%} else{%>
        <p>You must be <a href=login.jsp?userType=Customer>logged in</a> to view this page</p>
        <% }%>
    </body>
</html>
