<%@page import="java.util.List"%>
<%@page import="iotbay.group1.iotbay.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <style>
        .center {
                text-align: center;
            }

        .topnav input[type=text] {
                padding: 6px;
                border: none;
                margin-top: 8px;
                font-size: 17px;
                background-color: #e9e9e9;
              }
        /* Style the links inside the navigation bar */
        .topnav a {
          text-align: center;
          padding: 54px 146px;
        }
        </style>
        <title>IoTBay Item Catalogue</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <script>
            let count = 0;
        </script>
        <div class="center">
        <%
            Connection conn = DB.getConnection();
            List<Product> products = DB.getProducts(conn); 

            // Get User from the session
            User user = (User) session.getAttribute("User");

            // If a User exists, display appropriate home page allowing access to account, logs etc
            if (user != null) {
        %>
            <div class="topnav">
                <a href="invoiceList.jsp">My Invoices</a>
                <a href="view_logs.jsp">View Logs</a>
                <a href="index.jsp">Home</a>
                <a href="edit_user.jsp">My Account</a>
                <a href="logout.jsp">Logout</a>
            </div>
        <% } else { %>
            <div class="topnav">
                <a href="login.jsp?userType=Staff">Staff Login</a>
                <a href="register.jsp?userType=Staff">Staff Register</a>
                <a href="index.jsp">Home</a>
                <a href="login.jsp?userType=Customer">Customer Login</a>
                <a href="register.jsp?userType=Customer">Customer Register</a>
            </div>
        <% } %>
            <h1>
                Internet of Things Item Catalogue
            </h1>
            <h4>
                Search for the name of any product in the search bar below
            </h4>
            <div class="topnav">
                <input type="text" placeholder="Search..">
        </div>
<table>
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Sub-Category</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Add Item</th>
                    <th>Remove Item</th>
                    <th>Number of Items Selected</th>
                  </tr>
                </thead>
                <tbody>
                    <% for (Product product : products) { %>
                        <tr>
                            <td><%= product.getId() %></td>
                            <td><%= product.getName() %></td>
                            <td><%= product.getDescription() %></td>
                            <td><%= product.getCategory() %></td>
                            <td><%= product.getSubCategory() %></td>
                            <td><%= product.getPrice() %></td>
                            <td><%= product.getQuantity() %></td>
                            <td>
                                <button type="button" onClick=count++>+</button>
                            </td>
                            <td>
                                <button type="button"onClick=count-->-</button>
                            </td>
                            <td>
                                <script>
                                    document.write(count);
                                </script>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
          </table>
        </div>
    </body>
</html>