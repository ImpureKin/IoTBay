<%-- 
    Document   : Welcome Page
    Created on : 28 Mar 2023, 6:38:18 pm
    Author     : John
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
        .container {
          height: 700px;
          position: relative;
          border: 3px solid black;
        }

        .titlecenter {
          margin: 0;
          position: absolute;
          top: 30%;
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        
        .textcenter {
          height: 80px;
          margin: 0;
          position: absolute;
          top: 30%;
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay Welcome</title>
    </head>
    <body>
        <div class="container">
            <div class="textcenter">
                <h1>Welcome!</h1><br><br><br>
                <% 
                // get the user inputs
                String email = (String) session.getAttribute("registeredEmail");
                String password = (String) session.getAttribute("registeredPassword");
                %>
                <h2>
                    <%= "Email: " + email%><br><br><br>
                    <%= "Password: " + password%><br><br><br>
                    <a href="index.jsp">Logout</a>
                </h2>
            </div>
        </div>
    </body>
</html>
