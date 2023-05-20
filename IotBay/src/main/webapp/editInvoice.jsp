<%-- 
    Document   : editInvoice
    Created on : 19/05/2023, 6:47:06 PM
    Author     : Zoey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iotbay.group1.iotbay.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Invoice</title>
    </head>
    <body>
        <% int passedID = 999;
        String s = request.getParameter("id");
            try{passedID = Integer.parseInt(s);} catch(NumberFormatException ex){
            ex.printStackTrace();}
        User user = (User) session.getAttribute("User");
        if (user != null){
        int userID = user.getID(); 
        //UserCC card = InvoiceManager.getUserCC(userID);
        //UserCC card = new UserCC(9,"","","");
        Invoice current = InvoiceManager.getSingleInvoice(passedID);%>
        <h1>Edit Invoice</h1>
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
                <tr>
                    <form action="updateInvoice.jsp" method="POST">
                    <input type="hidden" name="type" value="invoice" readonly>
                    <td><input type="hidden" name="id" value="<%=current.getId()%>" readonly><%=current.getId()%></td>
                    <td><input type="date" name="date" value="<%=current.getDate()%>" ><%//=current.getDate()%></td>
                    <td><input type="number" step="0.01" name="amount" value="<%=current.getAmount()%>" ></td>
                    <td><input type="text" name="method" value="<%=current.getPayment_method()%>" ></td>
                    <td><input type="text" name="status" value="<%=current.getStatus()%>"></td>
                    <td><%=current.getCust_id()%></td>
                    <td><%=current.getOrder_id()%></td>
                    <%if (!current.getStatus().equals("PAID")){%><td><input type="submit" name="btn" value="Update" ><input type="submit" name="btn" value="Delete" ></form></td><%};%>
                </tr>          
</table>
                <h2><a href="invoiceList.jsp">Return to Invoice List</a></h2>

                <%} else{%>
        <p>You must be <a href=login.jsp?userType=Customer>logged in</a> to view this page</p>
        <% }%>
    </body>
</html>
