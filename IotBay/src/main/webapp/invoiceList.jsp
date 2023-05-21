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
            //checks user is logged in

            User user = (User) session.getAttribute("User");
            if (user != null){
            int userID = user.getID();
            String btn = "";
            int idSearch = 0;
            String dateSearch = "";
            btn = request.getParameter("btn");
                //System.out.println("The btn is "+btn);
            //code for detecting if search button was used
            if(btn==null)btn="";
            if(btn.equals("Search"))
            {try{idSearch = Integer.parseInt(request.getParameter("idSearch"));} catch(NumberFormatException ex){
            ex.printStackTrace();} 
            dateSearch = request.getParameter("dateSearch");
            }
                //System.out.println("The user ID is "+userID);
            //gets all of the current user's invoices 
            ArrayList<Invoice> list = InvoiceManager.getInvoices(userID);
                //System.out.println("The size is "+list.size());
            if (list!=null){%>
            <!-- Buttons to navigate to New Invoice page and Card Details page -->
            <form action="TEMPcreateInvoiceStart.jsp" method="POST">
            <input type="submit" value="New Invoice">
        </form>
        <form action="viewCard.jsp" method="POST">
            <input type="submit" value="View Card Details">
        </form>
        <br>
            <form action="invoiceList.jsp" method="POST">
            <input type="text" name="idSearch" placeholder="ID Search">
            <input type="text" name="dateSearch" placeholder="Date Search">
            <input type="submit" name="btn" value="Search">
            <input type="submit" name="btn" value="Cancel" >
        </form>
        <br>
         <!-- Table to display obtained Invoices -->
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
                Invoice b = list.get(i);
                //if the search button was used filter the results
            if(btn.equals("Search")&&(idSearch!=0||!dateSearch.equals(""))){
                {//System.out.println("The idSearch is "+idSearch);
                //System.out.println("The dateSearch is "+dateSearch);
                //System.out.println("The invoice date is "+b.getDate());
                if(!(idSearch==b.getId()||dateSearch.contains(b.getDate())))
                {//System.out.println("The user ID is "+userID);
                    //if an obtained invoice does not match the search terms then skip to next
                continue;
                }}
}%>
                <!-- Table section displaying obtained invoice data -->
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
<br>
<button type="button" style="height:20px;width:75px" onClick="location.href='index.jsp'">Cancel</button>
        <%} else{%>
        <h1>No Invoices Found</h1>
        <%};} else{%>
        <p>You must be <a href=login.jsp?userType=Customer>logged in</a> to view this page</p>
        <% };%>
    </body>
</html>
