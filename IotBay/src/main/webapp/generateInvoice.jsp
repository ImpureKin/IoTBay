<%-- 
    Document   : generateInvoice
    Created on : 20/05/2023, 10:46:27 PM
    Author     : Zoey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iotbay.group1.iotbay.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creating Invoice</title>
    </head>
    <body>
        <%
        //uses passed parameters to create a new Invoice (non strings must be parsed first)
        User user = (User) session.getAttribute("User");
        if (user != null){
            if(request.getParameter("btn").equals("Cancel")){%>
            <p>You Cancelled - <a href="invoiceList.jsp">Click here</a> to return to invoice list</p>
            <%}if(request.getParameter("btn").equals("Create")){
            int userID = user.getID();
        int passedID = 999;
        String s = request.getParameter("orderID");
            try{passedID = Integer.parseInt(s);} catch(NumberFormatException ex){
            ex.printStackTrace();}
            Double passedAmount = 999.0;
            try{passedAmount = Double.parseDouble(request.getParameter("amount"));} catch(NumberFormatException ex){
                ex.printStackTrace();}
            Invoice i = new Invoice(0,request.getParameter("date"),passedAmount,request.getParameter("method"),request.getParameter("status"),userID,passedID);
            if(InvoiceManager.createInvoice(i)){out.println("Invoice Created");}
            else{out.println("Invoice Failed");}}
            %>
        <p><a href="invoiceList.jsp">Click here</a> to return to invoice list</p>
        <%} else{%>
        <p>You must be <a href=login.jsp?userType=Customer>logged in</a> to view this page</p>
        <% }%>
    </body>
</html>
