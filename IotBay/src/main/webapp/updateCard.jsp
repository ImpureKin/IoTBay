<%-- 
    Document   : updateCard
    Created on : 21/05/2023, 1:19:27 AM
    Author     : Zoey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iotbay.group1.iotbay.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saving Card Changes</title>
    </head>
    <body>
         <% 
        User user = (User) session.getAttribute("User");
        if (user != null){
        int userID = user.getID();
        UserCC c;
        if(request.getParameter("btn").equals("Update"))
        {
            c = new UserCC(userID,request.getParameter("CCNum"),request.getParameter("CCEx"),request.getParameter("CCV"));
             InvoiceManager.updateCard(c);
        }
        if(request.getParameter("btn").equals("Delete"))
        {
             c = new UserCC(userID,"","","");
             InvoiceManager.updateCard(c);
        }
        response.sendRedirect("index.jsp");
        %>
        <p>Passed button is <%=request.getParameter("btn")%></p>
        <p><a href="invoiceList.jsp">Click here</a> to return to invoice list</p>
        <%} else{%>
        <p>You must be <a href=login.jsp?userType=Customer>logged in</a> to view this page</p>
        <% }%>

    </body>
</html>
