<%-- 
    Document   : TEMPcreateInvoiceStart
    Created on : 20/05/2023, 9:31:25 PM
    Author     : Zoey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REPLACE THIS PAGE</title>
    </head>
    <body>
        <form action="createInvoice.jsp" method="post">
            <label>Order Number</label>
            <input type="number" name="orderID"><br>
            <label>Order Cost</label>
            <input type="number"step="0.01" name="cost"><br>
            <input type="submit" value="Submit" >
        </form>
    </body>
</html>
