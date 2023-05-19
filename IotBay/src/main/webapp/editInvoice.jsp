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
            ex.printStackTrace();
        }
        User user = (User) session.getAttribute("User");
        int userID = user.getID(); 
        UserCC card = InvoiceManager.getUserCC(userID);
        Invoice current = InvoiceManager.getSingleInvoice(passedID);%>
        <h1>Edit Invoice</h1>
    
        <p>Passed Invoice number is <%=passedID%></p>
        <p>Is current null? the answer is <%=(current==null)%></p>
        <p>Retrieved Invoice number is <%=current.getId()%></p>
        <p>Retrieved Invoice amount is <%=current.getAmount()%></p>
         <table border='1' style='border-collapse:collapse'>
            <tr>
                <th>Invoice ID</th>
                <th>Date</th>
                <th>Amount</th>
                <th>Payment Method</th>
                <th>Status</th>
                <th>Customer ID</th>
                <th>Order ID</th>
                <th>CC number</th>
                <th>CC exp</th>
                <th>CCV</th>
            </tr>
                <tr>
                    <form action="editInvoice.jsp" method="POST">
                    <td><%=current.getId()%></td>
                    <td><input type="date" name="date" value="<%=current.getDate()%>" ><%//=current.getDate()%></td>
                    <td><input type="number" name="amount" value="<%=current.getAmount()%>" ></td>
                    <td><input type="text" name="method" value="<%=current.getPayment_method()%>" ></td>
                    <td><%=current.getStatus()%></td>
                    <td><%=current.getCust_id()%></td>
                    <td><%=current.getOrder_id()%></td>
                    <td><input type="text" name="CCNum" value="<%=card.getCCNumber()%>" ></td>
                    <td><input type="text" name="CCEx" value="<%=card.getCCExpiry()%>" ></td>
                    <td><input type="text" name="CCV" value="<%=card.getCCV()%>" ></td>
                    <%if (!current.getStatus().equals("PAID")){%><td><input type="submit" value="Update" ><input type="submit" value="Delete" ></form></td><%};%>
                </tr>
            <%//}%>            
</table>
        
    </body>
</html>
