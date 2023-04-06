<%-- 
    Document   : Register Page
    Created on : 28 Mar 2023, 5:20:19 pm
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
          top: 45%;
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay Register</title>
    </head>
    <body>
        <div class="container">
            <div class="titlecenter">
                <h1>Internet of Things Bay</h1><br><br><br><br><br>
            </div>
            <div class="titlecenter">
                <h1>Register Page</h1>
            </div>
            <div class="textcenter">
                <form action="RegisterSuccess.jsp">
                    <label for="email">Email:</label><br><br>
                    <input type="email" id="email" name="email" required><br><br>
                    <label for="password">Password:</label><br><br>
                    <input type="password" id="password" name="password" required><br><br><br>
                    <input type="submit" id="submit" value="Submit">
                </form>
            </div>
        </div>
    </body>
</html>
