<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
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
          margin: 0;
          position: absolute;
          top: 50%;
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        
        .notecenter {
          margin: 0;
          position: absolute;
          top: 70%;
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        
        .buttoncenter {
          margin: 0;
          position: absolute;
          top: 90%;
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        </style>
        <title>IoTBay Homepage</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    <div class="container">
        <div class="titlecenter">
              <h1>Welcome to the Internet</h1><br><br><br><br><br>
        </div>
        <div class="titlecenter">
            <h1>of Things Bay</h1>
        </div>
        <div class="textcenter">
            <form action="LoginCheck.jsp" method="post">
                <label for="email">Email:</label><br><br>
                <input type="email" id="email" name="email" required><br><br>
                <label for="password">Password:</label><br><br>
                <input type="password" id="password" name="password" required><br><br><br>
                <input type="submit" value="Submit">
            </form>
        </div>
        <div class="notecenter">
            <h3>Don't have an account yet?</h3>
        </div>
        <div class="buttoncenter">
            <button type="button" style="height:40px;width:100px" onClick="location.href='Register Page.jsp'">Register</button><br><br><br><br><br><br><br><br>
        </div>
    </div>
    </body>
</html>
