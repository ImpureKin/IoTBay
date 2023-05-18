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
        <% 
            DB db = new DB();
            Connection conn = db.connectDB();

            //User user = (User) session.getAttribute("User");
            //int userID = user.getID();
            InvoiceManager a = new InvoiceManager();
            ArrayList<Invoice> list = a.getInvoices(9);// a.getInvoices(userID);
            conn.close();
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
                    <td><%=b.getId()%></td>
                    <td><%=b.getDate()%></td>
                    <td><%=b.getAmount()%></td>
                    <td><%=b.getPayment_method()%></td>
                    <td><%=b.getStatus()%></td>
                    <td><%=b.getCust_id()%></td>
                    <td><%=b.getOrder_id()%></td>
                </tr>
            <%}%>            
        </table
        <%} else{%>
        <h1>No Invoices Found</h1>
        <%};%>
    </body>
</html>
