<%-- 
    Document   : updateInvoice
    Created on : 20/05/2023, 1:52:50 PM
    Author     : Zoey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iotbay.group1.iotbay.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating</title>
    </head>
    <body>
        <%
        //check user is logged in    
        User user = (User) session.getAttribute("User");
        if (user != null){
        int userID = user.getID();
        int passedID = 999;
        String s = request.getParameter("id");
            try{passedID = Integer.parseInt(s);} catch(NumberFormatException ex){
            ex.printStackTrace();}
        //checks the saved invoice for the submitted invoice ID is not paid and therefore should not be edited
        Invoice i = InvoiceManager.getSingleInvoice(passedID);
        if(!i.getStatus().equals("PAID")&&i.getCust_id()==userID){
            //uses the passed data to update the invoice
            if(request.getParameter("btn").equals("Update"))
        {
            Double passedAmount = i.getAmount();
            try{passedAmount = Double.parseDouble(request.getParameter("amount"));} catch(NumberFormatException ex){
                ex.printStackTrace();}
            i.setDate(request.getParameter("date"));
            i.setAmount(passedAmount);
            i.setPayment_method(request.getParameter("method"));
            i.setStatus(request.getParameter("status").toUpperCase());
            boolean r = InvoiceManager.updateInvoice(i);
            out.println(r);
       
        }
            //deletes invoice if delete button was clicked
            if(request.getParameter("btn").equals("Delete"))
        {
            boolean r = InvoiceManager.deleteInvoice(i);
            out.println(r);
        }
            response.sendRedirect("invoiceList.jsp");
        }
        
        %>
        <p>You are being redirected</p>
        <meta http-equiv = "refresh" content = "3; url =invoiceList.jsp " />

        <p><a href="invoiceList.jsp">Click here</a> to return to invoice list</p>
        <%} else{%>
        <p>You must be <a href=login.jsp?userType=Customer>logged in</a> to view this page</p>
        <% }%>
    </body>
</html>
