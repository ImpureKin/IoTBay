<%-- 
    Document   : invoiceList
    Created on : 17/05/2023, 7:25:49 PM
    Author     : Zoey
--%>


<%@page import="iotbay.group1.iotbay.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoices</title>
    </head>
    <body>
        <h1>Invoice History List</h1>
        <% 
            //DB db = new DB();
            //Connection conn = db.connectDB();

            User user = (User) session.getAttribute("User");
            if (user != null){
            int userID = user.getID();
            System.out.println("The user ID is "+userID);
            ArrayList<Invoice> list = InvoiceManager.getInvoices(userID);// a.getInvoices(userID);
            System.out.println("The size is "+list.size());
            if (list!=null){%>
        
        <table border='1' style='border-collapse:collapse'>
            <tr>
                <th>Invoice ID</th>
                <th>Date</th>
                <th>Amount</th>
                <th>Payment Method</th>
                <th>Status</th>
                <th>Customer ID</th>
                <th>Order ID</th>
            </tr>
            <%for(int i=0;i<list.size();i++){
                Invoice b = list.get(i);%>
                <tr>
                    <form action="editInvoice.jsp" method="POST">
                    <td><input type="hidden" name="id" value="<%=b.getId()%>" readonly><%=b.getId()%></td>
                    <td><%=b.getDate()%></td>
                    <td><%=b.getAmount()%></td>
                    <td><%=b.getPayment_method()%></td>
                    <td><%=b.getStatus()%></td>
                    <td><%=b.getCust_id()%></td>
                    <td><%=b.getOrder_id()%></td>
                    <td><input type="submit" value="View" ></form></td>
                </tr>
            <%}%>            
</table>
        <%} else{%>
        <h1>No Invoices Found</h1>
        <%};} else{%>
        <p>You must be logged in to view this page</p>
        <button>Cheat Button</button><% };%>
    </body>
</html>
